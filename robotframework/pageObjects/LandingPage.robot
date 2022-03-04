*** Settings ***
Documentation   All the page objects and keywords of the landing page
Library     SeleniumLibrary
Resource    ../pageObjects/generic.robot

*** Variables ***
${Error_Message_login}      css:.alert.alert-danger

*** Keywords ***

Fill the login Form
    [arguments]         ${username}     ${password}
    input text          id:username     ${username}
    input password      id:password     ${password}
    click button        id:signInBtn


verify error message is correct
    ${result}=  get text    ${Error_Message_login}
    Should Be Equal As Strings       ${result}       ${incorrect_msg}


Fill the login Details and Login Form
        [arguments]         ${username}     ${password}
        input text          id:username     ${username}
        input password      id:password     ${password}
        click element       css:input[value='user']
        Wait Until Element Is Visible           css:.modal-body
        click button       id:okayBtn
        click button       id:okayBtn
        Wait Until Element Is Not Visible       css:.modal-body
        select from list by value       css:select.form-control     teach
        Select Checkbox     terms
        Checkbox Should Be Selected     terms

#wait until Element is located in the page
#    wait until element is visible       ${Error_Message_login}