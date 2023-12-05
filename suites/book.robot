*** Settings ***
Resource        ../pageObject/Base/base.robot
Resource        ../pageObject/home/home.robot
Resource        ../pageObject/signIn/signIn.robot
Resource        ../pageObject/book/book.robot


*** Variables ***
${VALID_USERNAME}       support@ngendigital.com
${VALID_PASSWORD}       abc123

*** Keywords ***
Booking For One Way Option Steps
    [Arguments]                        ${dateBook}    
    ...                                ${bookFlight}
    Open Flight Application
    Click Sign In Button on Home Page
    Input Username signIn              ${VALID_USERNAME}
    Input Password signIn              ${VALID_PASSWORD}
    Click signIn Button
    Click Book Menu
    Click One Way Trip
    Select From City
    Select From New York
    Select To City
    Select To London
    Select Flight Class
    Select Class Economy
    # Conditional for argument $dateBook}
    IF   '${dateBook}' == 'startend'
        Select Start Date
        Select End Date  
    ELSE IF    '${dateBook}' == 'start'
        Select Start Date
    ELSE IF    '${dateBook}' == 'end'
        Select End Date
    ELSE IF   '${dateBook}' == 'endstart'
        Select Wrong Start Date
        Select Wrong End Date  
    ELSE
        Log    dateBook is not valid
    END
    # Conditional for argument ${bookFlight}
    IF   '${bookFlight}' == 'flight'
        Select Type Flight
    ELSE IF    '${bookFlight}' == 'flight and hotel'
        Select Type Flight And Hotel
    ELSE
        Select Plus Min 1 Day
    END
    Click Submit Book Flight
    Select Price
    Click Confirm Booking

*** Test Cases ***
Successful Booking in One Way Flight and Type Flight
    Booking For One Way Option Steps    startend    
    ...                                 flight

Successful Booking in One Way Flight and Type Flight Hotel
    Booking For One Way Option Steps    startend   
    ...                                 flight and hotel

Failed Booking One Way Flight Without Select Book Type
    Booking For One Way Option Steps   startend    
    ...                                " "

# Expected Failed, Actual Success (Bug)
Failed to Booking One Way Flight Without Selecting Start Date and End Date
    Booking For One Way Option Steps   " "    
    ...                                flight

# Expected Failed, Actual Success (Bug)
Failed to Booking One Way Flight Without Selecting Start Date
    Booking For One Way Option Steps   end   
    ...                                flight and hotel

Failed to Booking One Way Flight Without Selecting End Date
    Booking For One Way Option Steps   start   
    ...                                flight   

Failed to Booking One Way Flight End Date < Start Date
    Booking For One Way Option Steps   endstart   
    ...                                flight
