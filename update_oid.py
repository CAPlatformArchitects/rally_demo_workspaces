#!/usr/bin/python2.7
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

##DONE Set Color
##TODO Validate User
##DONE Set up PID to ensure it doesn't execute multiple times : yes, set this up.
##DONE Set it up for multiple instances (sales, integrations, partners)

global rally
global pidfile
global server_name
global debug

def close_pid():
	os.unlink(pidfile)
	return

def create_pid():
	global pidfile
	pidfile  = "/tmp/update_oid_" + server_name  + ".pid"
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
	print "Searhcing for workspace %s " % name
	if (workspace_exists(name)):
		workspaces = rally.getWorkspaces()
		for wksp in workspaces:
			if wksp.Name == name:
				print "found workspace " + wksp.ObjectID
				return wksp.ObjectID

	print "did not find workspace"
	return 0

def workspace_exists(name):
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

def getStoriesStateDefined():
	global rally
	global server_name

	error = False
	error_reason = ""
	admin_bypass = False
	fields = "Name,Owner,State,FormattedID,oid,ScheduleState,Expedite"
	criteria = '((ScheduleState = In-Progress) AND (Workspace_OID = ""))'
	workspace_objectID = 0
	collection = rally.get('Story', query=criteria)
	assert collection.__class__.__name__ == 'RallyRESTResponse'
	if not collection.errors:
            for story in collection:
		name = '%s' % story.Name
		owner = '%s' % story.Owner
		if ws_name_match(name):
			print "Matched %s" % name
			error = False
			workspace_objectID = get_workspaceID(name)
			if workspace_objectID > 0:
				print "found workspace objectid -- " + workspace_objectID
				task_update =  {"ObjectID" : story.ObjectID, "Workspace_OID" : workspace_objectID}
        	                #task_update = json.dumps(task_update)
	                        result = rally.post('Story', task_update)
				print "Completed update"
			else:
				print "did not find workspace"
				task_update = {"ObjectID" : story.ObjectID, "DisplayColor" : "#990099", "Notes" : "Your workspace cannot be found.  Perhaps you renamed it?  If so, please rename it back to the original format."}
				result = rally.post('Story', task_update)

                else:
                        print "not matched %s" % name
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
	user_name 	= config.get(server_name,'username')
	password 	= config.get(server_name,'password')
	workspace	= config.get(server_name,'workspace')
	project		= config.get(server_name,'project')
	rally_server	= config.get(server_name,'server')
	

        print "server name is %s" % args.server
	print "username is now " + user_name

        #server, user, password, apikey, workspace, project = rallyWorkset(options)
        try:
		rally = Rally(rally_server, user_name, password, workspace=workspace, project=project)
        except Exception, details:
		print ("Error logging in")
		close_pid()
		sys.exit(1)


	rally.enableLogging('create_output.log')
	
	#updates the stories in the defined state
	print "Checking for New workspaces"
	getStoriesStateDefined()

	os.unlink(pidfile)
	sys.exit(0)

if __name__ == '__main__':
	try:
	        main(sys.argv[1:])
	except Exception, details:
		close_pid()
		print "Details of error %s" % details
		traceback.print_exc()
		print "Exception occurred... cleaning up."
		sys.exit(1)
        sys.exit(0)
