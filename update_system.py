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
import re

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

"""
Get Object Type from Formatted ID
"""
def getItemType(FormattedID):

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

	return False

"""
Increment the value on the user story
"""
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

"""
Returns the formatted ID
In some cases, we only know the name of the item, so we search for the name
We need to know the object type and name.
"""
def getFormattedId(Type, Name, wksp, proj):
	pd ("Entering get formatted id Type: {}, Name: {}".format(Type, Name))

	query = 'Name = "{}"'.format(Name)
	response = rally.get(Type, query=query, workspace=wksp, project=proj)
	if not response.errors:
		item = response.next()
		return item.FormattedID

	pd("ending at getformattedid()")

	return False

"""
Do we have a formattedid?

We need to check to see if the value is a proper formattedId
They cannot have spaces
They must be in the US121 format
They cannot have trailing spaces
They cannot have trailing letters
They must start with one of the known identifiers
If they pass those tests, they are a formatted id
"""
def isFormattedId(value):

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

        # Whitespace check
        if re.search('\s', value):
                return False
	# Start with a number?
        if re.match('\d', value):
                return False

        for key in artifacts:
		# Does it match a KEY DIGIT format?
                matchstring = key + "\d{1,}"
                if re.match(matchstring, value):
			#Are there trailing non-digit values?
                        matchstring = key + "\d{1,}\D"
                        if re.match(matchstring, value):
                                return False
			# All checks passes, it must be a FormattedID
                        return True

        return False

"""
getObjectRef -- get the ref for object
"""
def getObjectRef(workspace, project, parentType, formattedId):
	global rally

        record_query = "FormattedID = {}".format(formattedId)
	pd(record_query)
	items = rally.get(parentType, project=project, workspace=workspace, query=record_query, projectScopeDown=True)
	item = items.next()
	return item.ref


"""
GetProjectRef -- Get the .ref for the project
"""
def getProjectRef(wksp, proj):
	global rally
        try:
		rally.setWorkspace(wksp)
                value = rally.getProject("Shopping Team").ref
        except Exception, details:
                sys.stderr.write("ERROR: %s \n" % details)
                sys.exit(1)

	return value

"""
Adds new records to the system based upon the query from the database

There will need to be an exception for Tasks, which require a project and user story or defect
If we are working on a task:  Check for a parent.  If no parent, skip.  Tasks must have parents.
	If there's a parent, get the FormattedID and Project.  Attach to the task Object.
"""
def addRecords(wksp, proj, story):
	global rally
	global debug
	debug = True

	pd(wksp)
	items_added = 0
	query_text = "select * from updates where day = {} and work_type = 'add' order by formattedid desc;".format(story.CycleDay)
	my_query = query_db(query_text)
	for item in my_query:
                debug = True
                pd("----Creating new value-----")
		#pprint(item)
		proj = item['project']
		rly_obj = item['itemtype']
		fieldname = item["field"]
		fieldvalue = item["newvalue"]
		parentFormattedId = ""

		output_line =  "Workspace: {:40} Project: {:30} Object: {:10} Field: {:10} NewValue: {:10} Parent: {}".format(wksp, proj, rly_obj, fieldname, fieldvalue, item['parent'])
		pd (output_line)
		if rly_obj == "Task" and item['parent'] is None:
			# We can't process this... display a message, process next record
			print "Can't process: Task: {} Day: {} due to missing parent".format(fieldvalue, item['day'])
			continue
		if rly_obj == "Task":
			# we have a task.  Fill out the object properly.
			# Tasks Must have:
			#		WorkProduct as UserStory.ref
			#		Project same as UserStoryProject.ref
			# Is the parent a formatted id?  If so, do the update.
			# If the parent a name?  If so, get the formattedid
			parent = item['parent']

			#Not a formatted Id, let's get one.
			if not isFormattedId(parent):
				pd("Searching for parent")
				parentFormattedId = getFormattedId(item['parent_type'], parent, wksp, proj)
				print "ParentFormattedId {}".format(parentFormattedId)
				if parentFormattedId == False or parentFormattedId is None:
					print "Cannot find a {} named {}...skipping".format(item['parent_type'], parent)
					continue
				else:
					parent = parentFormattedId
			pd("PARENT ID IS {}".format(parent))
			#getObjectRef(workspace, project, parentType, formattedId):
			parentRef = getObjectRef(wksp, proj, item['parent_type'], parent)
			#data = {fieldname : fieldvalue, 'Project': proj, 'WorkProduct' : ref}
			data = {fieldname : fieldvalue, 'Project': getProjectRef(wksp,proj), 'WorkProduct' : parentRef }
		else:
                	data = {fieldname : fieldvalue}
		pprint(data)
                #record = rally.create(rly_obj, data, project=proj, workspace=wksp)
		try:
			record = rally.create(rly_obj, data, project=proj, workspace=wksp)
		except Exception, details:
			print "Exception"
			print details
			traceback.print_exc()
		try:
		        pd("ObjectID: %s  FormattedID: %s" % (record.oid, record.FormattedID))
		except Exception, details:
			pass
                items_added += 1

	pd("Completed Processing addRecord")
	return items_added

"""
Modify Records - To Modify Existing Records
"""
def modifyRecords(story):

	pd("Enterying modify records")
	items_modified = 0
	wksp 		= story.Name
	proj 		= "Online Store"
        query_text 	= "select * from updates where day = {} and work_type = 'modify' order by formattedid desc;".format(story.CycleDay)
        my_query = query_db(query_text)

        for item in my_query:

                rally.setWorkspace(wksp)
		rally.setProject(proj)

		output_line = "Updating record: {:5} field: {:15} value{}".format(item['formattedid'], item['field'], item['newvalue'])
		pd(output_line)

		record_query = "FormattedID = {}".format(item["formattedid"])
		fields       = "FormattedID,Name,oid,Project"
		temp1 = rally.get(item["itemtype"], fetch=fields, query=record_query, projectScopeDown=True)
		temp = temp1.next()

	      	pd("Printing object")
		pd(temp.Name)
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
		items_modified += 1

	return items_modified

def linkRecords():
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
		items_added = 0
		items_added 	= addRecords(story.Name, "Shopping Team", story)
		items_updated  	= modifyRecords(story)

		output_line = "{:40} {:8} {:14} {:13}".format(story.Name, story.CycleDay, items_updated, items_added)
		print output_line

		exit(1)

		"""
		debug = False

		query_text = 'select * from updates where day = {} order by formattedid desc;'.format(story.CycleDay)
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
		"""

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
