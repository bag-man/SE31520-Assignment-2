"""
client.py
Usage:
  client.py (--user=<USER:PASS>) [-j]
  client.py (--user=<USER:PASS>) [--post=<POST_DATA>]
  client.py --help
Options:
  -h --help                        Display this help message
  -j --json                        Print raw JSON
  -p CONTENT,   --post  CONTENT    Make a new broadcast
  -u USER:PASS, --user  USER:PASS  Specify a username and password
"""

from docopt import docopt
import requests
import sys

def get(json):
    endpoint = 'http://localhost:3000/broadcasts.json'
    response = requests.get(endpoint, auth=('admin', 'taliesin'))
    data = response.json()

    if json:
        print(data)
    else:
        print('Formatted data')

def post(data):
    endpoint = 'http://localhost:3000/broadcasts'
    postdata = { 'content': data }
    response = requests.post(endpoint, auth=('admin', 'taliesin'), params=postdata)
    data = response.content
    # curl --user admin:talieson http://localhost:3000/broadcasts --data content=test > error.htm
    # InvalidAuthenticityToken
    print(data)

if __name__ == "__main__":
    args = docopt(__doc__)
    if args['--help']:
        print(args.help_message)
        sys.exit(0)
    if args['--post']:
        post(args['--post'])
    else:
        get(args['--json'])
