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
from ConfigParser import SafeConfigParser
from datetime import datetime, timedelta
import time

global rally
global server_name
global user_name
global password
global workspace
global project
global workspace_names
global rally_server
global api_key
global exe_path
global email_server
global email_from
global email_password
global email_to
global email_enabled
global debug
global days_back

debug = 0

"""
   
WARNING:   This was hacked together and set up to do some quick and 
        dirty work.  Please make no judgements on the quality of the  
        code.

"""



def read_config():
        global rally
        global server_name
        global debug
        global user_name
        global password
        global workspace
        global project
        global rally_server
        global api_key
        global exe_path
        global email_server
        global email_from
        global email_password
        global email_to
        global email_enabled
        global debug
        global days_back

        email_enabled   = ""
        email_from      = ""
        email_to        = ""
        email_password  = ""
        email_server    = ""
        config = SafeConfigParser()
        config.read('config.ini')
        if config.has_option(server_name,'username'):
                user_name       = config.get(server_name,'username')
        if config.has_option(server_name,'password'):
                password        = config.get(server_name,'password')
        if config.has_option(server_name,'workspace'):
                workspace       = config.get(server_name,'workspace')
        if config.has_option(server_name,'project'):
                project         = config.get(server_name,'project')
        if config.has_option(server_name,'api_key'):
                api_key         = config.get(server_name,'api_key')
        if config.has_option(server_name,'server'):
                rally_server    = config.get(server_name,'server')
        if config.has_option('config','directory'):
                exe_path        = config.get('config','directory')
        if config.has_option('config','archive_days_back'):
                days_back       = config.get('config','archive_days_back')
        if config.has_option('config','email_enabled'):
                email_enabled   = config.get('config','email_enabled')
                if config.has_option('config','email_server'):
                        email_server    = config.get('config','email_server')
                if config.has_option('config','email_from'):
                        email_from      = config.get('config','email_from')
                if config.has_option('config','email_pass'):
                        email_password  = config.get('config','email_pass')
                if config.has_option('config','email_to'):
                        email_to        = config.get('config','email_to')

def login():
        global rally
        global server_name
        global debug
        global user_name
        global password
        global workspace
        global project
        global rally_server
        global api_key
        global exe_path

        user_name       = ""
        password        = ""
        workspace       = ""
        project         = ""
        api_key         = ""
        rally_server    = ""

        read_config()

	print "Workspace %s" % workspace
        try:
                if api_key == "":
                        print "Login/password connection"
                        rally = Rally(rally_server, user_name, password, workspace=workspace, project=project)
                if api_key != "":
                        print "API connection"
                        rally = Rally(rally_server, apikey=api_key, workspace=workspace, project=project)
        except Exception, details:
                print ("Error logging in")
                send_email_error("Error logging in")
                close_pid()
                sys.exit(1)



def main(args):
        global rally
        global server_name
        global debug
        global user_name
        global password
        global workspace
        global project
        global rally_server
        global api_key
        global exe_path
        global user_name
        global rally_server
	global workspace
	global days_back
 
	login_name = ""
	response = ""

	#Parse Command line options
        parser = argparse.ArgumentParser("create_data")
        parser.add_argument("--server", "-s", "--server", required=True, help="Server options = sales, integrations or partner", type=str)
        args = parser.parse_args()
        print "server name is %s" % args.server
	server_name = args.server
	login()
	if debug:
		rally.enableLogging('remove_old_stories.log')

	workspace_name = workspace
	
	back = float(days_back)
	ts = datetime.today() - timedelta(days=back)
	
	strTime =  ts.strftime('%Y-%m-%d')
	#st = datetime.fromtimestamp(ts).strftime('%Y-%m-%d')
	print "Cleaning back to %s " % strTime

	query="(AcceptedDate < " + strTime + ")"
	print query
	response = rally.get("Story", query=query, workspace=workspace, project=project)
	if response.errors:
		print "Errors in processing"
		sys.exit(1)
	for story in response:
		print "deleting %s" % story.FormattedID
		story_details = {'FormattedID' : story.FormattedID}
		rally.delete('Story', story.FormattedID)

if __name__ == '__main__':
        main(sys.argv[1:])
        sys.exit(0)
