#!/usr/bin/env python3

import csv
import base64
from dotenv import load_dotenv
import json
import os
import requests

load_dotenv()
login = os.getenv("LOGIN")
url = os.getenv("URL")
project_key = os.getenv("PROJECT_KEY")

encoded_auth = base64.b64encode(login.encode()).decode()

response_filter = "?fields=id, key, name, lead.displayName"

url += response_filter

params = {
    "jql": f"project={project_key}"
}

headers = {
    "Authorization": f"Basic {encoded_auth}",
    "Accept": "application/json"
}


response = requests.get(url, params=params, headers=headers)

json_response = response.json()

# json_load = json.loads(json_response)

for issue in json_response["issues"]:
    print(issue)

# file = csv.writer(open("outpu.csv", "wb+"))
# file.writerow([""])