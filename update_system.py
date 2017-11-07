#!/usr/bin/python
import sys
import datetime
import psycopg2
import json
import collections
import logging
import copy
import os
import argparse
import traceback
import re
from pprint import pprint
from pyral import Rally, rallyWorkset

global rally
global server_name

"""
   
WARNING:   This was hacked together and set up to do some quick and 
        dirty work.  Please make no judgements on the quality of the  
        code.

"""


#
# Setting up Logger
#
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)
handler = logging.FileHandler('daily_updates.log')
handler.setLevel(logging.INFO)
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
handler.setFormatter(formatter)
# add the handlers to the logger
logger.addHandler(handler)

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
user_stories = {}



def printAllUserStories():
    pd("Dictionary Length: {}".format(len(user_stories)))
    for item in user_stories:
	print(item)

def getAllUserStories():
    global rally
    count = 0
    user_stories.clear()

    collection = rally.getCollection("https://rally1.rallydev.com/slm/webservice/v2.0/hierarchicalrequirement?fetch=true&pagesize=600")
    assert collection.__class__.__name__ == 'RallyRESTResponse'
    if not collection.errors:
            for pe in collection:
                count += 1
                user_stories[pe.FormattedID] = dict([('FID', pe.FormattedID), ('Name', pe.Name), ('ref', pe.ref), ('oid', pe.oid), ('Project', pe.Project.Name)])
    pd("Count {}",format(count))

def getUserStoryRefByName(name):
    if len(user_stories) == 0:
		getAllUserStories()
    for name, value in user_stories.iteritems():
        for x,y in value.iteritems():
           if x == 'FID' and y == name:
		#print value['ref'], value['FID']
                return value['ref']

def getProjectByStoryName(name):
	if len(user_stories) == 0:
		getAllUserStories()
	for name, value in user_stories.iteritems():
		for x,y in value.iteritems():
			if x == 'Project' and y == name:
				#print value['Project'], value['FID']
				return value['Project']

"""
get the first instance of a user
Get's a user ref for Rally
First time, it will query the system and add it to the dictionary
Subsequent calls will have cached user information, speeding up the system
"""
def getUserRef(user_name):
    global rally
    global server_name
    global debug

    # If we need to work on another instance, say integration or partners, we need to change the email address of the users
    if server_name == "integrations" or server_name == "partners":
	user_name = user_name.replace("@acme.com", "@" + server_name + ".acme.com")

    if user_name in user_names:
        value = user_names[user_name]
    else:
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
			pd("Exception Details: %s" % details)

def incrementCycleDate(UserStory):
	global rally
	global requests_workspace
	global requests_project

	pd("Updating CycleDay for {:5}".format(UserStory.FormattedID))

	UpdateCycleDay = UserStory.CycleDay + 1
	data = {"FormattedID" : UserStory.FormattedID, "CycleDay" : "{}".format(UpdateCycleDay)}
	try:
		rally.setWorkspace(requests_workspace)
		rally.setProject(requests_project)
		response = rally.update('UserStory', data)
	except Exception, details:
		pd("Exception: %s" % details)
		pd("Story {:4} CycleDay {}".format(UserStory.FormattedID, UpdateCycleDay))
		pd(traceback.print_exc())

def getUserStoryFormattedId(Type, Name, wksp, proj):
	pd ("Entering get Get User Story formatted id Type: {}, Name: {} Workspace: {} Project: {}".format(Type, Name, wksp, proj))

	query = 'Name = "{}"'.format(Name)
	pd("Query is: {}".format(query))

	rally.setProject(proj)
	rally.setWorkspace(wksp)
	pprint(rally.getProject().Name)
	pd ("Entering get formatted id Type: {}, Name: {} Workspace: {} Project: {}".format(Type, Name, wksp, proj))
	args = {"projectScopeDown" : 'True', "projectScopUp" : "True"}

	response = rally.get(Type, query=query, project=proj, projectScopeDown=True, kwargs=args)
	for item in response:
		if debug:
			pprint(response)
		pd( "UserStory FormattedID : {} Name: {} Workspacee: {} Project {}".format(item.FormattedID, item.Name, item.Workspace.Name, item.Project.Name))
		if item.Name == Name:
			pd( "Found!! Story Name {} Search Name {} ::: FormattedID {}".format(item.Name, Name, item.FormattedID))
			return item.FormattedID


	pd("Could not find UserStory with name {}".format(Name))
	pprint(response)
	pd("ending at getformattedid()")

	return False



"""
Returns the formatted ID
In some cases, we only know the name of the item, so we search for the name
We need to know the object type and name.
"""
def getFormattedId(Type, Name, wksp, proj):
	pd ("Entering get formatted id Type: {}, Name: {} Workspace: {} Project: {}".format(Type, Name, wksp, proj))

	query = 'Name = "{}"'.format(Name)
	pprint (query)
	
	rally.setWorkspace(wksp)
	rally.setProject(proj)
	pd ("Entering get formatted id Type: {}, Name: {} Workspace: {} Project: {}".format(Type, Name, wksp, proj))
	response = rally.get(Type, query=query, projectScopeDown=True)
	for item in response:
		pprint(response)
		pd("FormattedID : {}".format(item.FormattedID))
		return item.FormattedID

	pprint(response)
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
getParentObjectRef -- get the ref for object
"""
def getParentObjectRef(workspace, project, parentType, formattedId):
	global rally

	project = 'Online Store'  #The system needs to search all the objects.
        record_query = "FormattedID = {}".format(formattedId)
	pd("getParentObjectRef wksp: {} proj: {} parentType: {} Id: {}".format(workspace, project, parentType, formattedId))
	pd(record_query)

	items = rally.get(parentType, project=project, workspace=workspace, query=record_query, projectScopeDown=True)
	for item in items:
		return item.ref

	pd( "Error getting Parent Ref Object")
	return False

def getObjectRefByFormattedId(object_type, formattedId):
    global rally
    global debug
    debug = 0

    if not isFormattedId(formattedId):
	pd("Error, no formatted id provided")
	return

    pd( "Getting Object Ref by FormattedID {} {}".format(object_type, formattedId) ) 

    collection = rally.get(object_type, projectScopeUp=True, projectScopeDown=True)
    assert collection.__class__.__name__ == 'RallyRESTResponse'
    if not collection.errors:
            for pe in collection:
                fId = '%s' % pe.FormattedID
                pd(pe.FormattedID)
                if(fId == formattedId):
                    pd('Found: {} {}'.format(pe.oid, pe.FormattedID))
                    return pe.ref

def getObjectRefByName(object_type, value, project):
    global rally
    global debug
    debug = 1

    pd( "Getting Object Ref by Name {} {}".format(object_type, value) )
    rally.setProject(project)
    collection = rally.get(object_type)
    assert collection.__class__.__name__ == 'RallyRESTResponse'
    if not collection.errors:
            for pe in collection:
                name = '%s' % pe.Name
		project = '%s' % pe.Project.Name
                pd(pe.Name)
                if(name == value):
                    pd('Found: {} {}'.format(pe.oid, pe.Name))
                    return pe.oid

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
	query_text = "select * from updates where day = {} and work_type = 'add' order by (case when field='Name' then 0 else 1 end), formattedid desc;".format(story.CycleDay)
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
			#getParentObjectRef(workspace, project, parentType, formattedId):
			parentRef = getParentObjectRef(wksp, proj, item['parent_type'], parent)
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
			sys.exit(1)
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
		formattedId = ""
		output_line = "Updating record: {:5} field: {:15} value: {} proj: {} wksp: {}".format(item['formattedid'], item['field'], item['newvalue'], proj, wksp)
		pd(output_line)
		if not isFormattedId(item['formattedid']):
			formattedId = getId(item['itemtype'], item['formattedid'], wksp, proj)
		else:
			formattedId = item['formattedid']

		record_query = "FormattedID = {}".format(formattedId)

		#record_query = "FormattedID = {}".format(item["formattedid"])
		#record_query = "FormattedID = {}".format(item['formattedid'])
		fields       = "FormattedID,Name,oid,Project"
		temp1 = rally.get(item["itemtype"], fetch=fields, query=record_query, projectScopeDown=True)
		temp = temp1.next()

	      	pd("Object {}".format(temp.Name))
	        project = temp.Project.Name
		pd(project)
		pd("----updating record-----")


		value = getRef(item['field'], item['newvalue'], item['itemtype'], project)
		logging.info("Value is: {}".format(value))
		if item['field'] == 'PortfolioItem/Feature':
			data = {"FormattedID" : formattedId, 'PortfolioItem' : value}
		else:
			data = {"FormattedID" : formattedId, item["field"] : value}
		pd(data)
		try:
			record = rally.update(item["itemtype"] , data, project=project)
			pd("ObjectID: %s  FormattedID: %s" % (record.oid, record.FormattedID))
		except Exception, details:
			logger.info("Exception %s" % details)
			logger.info(output_line)
		items_modified += 1

	return items_modified

"""
getRef -- A clearing house!

getRef is used to capture all the fields that require a .ref value.
Rather than getting everything by looking it up in the update code,
we simply call this and it will return the .ref value, if needed.
This means we can call this on any value and it will return .refs or
the actual value.
"""
def getRef(field, value, object_type, project):
	global rally
	global debug
	debug = True

	portfolio_items = { 'PortfolioItem/Theme' : 'Theme',
			    'PortfolioItem/Initiative' : 'Initiative',
			    'PortfolioItem/Feature' : 'Feature'
			  }
	pd("Object Type: {}  Field: {}  Value: {}".format(object_type, field, value))

	if field == 'State' and object_type in portfolio_items:
		return rally.getState(portfolio_items[object_type], value).ref

	if field == 'Parent':
		if object_type == 'Initiative':
			pass
		if object_type == 'Feature':
			pass

	if field == 'Iteration':
		pd('Entering Iteration')
		return getObjectRefByName(field, value, project)

	##TODO TEST THIS!!
	if field == 'Release':
		pd('Entering Release')
		return getObjectRefByName(field, value, project)

	if field == 'Project':
		return rally.getProject(value).ref

        if field == 'Requirement':
		return getUserStoryRefByName(value)

	if field == 'Owner':
		return getUserRef(value)

	if field == 'PortfolioItem/Feature':
		pd("Getting Feature Ref")  ## Works for name, not FID... add check for this.
		if not isFormattedId(value):
			return getPortfolioItemFeatureRef(value)
		else:
			return getPortfolioItemFeatureRefByFId(value)

	if field == 'PortfolioItem/Initiative':
		pd("Getting Initiative Ref")
		if isFormattedId(value):
			pass
		else:
			pass

	if field == 'PortfolioItem/Theme':
		pd("Getting Theme Ref")
		if isFormattedId(value):
			pass
		else:
			pass

	if field == 'TestCase':
		pd("Getting TestCase Ref")
		if isFormattedId(value):
			pass
		else:
			pass

	if field == 'TestFolder':
		pd("Getting TestFolder Ref")
		if isFormattedId(value):
			pass
		else:
			pass

	if field == 'TestCaseResult':
		pd("Getting TestCaseResult Ref")
		if isFormattedId(value):
			pass
		else:
			pass

	if field == 'TestSet':
		pd("Getting Initiative Ref")
		if isFormattedId(value):
			pass
		else:
			pass


	return value


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

def getReleaseRef(object_value, proj):
    global rally

    if debug:
        print "Getting Release Data"
    #collection = rally.get('Release')
    collection = rally.getCollection("https://rally1.rallydev.com/slm/webservice/v2.0/release?fetch=true")
    assert collection.__class__.__name__ == 'RallyRESTResponse'
    if not collection.errors:
          for pe in collection:
                name = '%s' % pe.Name
                if name == object_value :
                    return pe.ref

"""
GetID - Returns a formattedid or null

It tests to see if we have a formattedid, if so return it.
If it is not a formattedid, search for it.  Return None or 
the formatted id.
"""
def getId(objectType, field, wksp, proj):
	
	if isFormattedId(field):
		return field
	else:
		return getFormattedId(objectType, field, wksp, proj)

	return None


def linkRecords(wksp, proj, story):
	global rally

        pd("Entering Linking Records")
        items_modified = 0
        wksp            = story.Name
        query_text      = "select * from updates where day = {} and work_type = 'link' order by formattedid desc;".format(story.CycleDay)
	parentFormattedId = ""
	childFormattedID 	= ""
	itemFormattedId= ""
        my_query = query_db(query_text)





	## We need to link items.  Get the types loaded up, set up the data field submit
        for item in my_query:


		rally.setWorkspace(wksp)
		rally.setProject(proj)

		parentFormattedId = getId(item['parent_type'], item['parent'], wksp, proj)
		itemFormattedId = item['child']

		pd( "Item ID: {} Parent ID: {}".format(itemFormattedId, parentFormattedId))

		if itemFormattedId == False or parentFormattedId == False:
			sys.exit(1)

		parentRef = getObjectRefByFormattedId(item['parent_type'], parentFormattedId) 
		pd("Parent Ref: {}".format(parentRef))

		if item['itemtype'] == 'Task': 
			print "Tasks are linked when they are created.  We don't move them to other objects"
			pass

		if item['itemtype'] == 'UserStory':
			pass

		if item['itemtype'] == 'PortfolioItem/Feature':
			getPortfolioItemFeatureRef(item['parent'])
			pass

		if item['itemtype'] == 'PortfolioItem/Initiative':
			pass

		if item['itemtype'] == 'PortfolioItem/Theme':
			pass


def getPortfolioItemFeatureRef(piName):
    global rally
 
    if debug:
        print "Getting Feature Ref"

    collection = rally.getCollection("https://rally1.rallydev.com/slm/webservice/v2.0/portfolioitem/feature?")
    #pprint(collection)
    assert collection.__class__.__name__ == 'RallyRESTResponse'
    if not collection.errors:
            for pe in collection:
                name = '%s' % pe.Name
                if debug:
                    print pe.Name
                if(name == piName):
                    if debug:
                        print "Feature Found"
                    #print pe.oid, pe.Name
                    return pe.oid

def getPortfolioItemFeatureRefByFId(piName):
    global rally
 
    if debug:
        print "Getting Feature Ref"

    collection = rally.getCollection("https://rally1.rallydev.com/slm/webservice/v2.0/portfolioitem/feature?fetch=true")
    #pprint(collection)
    assert collection.__class__.__name__ == 'RallyRESTResponse'
    if not collection.errors:
            for pe in collection:
                name = '%s' % pe.FormattedID
                if debug:
                    print pe.Name
                if(name == piName):
                    if debug:
                        print "Feature Found"
                    #print pe.oid, pe.Name
                    return pe.oid

def modifyAltRecords():
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

		#rally.setWorkspace('testing')
		#rally.setProject('Online Store')
		#getAllUserStories()
		#printAllUserStories()
		
		debug = 1
		pd("--------")
		pd("Adding New Entries")
		pd("--------")
		#items_added 	= addRecords(story.Name, "Online Store", story)
		pd("--------")
		pd("Updating Entries")
		pd("--------")
		#items_updated  	= modifyRecords(story)
		pd("--------")
		pd("Linking Entries")
		pd("--------")
		#items_linked	= linkRecords(story.Name, 'Online Store', story)

		#output_line = "{:40} {:8} {:14} {:13}".format(story.Name, story.CycleDay, items_updated, items_added)
		#print output_line
		
		
		#exit(1)

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
	return

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
	logging.info(arg)

def main(args):
	global rally
	global server_name
	global debug
	global requests_workspace
	global requests_project

	logger.info('Starting')
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

	logger.info('Closing')
        sys.exit(0)

if __name__ == '__main__':
        main(sys.argv[1:])
        sys.exit(0)

