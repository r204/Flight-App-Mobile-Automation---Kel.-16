*** Settings ***
Library     AppiumLibrary


*** Variables ***
${REMOTE_URL}           https://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}     11.0
${DEVICE_NAME}          emulator-5554
${APP_PACKAGE}          com.example.myapplication
${APP_ACTIVITY}         com.example.myapplication.MainActivity


*** Keywords ***
Open Flight Application
    Open Application    remote_url=
    ...    platformName=Android
    ...    PlaformVersion=11.0
    ...    deviceName=emulator-5554
    ...    appPackage=com.example.myapplication
    ...    appActivity=com.example.myapplication.MainActivity
