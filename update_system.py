#!/usr/bin/python
import sys
import datetime
import psycopg2
import json
import collections
from pprint import pprint
from pyral import Rally, rallyWorkset
import copy
import os
import argparse
import traceback

global rally
global server_name

story_project_ref = {}
story_ref = {}
testcase_ref = {}
defect_project_ref = {}
defect_ref = {}
portfolio_item_ref = {}
workspace_name = ""
requests_workspace = ""
requests_project = ""

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


def getItemType(FormattedID):
	"""
	Get Object Type from Formatted ID
	"""

        artifacts     = { 'US' : 'UserStory',
                          'TA' : 'Task',
                          'DE' : 'Defect',
                          'TC' : 'TestCase',
                          'T'  : 'PortfolioItemTheme',
                          'I'  : 'PortfolioItemInitiative',
                          'F'  : 'PortfolioItemFeature',
                          'DS' : 'DefectSuite',
                          'TF' : 'TestFolder'
                        }

        for key in artifacts:
                if key in FormattedID:
                        return artifacts[key]



	


def setInitialCycleDate():
	global rally
	global requests_workspace
	global requests_project

	response = rally.get("Story", query='CycleDay = null', workspace=requests_workspace, project=requests_project)
	if response.errors:
		pprint(response)

	for story in response:
		data = {"FormattedID" : story.FormattedID, "CycleDay" : 1}
		try:
			s = rally.update('UserStory',data, workspace=requests_workspace, project=requests_project)
		except Exception, details:
			print "Exception Details: %s" % details

def incrementCycleDate(UserStory):
	global rally
	global requests_workspace
	global requests_project

	pd("Updating CycleDay for {:5}".format(UserStory.FormattedID))
	out = UserStory.details()
	pd(out)
	
	UpdateCycleDay = UserStory.CycleDay + 1
	data = {"FormattedID" : UserStory.FormattedID, "CycleDay" : "{}".format(UpdateCycleDay)}
	try:
		rally.setWorkspace(requests_workspace)
		rally.setProject(requests_project)
		response = rally.update('UserStory', data)
	except Exception, details:
		print "Exception: %s" % details
		print "Story {:4} CycleDay {}".format(UserStory.FormattedID, UpdateCycleDay)
		traceback.print_exc()
		exit(1)

def getFormattedId(Name, Type):
	query = 'Name = "{}"'.format(Name)
	response = rally.get(Type, query=query)
	pprint(response)

"""
Adds new records to the system based upon the query from the database
"""
def addRecords(wksp, proj):

	items_added = 0
	query_text = "select * from updates where day = {} and work_type = 'add' order by formattedid, newentry desc;".format(story.CycleDay)
	my_query = query_qb(query_text)
	for item in my_query:
		pprint(item)
                debug = True
                pprint(item)
                pd("----Creating new value-----")
                data = {item["field"]: item["newvalue"], "Project" : item['project']}
                #pprint(data)
                pd(item["itemtype"])
                record = rally.create(item["itemtype"], data, project = item['project'], workspace=wksp)
                pd("ObjectID: %s  FormattedID: %s" % (record.oid, record.FormattedID))
                items_added += 1

	return items_added

def modifyRecords()
	pass

def performDailyUpdates():
	## We need to get the workspaces that have update_data flag set.
	## These are set in the user story that creates the workspace
	## Fields are CycleDay (integer, representing the day's change) and ProcessDailyChanges (boolean) to determine if the changes should run.
	## Find just the workspaces then process the fields for the day.

	debug = False
	response = rally.get("Story", query='ProcessDailyChanges = True AND ScheduleState = "In-Progress"', workspace=requests_workspace, project=requests_project)

	pd("getting records?")

	if response.errors:
		pprint(response)
		sys.exit(1)

	output_line = "{:40} {:10} {:15} {:13}".format("Workspace", "CycleDay", "ItemsUpdated", "ItemsAdded")
	print output_line
	for story in response:
		## Now it is time to start processing
		debug = False

		query_text = 'select * from updates where day = {} order by formattedid, newentry desc;'.format(story.CycleDay)
	        my_query = query_db(query_text)
		items_updated = 0
		items_added = 0
        	for item in my_query:
			#pprint(item)
		        rally.setWorkspace(story.Name)
	       		rally.setProject("Online Store")
			fields = "FormattedID,Name,oid,Project"
			if item['parent'] is not None:
				print "Parent Found"
				getFormattedId(item['parent'], item['parent_type'])
			elif item['newentry'] is not None:
				#print "new entry"
				q = 'Name = "{}"'.format(item['newentry'])
				updateItems = rally.get(item["itemtype"], query=q, projectScopeDown=True)
				pprint(updateItems)
				for upItem in updateItems:
					print "updating item"
					data = {"FormattedID" : upItem.FormattedID, item["field"]: item["newvalue"]}
					rally.update(item["itemtype"], data, project=upItem.Project.Name)
					items_updated += 1
        	        elif item['formattedid'] is not None:
				q = "FormattedID = {}".format(item["formattedid"])
				temp1 = rally.get(item["itemtype"], fetch=fields, query=q, projectScopeDown=True)
				temp = temp1.next()
	                	pd("Printing object")
				#pd(pprint(temp))
				pd(temp.Name)
	                	#pd(temp.details())
	        	        project = temp.Project.Name
				pd(project)
				pd("----updating record-----")
				data = {"FormattedID" : item["formattedid"], item["field"] : item["newvalue"]}
				try:
					record = rally.update(item["itemtype"] , data, project=project)
					pd("ObjectID: %s  FormattedID: %s" % (record.oid, record.FormattedID))
				except Exception, details:
					print "*** EXCEPTION ***"
					print "exception %s" % details
				items_updated += 1
			elif item["formattedid"] is None and item['field'] is not None:
				debug = True
				pprint(item)
				pd("----Creating new value-----")
				data = {item["field"]: item["newvalue"], "Project" : "Online Store"}
				#pprint(data)
				pd(item["itemtype"])
				record = rally.create(item["itemtype"], data)
				pd("ObjectID: %s  FormattedID: %s" % (record.oid, record.FormattedID))
				items_added += 1

		output_line = "{:40} {:8} {:14} {:13}".format(story.Name, story.CycleDay, items_updated, items_added)
		print output_line

		incrementCycleDate(story)

def db(database_name='daily_updates'):
    return psycopg2.connect("dbname=daily_updates user=readonly password=readonly host=localhost")

#Get the database values and store them into dictionary.
def query_db(query, args=(), one=False):
    cur = db().cursor()
    cur.execute(query, args)
    r = [dict((cur.description[i][0], value) \
               for i, value in enumerate(row)) for row in cur.fetchall()]
    cur.connection.close()
    return (r[0] if r else None) if one else r

def pd(arg):
	global debug

	if debug:
		print arg

def main(args):
	global rally
	global server_name
	global debug
	global requests_workspace
	global requests_project

	login_name = ""
	response = ""
	requests_workspace = "Workspace Requests"
	requests_project = "Requests"
	debug = False

	#Parse Command line options
        parser = argparse.ArgumentParser("update_system")
        parser.add_argument("--server", "-s", "--server", required=True, help="Server options = sales, integrations or partner", type=str)
        args = parser.parse_args()
	login_name = "thomas.mcquitty@acme.com"

        print "server name is %s" % args.server
	server_name = args.server

        valid_servers = ["integrations", "sales", "partners"]
	if server_name.lower() not in valid_servers:
		print "You have selected an invalid server.  Please use a valid option."
		sys.exit(1)

	if server_name == "integrations" or server_name == "partners":
		login_name = login_name.replace("@acme.com", "@" + server_name + ".acme.com")

	rally = Rally('rally1.rallydev.com', login_name, 'Kanban!!', workspace=requests_workspace, project=requests_project)
	if debug:
		rally.enableLogging('update_system.log')


	# There are no field defaults.  If the user does not specify 1 as the start date, we need to update the field to be "1"
	setInitialCycleDate()
	performDailyUpdates()

        sys.exit(0)

if __name__ == '__main__':
        main(sys.argv[1:])
        sys.exit(0)
