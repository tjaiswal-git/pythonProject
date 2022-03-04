*** Settings ***
Documentation   To Valid the login page
Library     SeleniumLibrary
Library     Collections
Library     ../customLibrary/Shop.py
Test Setup      open the browser with the Mortage payment url
#Test Teardown       Close browser session
Resource    generic.robot

*** Variables ***
${Error_Message_login}      css:.alert.alert-danger
${Shop_Page_Load}           css:.nav-link
@{listofProducts}           Blackberry      Nokia Edge

*** Test Cases ***
#Validate UnSuccessful Login
#    Fill the login Form     ${user_name}    ${invalid_password}
#    wait until Element is located in the page   ${Error_Message_login}
#    verify error message is correct


Validate cards display in the shopping page
    Fill the login Form     ${user_name}    ${valid_password}
    wait until Element is located in the page   ${Shop_Page_Load}
    verify card titles in the Shop page
    hello world
    add items to cart and checkout      ${listofProducts}
    #Select the Card     Samsung Note 8
#
#Select the Form and navigate to child window
#    Fill the login Details and Login Form       ${user_name}     ${valid_password}


*** Keywords ***

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


verify card titles in the Shop page
    @{expected_list}=       create list     iphone X    Samsung Note 8  Nokia Edge  Blackberry
    @{actual_list}=         create list
    ${elements} =       get webelements     css:.card-title
    FOR     ${element}  IN  @{elements}
        LOG     ${element.text}
        Append To List      ${actual_list}      ${element.text}
    END

    Lists Should Be Equal    ${expected_list}      ${actual_list}

#Select the Card
#    [arguments]     ${cardName}
#    ${elements} =       get webelements     css:.card-title
#    ${index}=          Set Variable         1
#     FOR     ${element}  IN  @{elements}
#            Exit For Loop If    '${cardName}'=='${element.text}'
#            ${index}=   Evaluate  ${index} + 1
#     END
#
#    click button    xpath:(//div[@class='card-footer'])[${index}]/button


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