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
import traceback
from ConfigParser import SafeConfigParser

## get list of stories in Defined State
## if story found, execute workspace creation scripts
## set state to in-progress

## get list of workspaces in completed state
## archive workspace and move to accepted

#TODO Set color when starting a creation of workspace.
#TODO Set the archive so it will archive based upon ObjectID, not by name.
#TODO If the name is wrong, update the user story
#TODO Email if there's an error

global rally
global pidfile
global server_name
global debug
global workspace_names

def close_pid():
	os.unlink(pidfile)
	return

def create_pid():
	global pidfile
	pidfile  = "/tmp/create_from_board_" + server_name  + ".pid"
	pid = str(os.getpid())

	if os.path.isfile(pidfile):
		print "%s already exists, exiting" % pidfile
		sys.exit(1)

	file(pidfile, 'w').write(pid)

	return

def ws_name_match(name):
	match = False
	if (server_name == "sales"):
		match = re.match('[a-z]*.*[a-z]@ca.com[-]\d\d\d\d[-]\d\d[-][A-Z][a-z][a-z]', name)
	else:
		match = True  ##bypass naming conventions for Integrations and Partners... may revisit at a later time.
	return match;

def get_workspaceID(name):
        global rally
        global debug
        debug = 0
        print "GetWorksspaceID: Searching for workspace %s " % name
        workspaces = rally.getWorkspaces()
        for wksp in workspaces:
       		print wksp.Name
                if wksp.Name == name:
                      print "found workspace " + wksp.ObjectID
                      return wksp.ObjectID

        print "did not find workspace"
        return 0

def getWorkspaceNameByOID(objID):
	global rally
	global debug
	workspaces = rally.getWorkspaces()
	print "getWorkspaceNameByOID"
	print objID
	for wksp in workspaces:
			if wksp.ObjectID == objID:
				print "Found ObjectID"
				print "searching for " + objID
				print wksp.ObjectID
				return wksp.Name
	print "Workspace ObjectID not found"
	return False

def workspace_name_exists(name):
	global rally
	global debug
	debug = 0
	workspaces = rally.getWorkspaces()
	for wksp in workspaces:
		if debug == 1:
			print wksp.Name
		if wksp.Name == name:
			if debug:
				print "Found Workspace"
			return True
	print "Workspace not found"
	return False

def isThisLastUser(objectID):
	#currently looking at this... may be resource intensive... grr!
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
	global server_name
	error = False
	response = ""
	actual_name = ""
	fields = "Name,Owner,State,FormattedID,oid,ScheduleState,ObjectID"
	criteria = '((ScheduleState = "Completed") and (Ready = "True"))'
	collection = rally.get('Story', query=criteria)
        assert collection.__class__.__name__ == 'RallyRESTResponse'
        if not collection.errors:
            for story in collection:
		#print story.details()
                name = '%s' % story.Name
		objectID = story.ObjectID
		print "Story ID %s %s" % (story.FormattedID, name)
		print "Archiving Workspace %s" % name
		print "Archiving Workspace Object %s" % story.ObjectID
		#print story.details()
		print "Workspace OID : %s" % story.WorkspaceOID
		# This has to be done as the ruby scripts expect a human friendly name.
		# People are renaming their workspaces, so this means we need to reference the OID if it exists.
		# Otherwise the workspace will not be found.
		if(story.WorkspaceOID > 0):
			actual_name = getWorkspaceNameByOID(story.WorkspaceOID)
		else:
			actual_name = name
		if(workspace_name_exists(actual_name)):
			archive_command = 'ruby -W0 /home/thomas/demo_env_ex2ra/bin/workspace_archive -s ' + server_name + ' -n "' + name + '"'
			print archive_command
			return_code = 0
	                return_code = call(archive_command, shell=True)
			if debug:
				print "Return code is " + str(return_code)
			if return_code != 0:
				print "error occurred"
				error_message = "A possible error occurred while archiving.  Check to see if the workspace still exists, in not, please contact the Platform Architects."
				task_update = {"FormattedID" : story.FormattedID, "Notes" : error_message, "ScheduleState" : "Completed", "DisplayColor" : "#ff0000"}
			else:
			        task_update = {'FormattedID' : story.FormattedID, 'ScheduleState' : 'Accepted', 'DisplayColor' : '#000000', 'Notes' : 'Archving Workspace' }
				task_update = json.dumps(task_update)
			print "Updating Story on Kanban Board %s " % task_update
	                try:
				response = rally.post('Story', task_update)
				print response
			except Exception, details:
				#Sometimes the system errors out updating... so I am giving it another try
				task_update = {"FormattedID" : story.FormattedID, "ScheduleState" : "Accepted", "DisplayColor" : "#ffffff"}
				response = rally.post('Story', task_update)
		else:
			task_update = {"FormattedID" : story.FormattedID, "Notes" : "Workspace not found.  Moving to Accepted, due to not being found.  If this is in error, please contact the Platform Architects", "ScheduleState" : "Accepted", "DisplayColor" : "#ff0000" }
			print "Task details %s" % task_update
			result = rally.post('Story', task_update)
	return

def getStoriesStateDefined():
	global rally
	global server_name

	workspace_objectID = 0
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
                #print story.details()
		name = '%s' % story.Name
		owner = '%s' % story.Owner
		#	print story.Owner.EmailAddress
		#print "story owner: %s " % owner
		if owner == None:
			print "So owner defined, setting default"
			if (server_name != "sales"):
				email_address = "thomas.mcquitty@" + server_name + ".acme.com"
			else:
				email_address = "thomas.mcquitty@acme.com"
		else:
			print "Setting owner to " + story.Owner.UserName
			email_address = story.Owner.UserName
		#test for naming convention
		if ws_name_match(name):
			print "Matched %s" % name
			error = False
			if workspace_name_exists(name):
				error = True
				error_reason = "A workspace named " + name + " already exists.  Please rename story and try again."
			else:
				import_command = 'ruby -W0 /home/thomas/demo_env_ex2ra/bin/import_setup -s ' + server_name + ' -u ' + email_address + ' -n "' + name + '"'
				data_setup_command = 'ruby -W0 /home/thomas/demo_env_ex2ra/bin/data_setup -s ' + server_name + ' -n "' + name + '"'
				load_data_command = '/home/thomas/rally_python_tests/create_items.py -s ' + server_name + ' -n "' + name + '"'
				print import_command
				return_code = 0
				print "Creating workspace"
				task_update = {'FormattedID' : story.FormattedID, 'Notes' : 'Creating workspace... please stand by', "DisplayColor" : "#fff200"}
				result = rally.post('Story', task_update)
				return_code = call(import_command, shell=True)
				if return_code:
					print "Error creating workspace"
					error = True
					error_reason = "Error creating workspace.  Contact the Platform Architects for more assistance."
				print "command completed"
				print load_data_command	
				print "loading data - Changing color"
				return_code = call(load_data_command, shell=True)
				if return_code:
					print "error loading data"
					error = True
					error_reason = "Workspace data load error.  The workspace exists but may not be usable.  Archive this workspace and attempt again."
				print "command completed"
				print import_command
				print "Creating relationships"
				return_code = call(data_setup_command, shell=True)
				if return_code:
					print "error setting up data"
					error = True
					error_reason = "Workspace data was loaded.  Creation of dependencies, discussion items, etc., has failed.  You may want to archive and attempt again."
				print "command completed"
				if return_code:
					print "error occurred, skipping this record"
				workspace_objectID = get_workspaceID(name)

			if error:
				task_update = {'FormattedID' : story.FormattedID, 'Notes' : error_reason, "DisplayColor" : "#ff0000", "Workspace_OID" : workspace_objectID}
			else:
				task_update = {'ScheduleState' : 'In-Progress', 'FormattedID' : story.FormattedID, "Notes" : "Workspace Created", "DisplayColor" : "#3fa016", "Workspace_OID" : workspace_objectID }

			print task_update
			result = rally.post('Story',task_update)

                else:
                        print "not matched %s" % name
			task_update = {"FormattedID" : story.FormattedID, "Notes" : "Workspace name does not match criteria for creation.  Names should be in the format -- first.last@ca.com-YEAR-MO-Mon as in thomas.mcquitty@ca.com-2017-08-Aug", "DisplayColor" : "#ff0000"}
			result = rally.post('Story', task_update)
	return

def main(args):
	global rally
	global server_name
	global debug
	debug = 1
        #Parse Command line options
        parser = argparse.ArgumentParser("create_data")
        parser.add_argument("server", help="Server options = sales, integrations or partner", type=str)
        args = parser.parse_args()
	server_name = args.server.lower()
	create_pid()
	config = SafeConfigParser()
	config.read('config.ini')
	user_name 	= config.get('main','username')
	password 	= config.get('main','password')
	workspace 	= config.get('main','workspace')
	project		= config.get('main','project')
	rally_server		= config.get('main','server')

	print user_name, password, workspace, project, rally_server

        print "server name is %s" % server_name
	
	#user_name = "thomas.mcquitty@acme.com"
	if (server_name != "sales"):
		user_name = user_name.replace("@acme", "@" + server_name + ".acme")
	if debug:
		print "username is now " + user_name

        #server, user, password, apikey, workspace, project = rallyWorkset(options)
        try:
		rally = Rally(rally_server, user_name, password, workspace=workspace, project=project)
        except Exception, details:
		print ("Error logging in")
		close_pid()
		sys.exit(1)


	rally.enableLogging('create_output.log')
        print "Checking for workspaces to archive"
        archive_workspace()
	#updates the stories in the defined state
	print "Checking for New workspaces"
	getStoriesStateDefined()
	print "Complete!"
	os.unlink(pidfile)
	sys.exit(0)

if __name__ == '__main__':
	try:
	        main(sys.argv[1:])
	except Exception, details:
		close_pid()
		print "Details of error %s" % details
		print "Exception occurred... cleaning up."
		sys.exit(1)
        sys.exit(0)
