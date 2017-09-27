#!/usr/bin/python
import sys
import datetime
import psycopg2
import json
import openpyxl
import collections
from pprint import pprint
from pyral import Rally, rallyWorkset
import copy
import os
import argparse

global rally
global server_name

story_project_ref = {}
story_ref = {}
testcase_ref = {}
defect_project_ref = {}
defect_ref = {}
portfolio_item_ref = {}
workspace_name = ""


user_names = {}
project_names = {}
debug = 0

# get the first instance of a user
## Get's a user ref for Rally
## First time, it will query the system and add it to the dictionary
## Subsequent calls will have cached user information, speeding up the system
def getUserRef(user_name):
    global rally
    global server_name
    global debug

    # If we need to work on another instance, say integration or partners, we need to change the email address of the users
    if server_name == "integrations" or server_name == "partners":
	user_name = user_name.replace("@acme.com", "@" + server_name + ".acme.com")

    if debug:
        print(user_names.items())
    
    if user_name in user_names:
        if debug:
            print("Found %s" % user_name)
        value = user_names[user_name]
    else:
        if debug:
            print("Adding name %s " %user_name)
        value = rally.getUserInfo(username=user_name).pop(0).ref
        user_names[user_name] = value
        
    return value

#Get the database values and store them into dictionary.
def query_db(query, args=(), one=False):
    cur = db().cursor()
    cur.execute(query, args)
    r = [dict((cur.description[i][0], value) \
               for i, value in enumerate(row)) for row in cur.fetchall()]
    cur.connection.close()
    return (r[0] if r else None) if one else r


def main(args):
	global rally
	global server_name
	global debug
	login_name = ""
	response = ""
	requests_workspace = "Workspace Requests"
	requests_project = "Requests"

	#Parse Command line options
        parser = argparse.ArgumentParser("create_data")
        parser.add_argument("--server", "-s", "--server", required=True, help="Server options = sales, integrations or partner", type=str)
        parser.add_argument("--workspace_name", "-n", "--name", required=True, help="Name of the workspace to update")
        args = parser.parse_args()
	login_name = "thomas.mcquitty@acme.com"

        print "server name is %s" % args.server
        print "workspace name is %s" % args.workspace_name
	workspace_name = args.workspace_name
	server_name = args.server

        valid_servers = ["integrations", "sales", "partners"]
	if server_name.lower() not in valid_servers:
		print "You have selected an invalid server.  Please use a valid option."
		sys.exit(1)
	
	if server_name == "integrations" or server_name == "partners":
		login_name = login_name.replace("@acme.com", "@" + server_name + ".acme.com")

	rally = Rally('rally1.rallydev.com', login_name, 'Kanban!!', workspace=requests_workspace, project=requests_project)
	print "logged in"
	#rally.enableLogging('output.log')

	## We need to get the workspaces that have update_data flag set.
	## These are set in the user story that creates the workspace
	## Fields are CycleDay (integer, representing the day's change) and ProcessDailyChanges (boolean) to determine if the changes should run.
	## Find just the workspaces then process the fields for the day.
	#rally.SetWorkspace(requests_workspace)
	#rally.SetProject(reqeusts_project)
	response = rally.get("Story", query="((ProcessDailyChanges = True) and (ScheduleState = 'In-Progess'))", workspace=requests_workspace, project=requests_project)
	print "getting records?"
	if response.errors:
		print "Errors in processing"
		sys.exit(1)
	story = response.next()
	print story.details()

	## Now it is time to start processing

	data = {"FormattedID" : "TA64", "State" : "In-Progress"}
	response = rally.update("Task" , data)


if __name__ == '__main__':
        main(sys.argv[1:])
        sys.exit(0)
