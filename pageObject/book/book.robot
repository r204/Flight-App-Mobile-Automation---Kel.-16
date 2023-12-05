*** Settings ***
Resource        ../Base/base.robot
Variables       book-locator.yaml

*** Keywords ***
Click Book Menu
    Wait Until Element Is Visible    ${bookButton}
    Click Element                    ${bookButton}

Click One Way Trip
    Wait Until Element Is Visible    ${oneWayOption}
    Click Element                    ${oneWayOption}

Click Round Trip
    Wait Until Element Is Visible    ${roundTripOption}
    Click Element                    ${roundTripOption}
    
Select From City
    Wait Until Element Is Visible    ${fromCityDropdown}
    Click Element                    ${fromCityDropdown}
    Wait Until Element Is Visible    ${view-list-form}

Select From New York
    Wait Until Element Is Visible    ${newyorkValue}
    Click Element                    ${newyorkValue}

Select From Chicago
    Wait Until Element Is Visible    ${chicagoValue}
    Click Element                    ${chicagoValue}

Select From Toronto
    Wait Until Element Is Visible    ${torontoValue}
    Click Element                    ${torontoValue}

Select To City
    Wait Until Element Is Visible    ${toCityDropdown}
    Click Element                    ${toCityDropdown}
    Wait Until Element Is Visible    ${view-list-form}
    
Select To London
    Wait Until Element Is Visible    ${londonValue}
    Click Element                    ${londonValue}

Select To Paris
    Wait Until Element Is Visible    ${parisValue}
    Click Element                    ${parisValue}

Select To Ottawa
    Wait Until Element Is Visible    ${ottawaValue}
    Click Element                    ${ottawaValue}

Select Flight Class
    Wait Until Element Is Visible    ${classDropdown}
    Click Element                    ${classDropdown}
    Wait Until Element Is Visible    ${view-list-form}

Select Class Economy
    Wait Until Element Is Visible    ${economyValue}
    Click Element                    ${economyValue}

Select Class Business
    Wait Until Element Is Visible    ${businessValue}
    Click Element                    ${businessValue}

Select Class First
    Wait Until Element Is Visible    ${firstValue}
    Click Element                    ${firstValue}

Select Start Date
    Wait Until Element Is Visible    ${startDate}
    Click Element                    ${startDate}
    Wait Until Element Is Visible    ${calendar}
    Wait Until Element Is Visible    ${confirmOKDate}
    Click Element                    ${startDateCalendar}
    Click Element                    ${confirmOKDate}

Select End Date
    Wait Until Element Is Visible    ${endDate}
    Click Element                    ${endDate}
    Wait Until Element Is Visible    ${calendar}
    Wait Until Element Is Visible    ${confirmOKDate}
    Click Element                    ${endDateCalendar}
    Click Element                    ${confirmOKDate}

Select Wrong Start Date
    Wait Until Element Is Visible    ${startDate}
    Click Element                    ${startDate}
    Wait Until Element Is Visible    ${calendar}
    Wait Until Element Is Visible    ${confirmOKDate}
    Click Element                    ${endDateCalendar}
    Click Element                    ${confirmOKDate}

Select Wrong End Date
    Wait Until Element Is Visible    ${endDate}
    Click Element                    ${endDate}
    Wait Until Element Is Visible    ${calendar}
    Wait Until Element Is Visible    ${confirmOKDate}
    Click Element                    ${startDateCalendar}
    Click Element                    ${confirmOKDate}

Select Type Flight
    Wait Until Element Is Visible    ${flightRadioButton}
    Click Element                    ${flightRadioButton}

Select Type Flight And Hotel
    Wait Until Element Is Visible    ${flightHotelRadioButton}
    Click Element                    ${flightHotelRadioButton}

Select Plus Min 1 Day
    Wait Until Element Is Visible    ${dayCheckbox}
    Click Element                    ${dayCheckbox}

Click Submit Book Flight
    Wait Until Element Is Visible    ${bookFlightButton}
    Click Element                    ${bookFlightButton}

Select Price
    Wait Until Element Is Visible    ${price}
    Click Element                    ${price}

Click Confirm Booking
    Wait Until Element Is Visible    ${confirmBook}
    Click Element                    ${confirmBook}

Click Back To Menu
    Wait Until Element Is Visible    ${backToMenu}
    Click Element                    ${backToMenu}
