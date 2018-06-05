*** Settings ***
Test Setup        Open Browser And Go To URL ${LoginURL}
Test Teardown     Close Browser
Resource          ../Import.robot
Resource          ../Pages/Login/Login_page.robot

*** Test Cases ***
Login Success Case
    [Documentation]    Login to Jenkins with username&password success
    Run Keyword    User Login With Username: ${txt_username} & Password: ${txt_password}
