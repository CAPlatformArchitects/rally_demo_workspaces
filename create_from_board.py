#!/usr/bin/python
import sys
import datetime
import json
import collections
from pprint import pprint
from pyral import Rally, rallyWorkset
import copy
import os
import argparse
from subprocess import call
import re

## get list of stories in Defined State
## if story found, execute workspace creation scripts
## set state to in-progress

## get list of workspaces in completed state
## archive workspace and move to accepted

##DONE Set Color
##TODO Validate User
##TODO Set up PID to ensure it doesn't execute multiple times : yes, set this up.
##TODO Set it up for multiple instances (sales, integrations, partners)

global rally
global pidfile

def close_pid():
	os.unlink(pidfile)
	return

def create_pid():
	global pidfile
	pidfile  = "/tmp/create_from_board.pid"
	pid = str(os.getpid())

	if os.path.isfile(pidfile):
		print "%s already exists, exiting" % pidfile
		sys.exit(1)

	file(pidfile, 'w').write(pid)

	return

def ws_name_match(name):
	match = re.match('[a-z]*.*[a-z]@ca.com[-]\d\d\d\d[-]\d\d[-][A-Z][a-z][a-z]', name)
	return match;

def workspace_exists(name):
	global rally
	workspaces = rally.getWorkspaces()
	for wksp in workspaces:
		if wksp.Name == name:
			return True

	return False

def isThisLastUser(objectID):

	criteria = 'ScheduleState = Completed'
	collection = rally.get('RevisionHistory', {"ObjectID" : objectID})
	assert collection.__class__.__name__ == 'RallyRESTResponse'
	if not collection.errors:
		for item in collection:
			print item.details()
			pprint(item)
	if collection.errors:
		print "error"
	return

### Add in check to ensure only the owner or admins are archiving stories
def archive_workspace():
	global rally
	error = False
	fields = "Name,Owner,State,FormattedID,oid,ScheduleState"
	criteria = '(ScheduleState = Completed) and (Ready = True)'
	collection = rally.get('Story', query=criteria)
        assert collection.__class__.__name__ == 'RallyRESTResponse'
        if not collection.errors:
            for story in collection:
		print story.details()
                name = '%s' % story.Name
		isThisLastUser(story.ObjectID)
		print "Archiving Workspace %s" % name
		if(workspace_exists(name)):
			archive_command = "/home/thomas/demo_env_ex2ra/bin/workspace_archive -s sales -n " + name
			print archive_command
			return_code = 0
                        return_code = call(archive_command, shell=True)
			if return_code:
				print "error occurred"
				error = True
				error_message = "failed to archive the workspace.  Please try again.  If this persists, contact the Platform Architects."
			if error:
				print "error found"
				task_update = {"FormattedID" : story.FormattedID, "Notes" : error_message, "ScheduleState" : "Completed", "DisplayColor" : "#ff0000"}
			else:
			        task_update = {"FormattedID" : story.FormattedID, "Notes" : "Workspace archived", "ScheduleState" : "Accepted", "DisplayColor" : "#000000"}

			print task_update
                        result = rally.post('Story', task_update)
		else:
			task_update = {"FormattedID" : story.FormattedID, "Notes" : "Workspace not found.  If this is in error, please contact the Platform Architects", "ScheduleState" : "Completed", "DisplayColor" : "#ff0000" }
			result = rally.post('Story', task_update)
	return

def getStoriesStateDefined():
	global rally
	error = False
	error_reason = ""
	admin_bypass = False
	fields = "Name,Owner,State,FormattedID,oid,ScheduleState,Expedite"
	criteria = 'ScheduleState = Defined'
	collection = rally.get('Story', query=criteria)
	#pprint(list)
	assert collection.__class__.__name__ == 'RallyRESTResponse'
	if not collection.errors:
            for story in collection:
                name = '%s' % story.Name
		#print story.Owner.UserName
		l_email = story.Owner.EmailAddress.lower()
		print l_email
		l_s_name = name.lower()
		print "lsname: %s \t l_email %s" % (l_s_name, l_email)
		if l_email == "thomas.mcquitty@ca.com" or l_email == "rich.feather@ca.com" or l_email == "jim.wagner@ca.com":
			admin_bypass = True
		if (l_s_name.find(l_email,0) == -1) and (story.Expedite == "False"):
			error = True
			error_message = "You are trying to create a workspace for another user or the format of the workspace is wrong" 
                        task_update = {"FormattedID" : story.FormattedID, "Notes" : error_message, "DisplayColor" : "#ff0000"}
                        result = rally.post('Story', task_update)
			print "Username does not match workspace name"
	
		#test for naming convention
		elif ws_name_match(name):
			print "Matched %s" % name
			error = False
			if workspace_exists(name):
				error = True
				error_reason = "A workspace named " + name + " already exists.  Please rename story and try again."
			else:
				import_command = "/home/thomas/demo_env_ex2ra/bin/import_setup -s sales -u thomas.mcquitty@acme.com -n " + name
				data_setup_command = "/home/thomas/demo_env_ex2ra/bin/data_setup -s sales -n " + name
				load_data_command = "/home/thomas/rally_python_tests/create_items.py sales " + name
				print import_command	
				return_code = 0
				print "Creaing workspace"
				return_code = call(import_command, shell=True)
				if return_code:
					error = True
					error_reason = "Error creating workspace.  Contact the Platform Architects for more assistance"
				print "command completed"
				print load_data_command	
				print "loading data"
				return_code = call(load_data_command, shell=True)
				if return_code:
					error = True
					error_reason = "Workspace data load error.  The workspace exists but may not be usable.  Archive this workspace and attempt again."
				print "command completed"
				print import_command
				print "Creating relationships"
				return_code = call(data_setup_command, shell=True)
				if return_code:
					error = True
					error_reason = "Workspace data was loaded.  Creation of dependencies, discussion items, etc., has failed.  You may want to archive and attempt again."
				print "command completed"

			if error:
				task_update = {'FormattedID' : story.FormattedID, 'Notes' : error_reason, "DisplayColor" : "#ff0000"}
			else:
				task_update = {'ScheduleState' : 'In-Progress', 'FormattedID' : story.FormattedID, "Notes" : "Workspace Created", "DisplayColor" : "" }

			print task_update
			result = rally.post('Story',task_update)

                else:
                        print "not matched %s" % name
			task_update = {"FormattedID" : story.FormattedID, "Notes" : "Workspace name does not match criteria for creation.  Names should be in the format -- first.last@acme.com-YEAR-MO-Mon as in thomas.mcquitty@acme.com-2017-08-Aug", "DisplayColor" : "#ff0000"}
			result = rally.post('Story', task_update)
	return

def main(args):
	global rally
	debug = 1
        #Parse Command line options
        parser = argparse.ArgumentParser("create_data")
        parser.add_argument("server", help="Server options = sales, integrations or partner", type=str)
        args = parser.parse_args()

	create_pid()

        print "server name is %s" % args.server
	server_name = args.server
	
	user_name = "thomas.mcquitty@acme.com"
	if (server_name == "integrations") or (server_name == "partners"):
		user_name = user_name.replace("@acme", "@" + server_name + ".acme")
	if debug:
		print "username is now " + user_name

        #server, user, password, apikey, workspace, project = rallyWorkset(options)
        try:
		rally = Rally('rally1.rallydev.com', user_name, 'Kanban!!', workspace="Workspace Requests", project='Requests')
        except Exception, details:
		print ("Error logging in")
		close_pid()
		sys.exit(1)


	rally.enableLogging('output.log')
	
	#updates the stories in the defined state
	getStoriesStateDefined()

	archive_workspace()

	os.unlink(pidfile)
	sys.exit(0)

if __name__ == '__main__':
        main(sys.argv[1:])
        sys.exit(0)
