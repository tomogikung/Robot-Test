*** Settings ***
Suite Setup       Open Browser And Go To URL ${LoginURL}
Suite Teardown    Close Browser
Resource          ../../Import.robot
Resource          ../../Pages/Login/Login_page.robot
Resource          ../../Pages/SATR/STAR_Detail/STAR_Detail_Page.robot
Resource          ../../Pages/SATR/STAR_Send_Star/STAR_Send.robot

*** Test Cases ***
Secnario-1-Input Score And Save
    Run Keyword    User Login With Username: ${txt_username} & Password: ${txt_password}
    Run Keyword    Go To Profile Page
    Wait Until Element Is Visible    ${Link_Star_Detail}    timeout=${Wait_timeout}
    Click Element    ${Link_Star_Detail}
    Wait Until Element Is Visible    ${txt_Score_A}    timeout=${Wait_timeout}
    Comment    ${Socre_T}=    Get Value    ${txt_Score_T}
    Comment    ${Score_A}=    Get Value    ${txt_Score_A}
    Comment    กรอกข้อมูลที่ไม่ใช่ตัวเลข
    Input Text    ${txt_Score_A}    Test Data
    Comment    เก็บข้อมูลการกรอก
    ${Score_A}=    Get Value    ${txt_Score_A}
    ${Length_Score_A}=    Get Length    ${Score_A}
    Comment    เปรียบเทียบข้อมูลการกรอกที่ไม่ใช่ตัวเลขต้องเป็น 0
    Should Be Equal As Integers    ${Length_Score_A}    0
    Input Text    ${txt_Score_A}    ${Dummy_Score_A}
    Input Text    ${txt_Score_T}    ${Dummy_Score_T}
    Click Element    ${btn_Save_Star_Table_Score}
    Comment    Wait Until Element Is Visible    ${txt_Score_A}    timeout=${Wait_timeout}
    Comment    ${After_Save_Score_A}=    Get Value    ${txt_Score_A}
    Comment    ${After_Save_Score_T}=    Get Value    ${txt_Score_A}
