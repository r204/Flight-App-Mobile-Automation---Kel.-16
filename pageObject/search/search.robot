*** Settings ***
Resource        ../Base/base.robot
Variables       search.yaml

*** Keywords ***
Click Search Menu
    Wait Until Element Is Visible    ${searchMenu}
    Click Element                    ${searchMenu}

Input Booking ID in Search Field
    [Arguments]                      ${bookingID}  
    Wait Until Element Is Visible    ${seacrhField}
    Input Text                       ${seacrhField}   
    ...                              ${bookingID}

Click Search Button
    Wait Until Element Is Visible    ${searchButton}
    Click Element                    ${searchButton}