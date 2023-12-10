*** Settings ***
Resource        ../pageObject/Base/base.robot
Resource        ../pageObject/home/home.robot
Resource        ../pageObject/signIn/signIn.robot
Resource        ../pageObject/search/search.robot
Resource        ../pageObject/book/book.robot
Test Setup      Open Flight Application
Test Teardown   Close Flight Application

*** Variables ***
${VALID_USERNAME}           support@ngendigital.com
${VALID_PASSWORD}           abc123
${EMPTY_BOOKING_ID}
${SUCCESS_TEXT}             ${validBookingID}
${ALERT_TEXT}               Please enter valid Flight Number

*** Keywords ***
# Sign In
Login with valid data
    Click Sign In Button on Home Page
    Input Username signIn              ${VALID_USERNAME}
    Input Password signIn              ${VALID_PASSWORD}
    Click signIn Button

Search Booking ID Steps
    [Arguments]                             ${bookingID}
    Click Search Menu
    Input Booking ID in Search Field        ${bookingID}
    Click Search Button
    
*** Test Cases ***
Search For Valid Booking ID
    Login with valid data
    Search Booking ID Steps                 DA935
    Wait Until Element Is Visible           ${SUCCESS_TEXT} 

Search For Invalid Booking ID
    Login with valid data
    Search Booking ID Steps                 CADX2214
    Wait Until Page Contains                ${ALERT_TEXT}  

Search With An Empty Field
    Login with valid data
    Search Booking ID Steps                 ${EMPTY_BOOKING_ID}
    Wait Until Page Contains                ${ALERT_TEXT}  