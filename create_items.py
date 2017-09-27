#!/usr/bin/python2.7
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
from ConfigParser import SafeConfigParser
global rally
global server_name

## TODO: Convert all the lookups to use the cached information
## DONE: Adjust the command line so the environment can be passed
## DONE: Import the data again, this time using an order field, then order the query
## 

## Since we are creating all the objects, perhaps if we log them it will be faster.  The information will be cached and we won't need to make additional queries
## This will save on server performance and make the script faster
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

## Get's a project ref for Rally
## First time, it will query the system and add it to the dictionary
## Subsequent calls will have cached information, speeding up the system
def getProjectRef(project_name):
    global rally
    global project_names
    
    if debug:
        print("Items:\n")
        print(project_names.items())
    
    #let's build a list of project names and reference ids, so we don't have to query the system each time.
    if project_name in project_names:
        if debug:
            print("Found %s" % project_name)
        value = project_names[project_name]
    else:
        if debug:
            print("Adding name %s " %project_name)
        try:
		value = rally.getProject(project_name).ref
        	project_names[project_name] = value
	except Exception, details:
	        sys.stderr.write("ERROR: %s \n" % details)
       		sys.exit(1)
		
    return value

def getIterationRef(piName):
    global rally

    if debug:
        print "Getting Iteration" 

    collection = rally.get('Iteration')
    assert collection.__class__.__name__ == 'RallyRESTResponse'
    if not collection.errors:
            for pe in collection:
                name = '%s' % pe.Name
                if debug:
                    print pe.Name
                if(name == piName):
                    #print pe.oid, pe.Name
                    return pe.oid

def getPortfolioItemInitiativeRef(piName):
    global rally
 
    if debug:
        print "Getting Initiative Ref"

    collection = rally.getCollection("https://rally1.rallydev.com/slm/webservice/v2.0/portfolioitem/initiative?")
    assert collection.__class__.__name__ == 'RallyRESTResponse'
    if not collection.errors:
            for pe in collection:
                name = '%s' % pe.Name
                if(name == piName):
                    #print pe.oid, pe.Name
                    return pe.oid

def getPortfolioItemThemeRef(piName):
    global rally
 
    if debug:
        print "Getting Theme Ref"

    collection = rally.getCollection("https://rally1.rallydev.com/slm/webservice/v2.0/portfolioitem/theme?")
    assert collection.__class__.__name__ == 'RallyRESTResponse'
    if not collection.errors:
            for pe in collection:
                name = '%s' % pe.Name
                if(name == piName):
                    #print pe.oid, pe.Name
                    return pe.oid

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

def getPreliminaryEstimateRef(object_value):
    global rally
    if debug:
        print "Getting Prelim Estiamte"

    collection = rally.getCollection("https://rally1.rallydev.com/slm/webservice/v2.0/preliminaryestimate?")
    #pprint(collection)
    assert collection.__class__.__name__ == 'RallyRESTResponse'
    if not collection.errors:
            for pe in collection:
                name = '%s' % pe.Name
                if(name == object_value):
                    #print pe.ref, pe.Name, pe.oid
                    return pe.ref

def getReleaseRef(object_value):
    global rally

    if debug:
        print "Getting Release Data"
    collection = rally.get('Release')
    #pprint(collection)
    assert collection.__class__.__name__ == 'RallyRESTResponse'
    if not collection.errors:
            for pe in collection:
                name = '%s' % pe.Name
                if(name == object_value):
                    #print pe.ref, pe.Name, pe.Project
                    return pe.ref

def getUserStoryRef(object_value):
    global rally
    debug = 0
    if debug:
        print "Getting User Story Data"
    #print "Scope is : " + rally.getProject().Name
    args = {"projectScopeDown" : "True", "Project" : "Online Store"}
    collection = rally.get('UserStory', kwargs=args)
    #pprint(collection)
    assert collection.__class__.__name__ == 'RallyRESTResponse'
    if not collection.errors:
            for pe in collection:
                name = '%s' % pe.Name
                if debug:
                    print pe.Name, pe.Project
                if(name == object_value):
                    #print pe.ref, pe.Name, pe.Project
                    return pe.ref

def getTestFolderRef(object_value):
    global rally

    if debug:
        print "Getting User Story Data"
    collection = rally.get('TestFolder')
    #pprint(collection)
    assert collection.__class__.__name__ == 'RallyRESTResponse'
    if not collection.errors:
            for pe in collection:
                name = '%s' % pe.Name
                if debug:
                    print pe.Name
                if(name == object_value):
                    #print pe.ref, pe.Name, pe.Project
                    return pe.ref

def getTestCaseRef(object_value):
    global rally
    debug = 0
    if debug:
        print "Getting TestCase Data"
    collection = rally.getCollection('https://rally1.rallydev.com/slm/webservice/v2.0/testcase?')
    #pprint(collection)
    assert collection.__class__.__name__ == 'RallyRESTResponse'
    if not collection.errors:
            for pe in collection:
                name = '%s' % pe.Name
                if debug:
                    print pe.Name
                if(name == object_value):
                    #print pe.ref, pe.Name,
                    return pe.ref

def myconverter(o):
    if isinstance(o, datetime.datetime):
	out = o.__str__()
	out =  out.replace(" ", "T")
        return out

def db(database_name='rally_data'):
    return psycopg2.connect("dbname=rally_data user=readonly password=readonly host=localhost")

#Get the database values and store them into dictionary.
def query_db(query, args=(), one=False):
    cur = db().cursor()
    cur.execute(query, args)
    r = [dict((cur.description[i][0], value) \
               for i, value in enumerate(row)) for row in cur.fetchall()]
    cur.connection.close()
    return (r[0] if r else None) if one else r

def getUserStoryRefByName(name):
	debug = 0
	if debug:
		print "debug mode userstoryrefbyname"
                print "searching for user story name %s" % name
	ref = story_ref[name] if story_ref.get(name) else False
	if ref == False:
		pprint(story_ref)
		sys.stderr.write("Error finding user story reference... something has gone wrong")
		sys.exit(1)
	if debug:
		print "found user story ref %s" % ref
	return ref

def getTestCaseRefByName(name):
        debug = 0
	if debug:
                print "debug mode test case refbyname"
                print "searching for user story name %s" % name
        ref = testcase_ref[name] if testcase_ref.get(name) else False
        if ref == False:
                pprint(testcase_ref)
                sys.stderr.write("Error finding test case reference... something has gone wrong")
                sys.exit(1)
        if debug:
                print "found test case ref"
        return ref

# When creating a task, the project needs to be filled in.  We get that from the user story.
def getProjectRefFromUserStoryName(name):
        debug = 0
	if debug:
                print "debug mode projectreffromstoryname"
		print "searching for user story name %s" % name
        ref = story_project_ref[name] if story_project_ref.get(name) else False
        if ref == False:  #Let's check the defect log before we error out
	       pprint(story_project_ref)
	       sys.stderr.write("Error finding project ref from user story reference... something has gone wrong")
	       sys.exit(1)
        if debug:
                print "found test case ref"
        return ref

"""
This determines which fields need to be translated due to being a reference value. 
If found, substitute the text with the real value
"""
def replace_values(val, object_type):
	debug = 0
	#print "replace values for "
	#print val
	#print " item type: " + object_type
	if debug:
		print val

	if object_type == "Task":
		if debug:
			print "we need to get a project in the task object from the story object"
                val['project'] = getProjectRefFromUserStoryName(val['workproduct'])
		val['workproduct'] = getUserStoryRefByName(val['workproduct'])
		#print "Workproduct %s project %s" % (val['workproduct'], val['project'])
	if val.get("testcase"):
		if debug:
			print "checking for testcase"
		val["testcase"] = getUserStoryRefByName(val["testcase"])
        if val.get("testfolder"):
                if debug:
                        print "checking for testfolder"
                val["testfolder"] = getTestFolderRef(val["testfolder"])

        if val.get("requirement"):
                if debug:
                        print "checking for requirement"
                val["requirement"] = getUserStoryRefByName(val["requirement"])
        if val.get("iteration"):
                if debug:
                        print "checking for iteration"
                val["iteration"] = getIterationRef(val["iteration"])
	if val.get("portfolioitem"):
		if debug:
			print "checking for parent on user story"
		if object_type == "Story":
			val["portfolioitem"] = getPortfolioItemFeatureRef(val["portfolioitem"])
        if val.get("release"):
                if debug:
                        print "checking for release"
                val["release"] = getReleaseRef(val["release"])
	if val.get("project") and (object_type != "Task"):
		if debug:
                        print "checking for project"
                val["project"] = getProjectRef(val["project"])
	if val.get("workproduct") and (object_type != "Task"):		#Work product on non tasks can be a user story, so let's look that up.
		if debug:
                        print "checking for workproduct"
                val["workproduct"] = getUserStoryRefByName(val["workproduct"])  
	if val.get("owner"):
		if debug:
			print "getting user"
	 	val["owner"] = getUserRef(val["owner"])
        if val.get("preliminaryestimate"):
                if debug:
                        print "getting prelim estimate"
                val["preliminaryestimate"] = getPreliminaryEstimateRef(val["preliminaryestimate"])
        if val.get("parent"):		# Parent can mean different objects, depending on where it is referenced.  So we determine the type and replace it.
                if debug:
                        print "getting parent for " + object_type + "\n"
		if object_type == "Initiative":
			val["parent"] = getPortfolioItemThemeRef(val["parent"]) 
		if object_type == "Feature":
			val["parent"] = getPortfolioItemInitiativeRef(val["parent"]) 
        if val.get("state") :
                if debug:
                        print "getting state"
		if object_type == "Initiative":
			val["state"] = rally.getState('Initiative', val["state"]).ref
		if object_type == "Feature":
			val["state"] = rally.getState('Feature', val["state"]).ref
                if object_type == "Theme":
                        val["state"] = rally.getState('Theme', val["state"]).ref


"""
We need to clear out none/nulls from the json output.
"""
def scrub(x):
    # Converts None to empty string
    ret = copy.deepcopy(x)
    # Handle dictionaries, lits & tuples. Scrub all values
    if isinstance(x, dict):
        for k, v in ret.items():
            ret[k] = scrub(v)
    if isinstance(x, (list, tuple)):
        for k, v in enumerate(ret):
            ret[k] = scrub(v)
    # Handle None
    if x is None:
        ret = ''
    # Finished scrubbing
    # Scrub out listing_order from dataset
    return ret

"""
Empty keys cause a problem with Rally, so let's clean them out.
"""
def remove_empty_keys(x):
	empty_keys = [k for k,v in x.iteritems() if not v]
	for k in empty_keys:
    		del x[k]
	#this was added in to make user story numbers (and other objects) import in a specific order.
	if 'listing_order' in x:
		del x['listing_order']

def main(args):
	global rally
	global server_name
	global debug
	login_name = ""
	
	#Parse Command line options
        parser = argparse.ArgumentParser("create_data")
        parser.add_argument("--server", "-s", "--server", required=True, help="Server options = sales, integrations or partner", type=str)
        parser.add_argument("--workspace_name", "-n", "--name", required=True, help="Name of the workspace to update")
        args = parser.parse_args()
        workspace_name = args.workspace_name
        server_name = args.server


	config = SafeConfigParser()
	config.read('config.ini')
	rally_server 	= config.get(server_name,'server')
	login_name 	= config.get(server_name,'username')
	password	= config.get(server_name,'password')

	#login_name = "thomas.mcquitty@acme.com"

        print "server name is %s" % args.server
        print "workspace name is %s" % args.workspace_name

        valid_servers = ["integrations", "sales", "partners"]
	if server_name.lower() not in valid_servers:
		print "You have selected an invalid server.  Please use a valid option."
		sys.exit(1)
	
	if server_name == "integrations" or server_name == "partners":
		login_name = login_name.replace("@acme.com", "@" + server_name + ".acme.com")

	rally = Rally(rally_server, login_name, password, workspace=workspace_name, project='Online Store')
	#rally.enableLogging('output.log')

	objects = ["Release", "Iteration", "Theme", "Initiative", "Feature", "Story", "Defect", "TestFolder", "TestSet", "TestCase", "TestCaseStep", "TestCaseResult", "Task"]

	for item_type in objects:
		item_text = "%s" % item_type
		print "Processing " + item_text + "..."
		query_text = "select * from " + item_text + " order by listing_order asc;"
		my_query = query_db(query_text)
		#process each item.  We will have to do substitution for values that are references in the data, like projects and user names
		for item in my_query:
			item = scrub(item)
			replace_values(item, item_text)	
			remove_empty_keys(item)  	#remove empty keys, they cause an issue when loading and Rally expects a value.
			output = json.dumps(item, default = myconverter)
			output = json.loads(output)
			try:
				if debug:
					print output
					print "creating object " + item_text + "\n\n"
				record = rally.create(item_text, output)
				#pprint(record)
				debug = 0
				#build array of stories, defects, testsets and test cases for quick reference
				if (item_text == "Story") or (item_text == "Defect") or (item_text == "TestSet") or (item_text == "TestCase"):
					if debug:
						print "Debugging???"
						print "Name %s story ref %s Project %s " % (record.Name, record.ref, record.Project.ref)
					story_project_ref[record.Name] = record.Project.ref
					story_ref[record.Name] = record.ref
				# Build array of feature, themes and initiatives added to the workspace
				if(item_text == "Theme") or (item_text == "Initiative") or (item_text == "Feature"):
					if debug:
						print "adding to theme list"
						print "Name %s portfolio ref %s" % (record.Name, record.ref)
					portfolio_item_ref[record.Name] = record.ref
			except Exception, details:
				sys.stderr.write("error creating %s\n\n" % item_text)
				sys.stderr.write("ERROR: %s \n" % details)
				sys.exit(1)
			debug = 0

if __name__ == '__main__':
        main(sys.argv[1:])
        sys.exit(0)
