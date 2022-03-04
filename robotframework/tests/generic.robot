*** Settings ***
Documentation       A resource file is resuable purpose
Library     SeleniumLibrary

*** Variables ***
${user_name}            rahulshettyacademy
${invalid_password}     123456
${valid_password}       learning
${incorrect_msg}        Incorrect username/password.
${url}                  https://rahulshettyacademy.com/loginpagePractise/
${exec_path}            C:\\Users\\tarun.jaiswal\\Downloads\\chromedriver_win32\\chromedriver.exe

*** Keywords ***
open the browser with the Mortage payment url
    create webdriver    Chrome  executable_path=${exec_path}
    go to               ${url}

Close browser session
        close browser