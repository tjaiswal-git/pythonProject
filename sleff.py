from selenium import webdriver
from selenium.webdriver.firefox.service import Service

ser = Service("C:\\Users\\tarun.jaiswal\\Downloads\\chromedriver_win32\\chromedriver.exe")
op = webdriver.FirefoxOptions()
s = webdriver.Firefox(service=ser, options=op)
s.get("https://colortokens.com/")