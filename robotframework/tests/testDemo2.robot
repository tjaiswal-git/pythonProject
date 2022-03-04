*** Settings ***
Documentation   To Valid the login page
Library     SeleniumLibrary
Library     Collections
Library     String
Test Setup      open the browser with the Mortage payment url
#Test Teardown       Close browser session
Resource    generic.robot

*** Variables ***
${Error_Message_login}      css:.alert.alert-danger


*** Test Cases ***
Validated child window functionality
    Select the link of child window
    Verify the user is switched to child window
    Grab the email in the child window
    Switch to the parent window and enter the Email

*** Keywords ***
Select the link of child window
    click element       css:.blinkingText
    Sleep       5

Verify the user is switched to child window
    switch window       NEW
    element text should be      css:h1      DOCUMENTS REQUEST

Grab the email in the child window
    ${text}=    get text        css:.red
    @{words}=    Split String        ${text}     at
    ${text_split}=      get from list       ${words}    1
    @{new_words}=       split string        ${text_split}
    ${text_email}=      get from list       ${new_words}        0
    log     ${text_email}
    Set Global Variable        ${text_email}


Switch to the parent window and enter the Email
    switch window       MAIN
    title should be     LoginPage Practise | Rahul Shetty Academy
    input text          id:username     ${text_email}

