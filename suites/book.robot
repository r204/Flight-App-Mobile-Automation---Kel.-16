*** Settings ***
Resource        ../pageObject/Base/base.robot
Resource        ../pageObject/home/home.robot
Resource        ../pageObject/signIn/signIn.robot
Resource        ../pageObject/book/book.robot
Test Setup      Open Flight Application
Test Teardown   Close Flight Application


*** Variables ***
${VALID_USERNAME}       support@ngendigital.com
${VALID_PASSWORD}       abc123

*** Keywords ***
Booking For One Way Option Steps
    [Arguments]                        ${dateBook}    
    ...                                ${bookFlight}
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
    # Select Date
    IF   '${dateBook}' == 'startendDate'
        Select Start Date
        Select End Date  
    ELSE IF    '${dateBook}' == 'startDate'
        Select Start Date
    ELSE IF    '${dateBook}' == 'endDate'
        Select End Date
    ELSE IF   '${dateBook}' == 'endstartDate'
        Select Wrong Start Date
        Select Wrong End Date  
    ELSE
        Log    dateBook is not valid
    END
    # Select Flight Type
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

#  Round Trip
Booking For Round Trip Option Steps
    [Arguments]                        ${dateBook}    
    ...                                ${bookFlight}
    Click Sign In Button on Home Page
    Input Username signIn              ${VALID_USERNAME}
    Input Password signIn              ${VALID_PASSWORD}
    Click signIn Button
    Click Book Menu
    Click Round Trip
    Select From City
    Select From Chicago
    Select To City
    Select To Ottawa
    Select Flight Class
    Select Class Economy
    # Conditional for argument $dateBook}
    IF   '${dateBook}' == 'startendDate'
        Select Start Date
        Select End Date  
    ELSE IF    '${dateBook}' == 'startDate'
        Select Start Date
    ELSE IF    '${dateBook}' == 'endDate'
        Select End Date
    ELSE IF   '${dateBook}' == 'endstartDate'
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

Booking For One Way Option Without Select From and To City Steps
    [Arguments]                        ${dateBook}    
    ...                                ${bookFlight}
    Click Sign In Button on Home Page
    Input Username signIn              ${VALID_USERNAME}
    Input Password signIn              ${VALID_PASSWORD}
    Click signIn Button
    Click Book Menu
    Click One Way Trip
    Select Flight Class
    Select Class Economy
    # Conditional for argument $dateBook}
    IF   '${dateBook}' == 'startendDate'
        Select Start Date
        Select End Date  
    ELSE IF    '${dateBook}' == 'startDate'
        Select Start Date
    ELSE IF    '${dateBook}' == 'endDate'
        Select End Date
    ELSE IF   '${dateBook}' == 'endstartDate'
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

Booking For One Way Option Without Select Price
    [Arguments]                        ${dateBook}    
    ...                                ${bookFlight}
    Click Sign In Button on Home Page
    Input Username signIn              ${VALID_USERNAME}
    Input Password signIn              ${VALID_PASSWORD}
    Click signIn Button
    Click Book Menu
    Click One Way Trip
    Select Flight Class
    Select Class Economy
    # Conditional for argument $dateBook}
    IF   '${dateBook}' == 'startendDate'
        Select Start Date
        Select End Date  
    ELSE IF    '${dateBook}' == 'startDate'
        Select Start Date
    ELSE IF    '${dateBook}' == 'endDate'
        Select End Date
    ELSE IF   '${dateBook}' == 'endstartDate'
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
    Click Confirm Booking

*** Test Cases ***
# ONE WAY OPTION #
Booking in One Way Flight and Type Flight
    Booking For One Way Option Steps    startendDate    
    ...                                 flight

Booking in One Way Flight and Type Flight Hotel
    Booking For One Way Option Steps    startendDate   
    ...                                 flight and hotel

Booking One Way Flight Without Select Book Type
    Booking For One Way Option Steps   startendDate    
    ...                                " "

# Flaky
Booking One Way Flight Without Selecting Start Date and End Date
    Booking For One Way Option Steps   " "    
    ...                                flight

# Flaky
Booking One Way Flight Without Selecting Start Date
    Booking For One Way Option Steps   endDate   
    ...                                flight

#Flaky
Booking One Way Flight Without Selecting End Date
    Booking For One Way Option Steps   startDate   
    ...                                flight   

#Flaky
Booking One Way Flight End Date < Start Date
    Booking For One Way Option Steps   endstartDate   
    ...                                flight


# ROUND TRIP OPTION #
Booking Round Trip Flight
    Booking For Round Trip Option Steps   startendDate    
    ...                                   flight

Booking Round Trip Flight And Hotel
    Booking For Round Trip Option Steps   startendDate    
    ...                                   flight and hotel

Booking Round Trip Flight Without Select Book Type
    Booking For Round Trip Option Steps   startendDate    
    ...                                   " "

# Flaky
Booking Round Trip Flight Without Selecting Start Date and End Date
    Booking For Round Trip Option Steps   " "    
    ...                                   flight

# Flaky
Booking Round Trip Flight Without Selecting Start Date
    Booking For Round Trip Option Steps   endDate   
    ...                                   flight

#Flaky
Booking Round Trip Flight Without Selecting End Date
    Booking For Round Trip Option Steps   startDate   
    ...                                   flight   

#Flaky
Booking Round Trip Flight End Date < Start Date
    Booking For Round Trip Option Steps   endstartDate   
    ...                                   flight

# WITHOUT SELECT FROM AND TO CITY #
Booking in One Way Flight and Type Flight Without Select From and To City
    Booking For One Way Option Without Select From and To City Steps    startendDate    
    ...                                                                 flight

Booking in One Way Flight and Type Flight Hotel Without Select From and To City
    Booking For One Way Option Without Select From and To City Steps    startendDate   
    ...                                                                 flight and hotel

Booking One Way Flight Without Select Book Type Without Select From and To City
    Booking For One Way Option Without Select From and To City Steps   startendDate    
    ...                                                                " "

# Flaky
Booking One Way Flight Without Selecting Start Date and End Date Without Select From and To City
    Booking For One Way Option Without Select From and To City Steps   " "    
    ...                                                                flight

# Flaky
Booking One Way Flight Without Selecting Start Date Without Select From and To City
    Booking For One Way Option Without Select From and To City Steps   endDate   
    ...                                                                flight

#Flaky
Booking One Way Flight Without Selecting End Date Without Select From and To City
    Booking For One Way Option Without Select From and To City Steps   startDate   
    ...                                                                flight   

#Flaky
Booking One Way Flight End Date < Start Date Without Select From and To City
    Booking For One Way Option Without Select From and To City Steps   endstartDate   
    ...                                                                flight 

# Without Select Price #
Booking in One Way Flight and Type Flight Without Select Price
    Booking For One Way Option Without Select Price    startendDate    
    ...                                                flight