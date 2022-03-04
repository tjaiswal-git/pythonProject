*** Settings ***
Documentation       A resource file is resuable purpose
Library     SeleniumLibrary

*** Variables ***
${user_name}            rahulshettyacademy
${invalid_password}     123456
${valid_password}       learning
${incorrect_msg}        Incorrect username/password.
${url}                  https://rahulshettyacademy.com/loginpagePractise/
${exec_path}            C:\\Users\\tarun.jaiswal\\PycharmProjects\\pythonProject\\robotframework\\resources\\
${browser_name}         Chrome

*** Keywords ***
open the browser with the Mortage payment url
    create webdriver    ${browser_name}      executable_path=${exec_path}
    go to               ${url}
    maximize browser window

open the browser with url
    [arguments]         ${brwowser_type}
    ${extension}=       Set Variable If      '${brwowser_type}'=='Edge'       msedgedriver.exe    chromedriver.exe
    LOG     ${extension}
    create webdriver    ${brwowser_type}             executable_path=${exec_path}${extension}
    go to               ${url}
    maximize browser window

Close browser session
        close browser

wait until Element is located in the page
    [arguments]     ${element}
    wait until element is visible       ${element}
