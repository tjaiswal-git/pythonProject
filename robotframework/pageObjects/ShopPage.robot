*** Settings ***
Documentation   All the page objects and keywords of the landing page
Library     SeleniumLibrary


*** Variables ***
${Shop_Page_Load}           css:.nav-link

*** Keywords ***

verify card titles in the Shop page
    @{expected_list}=       create list     iphone X    Samsung Note 8  Nokia Edge  Blackberry
    @{actual_list}=         create list
    ${elements} =       get webelements     css:.card-title
    FOR     ${element}  IN  @{elements}
        LOG     ${element.text}
        Append To List      ${actual_list}      ${element.text}
    END

    Lists Should Be Equal    ${expected_list}      ${actual_list}

Select the Card
    [arguments]     ${cardName}
    ${elements} =       get webelements     css:.card-title
    ${index}=          Set Variable         1
     FOR     ${element}  IN  @{elements}
            Exit For Loop If    '${cardName}'=='${element.text}'
            ${index}=   Evaluate  ${index} + 1
     END

    click button    xpath:(//div[@class='card-footer'])[${index}]/button

#wait until Element is located in the page
#    wait until element is visible       ${Shop_Page_Load}