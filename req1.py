import requests

API_END_POINT = 'http://pastebin.com/api/api_post.php'

API_KEY = 'xxxxxxx'

source_code = '''

def add(x,y):
    return x+y

'''

data = {'api_dev_key':API_KEY,
        'api_option':'paste',
        'api_paste_code': source_code,
        'api_paste_format': 'python'}


def get_type_request(url):

        try:
                req = requests.post(url=API_END_POINT,data= data)
                print(req.text)
        except requests.TooManyRedirects:
                print()