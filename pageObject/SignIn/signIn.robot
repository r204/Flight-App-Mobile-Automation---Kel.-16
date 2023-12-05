*** Settings ***
Resource        ../Base/base.robot
Variables       signIn-locator.yaml


*** Keywords ***
Input Username signIn
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${username_input}
    Input Text    ${username_input}    ${username}

Input Password signIn
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${password_input}
    Input Text    ${password_input}    ${password}

Click signIn Button
    Wait Until Element Is Visible    ${signin_button}
    Click Element    ${signin_button}
