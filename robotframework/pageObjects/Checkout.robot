*** Settings ***
Documentation   All the page objects and keywords of the landing page
Library     SeleniumLibrary


*** Variables ***
${Country_Input}                //ul/li/a[contains(text(),'India')]
${country_text_box_element}     css:input.validate
*** Keywords ***


Verify items in the checkout page and proceed
    [arguments]         ${expected_list}
    @{actual_list}=         create list
    ${elements} =       get webelements     css:h4.media-heading a
    FOR     ${element}  IN  @{elements}
        LOG     ${element.text}
        Append To List      ${actual_list}      ${element.text}
    END

    Lists Should Be Equal    ${expected_list}      ${actual_list}
    click button        css:button.btn.btn-success

verify the item placed
    Sleep       5
    click element        ${Country_Input}
    click element     css:.checkbox label
    #Checkbox Should Be Selected     css:input#checkbox2

enter the country in text box
    [arguments]     ${country_name}
    input text      ${country_text_box_element}      ${country_name}
    Sleep       5
