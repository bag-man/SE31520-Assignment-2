"""
client.py
Usage:
  client.py (--user=<USER:PASS>) [-j]
  client.py (--user=<USER:PASS>) [(--post=<POST_DATA> [-eARft])]
  client.py --help
Options:
  -h --help                        Display this help message
  -j --json                        Print raw JSON
  -e --email                       Use email feed
  -A --Atom                        Use Atom feed
  -R --RSS                         Use RSS feed
  -f --facebook                    Use facebook feed
  -t --twitter                     Use twitter feed
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

def post(data, feeds):
    endpoint = 'http://localhost:3000/broadcasts'
    postdata = { 'broadcast[content]': data, 'feeds[Atom]': feeds[0], 'feeds[twitter]': feeds[1], 'feeds[RSS]': feeds[2], 'feeds[email]': feeds[3], 'feeds[facebook]': feeds[4] }
    response = requests.post(endpoint, auth=('admin', 'taliesin'), params=postdata)
    if(response.status_code == 200):
        print('Posted successfully')
    else:
        print('Post failed with status code: ' + str(response.status_code))

if __name__ == "__main__":
    args = docopt(__doc__)
    print(args)
    if args['--help']:
        print(args.help_message)
        sys.exit(0)
    if args['--post']:
        post(args['--post'], [ args['--Atom'], args['--twitter'], args['--RSS'], args['--email'], args['--facebook'] ])
    else:
        get(args['--json'])
