*** Settings ***
Suite Setup       Open Browser And Go To URL ${LoginURL}
Suite Teardown    Close Browser
Resource          ../../Import.robot
Resource          ../../Pages/SATR/STAR_SreachEMP/STAR_SreachEMP.txt
Resource          ../../Pages/Login/Login_page.robot
Resource          ../../Pages/SATR/STAR_Send_Star/STAR_Send.robot

*** Test Cases ***
Scenario-1-Send Star With Out ST Data Type : Star
    Run Keyword    User Login With Username: ${txt_username} & Password: ${txt_password}
    Run Keyword    Go To Send Star Page
    Input Text    ${txt_A}    ${Dummy_A}
    Input Text    ${txt_R}    ${Dummy_R}
    Click Element    ${btn_send_save}
    Wait Until Page Contains    กรุณากรอกข้อมูล    timeout=${Wait_timeout}

Scenario-2-Send Star With Out A Data Type : Star
    Input Text    ${txt_A}    ${EMPTY}
    Input Text    ${txt_ST}    ${Dummy_ST}
    Input Text    ${txt_R}    ${Dummy_R}
    Click Element    ${btn_send_save}
    Wait Until Page Contains    กรุณากรอกข้อมูล    timeout=${Wait_timeout}

Scenario-3-Send Star With Out R Data Type : Star
    Input Text    ${txt_R}    ${EMPTY}
    Input Text    ${txt_ST}    ${Dummy_ST}
    Input Text    ${txt_A}    ${Dummy_A}
    Click Element    ${btn_send_save}
    Wait Until Page Contains    กรุณากรอกข้อมูล    timeout=${Wait_timeout}

Scenario-4-Send Star With Out ST Data Type : StarAR
    Click Element    ${Radio_SrarAR}
    Sleep    3
    Input Text    ${txt_ST}    ${EMPTY}
    Input Text    ${txt_R}    ${Dummy_R}
    Input Text    ${txt_A}    ${Dummy_A}
    Input Text    ${txt_star_R}    ${Dummy_StarR}
    Input Text    ${txt_star_A}    ${Dummy_StarA}
    Click Element    ${btn_send_save}
    Wait Until Page Contains    กรุณากรอกข้อมูล    timeout=${Wait_timeout}

Scenario-5-Send Star With Out A Data Type : StarAR
    Input Text    ${txt_ST}    ${EMPTY}
    Input Text    ${txt_R}    ${Dummy_R}
    Input Text    ${txt_A}    ${Dummy_A}
    Input Text    ${txt_star_A}    ${Dummy_StarA}
    Click Element    ${btn_send_save}
    Wait Until Page Contains    กรุณากรอกข้อมูล    timeout=${Wait_timeout}
    [Teardown]    Close Browser

Scenario-6-Send Star Success Case
    [Setup]    Open Browser And Go To URL ${LoginURL}
    Run Keyword    User Login With Username: ${txt_username} & Password: ${txt_password}
    ${Current_Star}=    Go To Profile Page
    Run Keyword    Go To Send Star Page
    Wait Until Page Contains    ให้คะแนน STAR เเละ STAR(AR)    timeout=${Wait_timeout}
    Input Text    ${txt_ST}    ${Dummy_ST}
    Input Text    ${txt_R}    ${Dummy_R}
    Input Text    ${txt_A}    ${Dummy_A}
    Click Element    ${btn_send_save}
    Wait Until Page Contains    ระดับความสุขของฉัน    timeout=${Wait_timeout}
    ${Current_Star_After_Resive}=    Get Value    ${span_send_star}
    Should Be True    ${Current_Star_After_Resive} > ${Current_Star}
    [Teardown]    Close Browser

Scenario-7-Send StarAR Success Case
    [Setup]    Open Browser And Go To URL ${LoginURL}
    Run Keyword    User Login With Username: ${txt_username} & Password: ${txt_password}
    Run Keyword    Go To Send Star Page
    Wait Until Page Contains    ให้คะแนน STAR เเละ STAR(AR)    timeout=${Wait_timeout}
    Click Element    ${Radio_SrarAR}
    Sleep    3
    Input Text    ${txt_ST}    ${Dummy_ST}
    Input Text    ${txt_R}    ${Dummy_R}
    Input Text    ${txt_A}    ${Dummy_A}
    Input Text    ${txt_star_R}    ${Dummy_StarR}
    Input Text    ${txt_star_A}    ${Dummy_StarA}
    Click Element    ${btn_send_save}
    Wait Until Page Contains    ระดับความสุขของฉัน    timeout=${Wait_timeout}
    [Teardown]    Close Browser

Scenario-8-Check Send Star To My Self
    Run Keyword    User Login With Username: ${txt_username} & Password: ${txt_password}
    Run Keyword    Go To Star Page With URL : ${Star_Sreach_Emp_Page}
    Wait Until Element Is Visible    xpath=.${txt_sreachEMP}    timeout=${Wait_timeout}
    Input Text    xpath=.${txt_sreachEMP}    580490003
    Click Element    xpath=.${btn_sreach}
    Click Element    xpath=.${div_Emp_data}
    Alert Should Be Present    คุณไม่สามารถให้ \ Starหรือ STAR(AR)กับคุณเองได้${SPACE}    action=ACCEPT    timeout=${Wait_timeout}
