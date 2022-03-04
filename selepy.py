from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import  By

ser = Service("C:\\Users\\tarun.jaiswal\\Downloads\\chromedriver_win32\\chromedriver.exe")
op = webdriver.ChromeOptions()
s = webdriver.Chrome(service=ser, options=op)
s.get("https://colortokens.com/")
import time

time.sleep(5)
s.maximize_window()
s.save_screenshot("colortokens.png")
s.find_element(By.XPATH,"//span[text()='Request a Demo']").click()
