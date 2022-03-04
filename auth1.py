import requests

from requests.auth import HTTPBasicAuth
basic = HTTPBasicAuth('user','pass')

requests.get('http://localhost:80',auth=basic)


# http digest

from requests.auth import HTTPDigestAuth
requests.get('url',auth=HTTPDigestAuth('user','pass'))


#Oauth autentication

from requests_oauthlib import OAuth1

auth1 = OAuth1('YOUR_APP_KEY', 'YOUR_APP_SECRET',
              'USER_OAUTH_TOKEN', 'USER_OAUTH_TOKEN_SECRET')

requests.get('url',auth=auth1)
