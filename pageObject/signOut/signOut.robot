*** Settings ***
Resource        ../Base/base.robot
Variables       signOut.yaml

*** Keywords ***
Click SignOut Button
    Wait Until Element Is Visible     ${signOutButton}
    Click Element                     ${signOutButton}