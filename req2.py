from urllib.request import Request

import requests


def get_type_request(url, **kwrgs):
    return requests.get(url, **kwrgs)


# Making a get request
response = get_type_request('https://api.github.com/')

# print request object
print(response.url)

# print status code
print(response.status_code)
print(response.json()['current_user_authorizations_html_url'])
print(response.content)

print(response.headers)
print(response.encoding)
print(response.elapsed)

# print(response.close())
# print("connection closed")
print(response.cookies)
print(response.history)
print(response.is_permanent_redirect)
print(response.is_redirect)
print(response.request)
print(response.url)
print(response.status_code)
print(response.reason)
print(response.ok)

# response=requests.get('http://10.71.23.12/idsystem fs')
# print(response.raise_for_status())


# response =requests.get('https://geeksforgeeks.org/')
# print(response.history)
# json1 = {'user':'abc','password':'password123'}
# data1 = {'user':'abc','pass':'123'}
# postreq = requests.post('http://localhost',data=data1,json=json1, allow_redirects=False, auth= ('user','pass'),
#                         cert="file/certfile.cert",headers={'accept':123}, verify={'data1':'data'},
#                         cookies={'user':'tarun','password':'123'},proxies={},files={'file':'open(file)'},timeout=10)
