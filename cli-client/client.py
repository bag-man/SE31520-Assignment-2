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
import json


def get(raw):
    endpoint = 'http://localhost:3000/broadcasts.json'
    response = requests.get(endpoint, auth=('admin', 'taliesin'))
    data = response.json()

    if raw:
        print(json.dumps(data, indent=4, sort_keys=True))
    else:
        print('UserID\t Post')
        for post in data:
            print(str(post['user_id']) + '\t ' + post['content'])


def post(user, data, feeds):
    endpoint = 'http://localhost:3000/broadcasts'

    username = user[0].split(':')[0]
    password = user[0].split(':')[1]

    postdata = { 'broadcast[content]': data
               , 'feeds[Atom]': feeds[0]
               , 'feeds[twitter]': feeds[1]
               , 'feeds[RSS]': feeds[2]
               , 'feeds[email]': feeds[3]
               , 'feeds[facebook]': feeds[4]
               }

    response = requests.post(endpoint, auth=(username, password), params=postdata)

    if(response.status_code == 200):
        print('Posted successfully')
    else:
        print('Post failed with status code: ' + str(response.status_code))

if __name__ == "__main__":
    args = docopt(__doc__)
    if args['--help']:
        print(args.help_message)
        sys.exit(0)
    if args['--post']:
        post( args['--user']
            , args['--post']
            , [ args['--Atom']
              , args['--twitter']
              , args['--RSS']
              , args['--email']
              , args['--facebook']
              ]
            )
    else:
        get(args['--json'])
