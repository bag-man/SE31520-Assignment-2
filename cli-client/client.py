import requests
import json

'''
{
 "users": [
    {
      "username": "John",
      "email": "test@gmail.com"
    },
    {
      "username": "Sarah",
      "email": "tarah@gmail.com"
    }
  ]
}
'''

endpoint = 'http://demo0361004.mockable.io/users'

response = requests.get(endpoint)

data = response.json()

print(data)
