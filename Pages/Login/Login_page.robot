*** Settings ***
Resource          ../../Import.robot
Resource          Login_varible.robot

*** Keywords ***
User Login With Username: ${txt_username} & Password: ${txt_password}
    [Documentation]    Specify Username & Password on Login Page
    Wait Until Element Is Visible    ${txt_username}    timeout=${Wait_timeout}
    Input Text    ${txt_username}    ${EmpID}
    Input Password    ${txt_password}    ${EmpID}
    Click Button    ${btn_login}
