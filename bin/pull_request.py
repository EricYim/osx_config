#!/usr/bin/python

import sys
import argparse
import subprocess
import os
from Tkinter import *
import Tkinter
import tkMessageBox

# USERNAME = 'EricYim'
# ACCESS_TOKEN = '7bdf43eb84d00dc6e7c9ca26f1ac96a5817110d2'
# BASE_URI = ' https://api.github.com/repos/EricYim/github_api_testing'
USERNAME = 'eric-yim-iugo'
ACCESS_TOKEN = '8fb5cc6e0de92c07ef670b712a9a14763541e131'
BASE_URI = ' https://api.github.com/repos/iugomobile/knights_client'

CREDENTIALS = ' -u ' + USERNAME + ':' + ACCESS_TOKEN
POST_FLAG = ' -d'
PULL_REQUEST_ENDPOINT = '/pulls'

uri = BASE_URI + PULL_REQUEST_ENDPOINT

def create_pull_request(args):
    global uri
    global USERNAME
    global CREDENTIALS
    global POST_FLAG

    pull_request_title = args.title
    pull_request_head = args.head
    if not pull_request_head:
        pull_request_head = subprocess.check_output('git rev-parse --abbrev-ref HEAD', shell=True)[:-1]
    pull_request_head = USERNAME + ':' + pull_request_head
    pull_request_base = args.base
    pull_request_body = args.body

    pull_request_params = ' \'{"'
    if pull_request_body:
        pull_request_params += 'body":"{0}","'.format(pull_request_body)
    pull_request_params += 'title":"{0}","head":"{1}","base":"{2}"'.format(pull_request_title, pull_request_head, pull_request_base)
    pull_request_params += '}\''
    post_params = POST_FLAG + pull_request_params

    print 'curl' + CREDENTIALS + post_params + uri
    os.system('curl' + CREDENTIALS + post_params + uri)

def main(argv):
    parser = argparse.ArgumentParser(description='%(prog)s "pull request title" development -b "pull request description"')
    parser.add_argument("title", help="pull request title")
    parser.add_argument("-s", "--head", help="source branch")
    parser.add_argument("base", help="destination branch")
    parser.add_argument("-b", "--body", help="pull request contents", default="")
    args = parser.parse_args()
    create_pull_request(args)

if __name__ == "__main__":
    main(sys.argv[1:])    
