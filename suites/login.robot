*** Settings ***
Resource    ../pageObject/home/home.robot
Resource    ../pageObject/SignIn/signIn.robot


*** Variables ***
${VALID_USERNAME}       admin@test.com
${VALID_PASSWORD}       manager
${INVALID_USERNAME}     invalid
${INVALID_PASSWORD}     invalid


*** Test Cases ***
Login with valid data
    Open Flight Application
    Click Sign In Button on Home Page
    Input Username signIn    ${VALID_USERNAME}
    Input Password signIn    ${VALID_PASSWORD}
    Click signIn Button
    Close Flight Application

Login with invalid data
    Open Flight Application
    Click Sign In Button on Home Page
    Input Username signIn    ${INVALID_USERNAME}
    Input Password signIn    ${INVALID_PASSWORD}
    Click signIn Button
    Close Flight Application

Login without password
    Open Flight Application
    Click Sign In Button on Home Page
    Input Username signIn    ${VALID_USERNAME}
    Click signIn Button
    Close Flight Application

Login without data
    Open Flight Application
    Click Sign In Button on Home Page
    Click signIn Button
    Close Flight Application
