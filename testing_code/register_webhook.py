import json
import requests
from requests.auth import HTTPDigestAuth
import pprint

url = "https://rally1.rallydev.com/apps/pigeon/api/v2/webhook"
headers = {"Cookie" : "ZSESSIONID=_rPhQSEkQmyCZgXa4EmVBploeDYNUOJj8hAtl9Nyo0", "Content-Type": "application/json"}
payload = '{"AppName": "1McQuitty", "AppUrl": "www.mcquitty.com","Name":"My first webhook","TargetUrl":"http://www.mcquitty.net/ready/to/receive/post", "ObjectTypes": ["HierarchicalRequirement"],"Expressions": [{"AttributeName": "ScheduleState","Operator":      "=","Value":         "In-Progress"}]}'

json_payload=json.dumps(payload)

myresponse = requests.get(url, headers=headers)
pprint.pprint(myresponse.json())
myresponse = requests.post(url, headers=headers, data=json_payload)
pprint.pprint(myresponse.json())

