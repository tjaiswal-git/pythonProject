*** Settings ***
Documentation   To Valid the login page
Library     SeleniumLibrary
Library     Collections
Library     ../customLibrary/Shop.py
Test Setup      open the browser with url       Chrome
Test Teardown       Close browser session
Resource    ../pageObjects/generic.robot
Resource    ../pageObjects/LandingPage.robot
Resource    ../pageObjects/ShopPage.robot
Resource    ../pageObjects/Checkout.robot
Resource    ../pageObjects/ConfirmationPage.robot

*** Variables ***
@{listofProducts}           Nokia Edge      Blackberry

*** Test Cases ***
Validate UnSuccessful Login
    LandingPage.Fill the login Form     ${user_name}    ${invalid_password}
    generic.wait until Element is located in the page   ${Error_Message_login}
    LandingPage.verify error message is correct


Validate cards display in the shopping page
    LandingPage.Fill the login Form     ${user_name}    ${valid_password}
    generic.wait until Element is located in the page   ${Shop_Page_Load}
    ShopPage.verify card titles in the Shop page
    hello world
    add items to cart and checkout      ${listofProducts}
    Checkout.Verify items in the checkout page and proceed       ${listofProducts}
    #ShopPage.Select the Card     Samsung Note 8

    generic.wait until Element is located in the page   ${country_text_box_element}
    enter the country in text box       India

    generic.wait until Element is located in the page   ${Country_Input}
    Checkout.verify the item placed
    ConfirmationPage.verify the product placed confirmation



#Select the Form and navigate to child window
#    LandingPage.Fill the login Details and Login Form       ${user_name}     ${valid_password}


*** Keywords ***
