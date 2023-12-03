*** Settings ***
Resource        ../Base/base.robot
Variables       home-locator.yaml


*** Keywords ***
Click Sign In Button on Home Page
    Wait Until Element Is Visible    ${signin-button}
    Click Element    ${signin-button}
