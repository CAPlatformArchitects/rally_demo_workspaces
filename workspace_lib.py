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
import smtplib
from email.mime.text import MIMEText
import time


global rally
global pidfile
global server_name
global rally_server
global debug
global user_name
global password
global workspace
global project
global workspace_names
global api_key
global exe_path
global email_server
global email_from
global email_password
global email_to
global email_enabled

def read_config():
        global rally
        global server_name
        global debug
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

	email_enabled 	= ""
	email_from 	= ""
	email_to	= ""
	email_password	= ""
	email_server	= ""
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
        if config.has_option('config','email_enabled'):
                email_enabled   = config.get('config','email_enabled')
       		if config.has_option('config','email_server'):
                	email_server	= config.get('config','email_server')
	       	if config.has_option('config','email_from'):
        	        email_from      = config.get('config','email_from')
	       	if config.has_option('config','email_pass'):
        	        email_password  = config.get('config','email_pass')
	       	if config.has_option('config','email_to'):
        	        email_to        = config.get('config','email_to')
	if debug:
        	print "Email Config : %s %s %s %s" % (email_server, email_from, email_to, email_enabled)

def login():
	global rally
	global server_name
	global debug
	global user_name
	global password
	global workspace
	global project
	global workspace_names
	global rally_server
	global api_key
	global exe_path

	user_name 	= ""
	password 	= ""
	workspace 	= ""
	project 	= ""
	api_key 	= ""
	rally_server 	= ""
	
	read_config()

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

def send_email_error(error_msg):
	## TODO: Add Error Checking
	global email_server
	global email_from
	global email_password
	global email_to
	global email_enabled

	if email_enabled != "true" or email_enabled == "":
		return

	print "Email Config : %s %s %s %s %s" % (email_server, email_from, email_password, email_to, email_enabled)
	print error_msg

	msg = MIMEText(error_msg)
	msg['Subject'] 	= "Error processing Workspace"
	msg['From'] 	= email_from
	msg['To']	= email_to

	s = smtplib.SMTP_SSL(host = email_server)
	#s.starttls()
	s.login(email_from, email_password)
	s.set_debuglevel(0)
	s.sendmail(email_from, email_to, msg.as_string())
	s.quit()


