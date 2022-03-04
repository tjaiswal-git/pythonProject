*** Settings ***
Documentation   All the page objects and keywords of the landing page
Library     SeleniumLibrary


*** Variables ***


*** Keywords ***


verify the product placed confirmation
    click button        css:.btn-success
    ${success_text}=    get text        css:div.alert strong
    Should Be Equal As Strings       ${success_text}       Success!


