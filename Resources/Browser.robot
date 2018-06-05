*** Settings ***
Resource          ../Import.robot

*** Keywords ***
Open Browser And Go To URL ${LoginURL}
    [Documentation]    Create WebDriver for browser
    Create Webdriver    ${Browser}
    Maximize Browser Window
    Go To    ${LoginURL}
