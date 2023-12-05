*** Settings ***
Resource        ../pageObject/Base/base.robot
Resource        ../pageObject/home/home.robot
Resource        ../pageObject/signIn/signIn.robot
Resource        ../pageObject/book/book.robot
Resource        ../pageObject/signOut/signOut.robot
Test Setup      Open Flight Application
Test Teardown   Close Flight Application

*** Variables ***
${VALID_USERNAME}       support@ngendigital.com
${VALID_PASSWORD}       abc123

*** Keywords ***
# Sign In
Login with valid data
    Click Sign In Button on Home Page
    Input Username signIn              ${VALID_USERNAME}
    Input Password signIn              ${VALID_PASSWORD}
    Click signIn Button

*** Test Cases ***
Signed Out From Flight Page Without Booking
    Login with valid data
    Click SignOut Button 
    Wait Until Element Is Visible    ${signin-button}  

