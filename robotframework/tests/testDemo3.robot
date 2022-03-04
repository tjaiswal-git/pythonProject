*** Settings ***
Documentation   To Valid the login page
Library     SeleniumLibrary
Library     Collections
Test Setup      open the browser with the Mortage payment url
Test Teardown       Close browser session
Test Template       Validate UnSuccessful Login
Resource    generic.robot

*** Variables ***
${Error_Message_login}      css:.alert.alert-danger

*** Test Cases ***          username                password
Invalid username            tarun                   learning
Invalid password            rahulsetteyacedemy      aafaf
Invalid user an password    aafadaf                 bjabfj
Special chars               @@$$!                   learning
Valid user and valid passoword      rahulshettyacademy      learning



#Validate cards display in the shopping page
#    Fill the login Form     ${user_name}    ${valid_password}
#    wait until Element is located in the page   ${Shop_Page_Load}
#    verify card titles in the Shop page
#    Select the Card     Samsung Note 8
#
#Select the Form and navigate to child window
#    Fill the login Details and Login Form       ${user_name}     ${valid_password}
#

*** Keywords ***

Validate UnSuccessful Login
    [arguments]         ${username}     ${password}
    Fill the login Form     ${username}     ${password}
    wait until Element is located in the page   ${Error_Message_login}
    verify error message is correct


Fill the login Form
    [arguments]         ${username}     ${password}
    input text          id:username     ${username}
    input password      id:password     ${password}
    click button        id:signInBtn

wait until Element is located in the page
    [arguments]     ${element}
    wait until element is visible       ${element}

verify error message is correct
    ${result}=  get text    ${Error_Message_login}
    Should Be Equal As Strings       ${result}       ${incorrect_msg}


