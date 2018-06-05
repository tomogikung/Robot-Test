*** Settings ***
Resource          STAR_Detail_Varible.robot
Resource          ../../../Import.robot

*** Keywords ***
Go To Star Detail Page
    Wait Until Element Is Visible    ${Link_Star_Detail}    timeout=${Wait_timeout}
    Click Element    ${Link_Star_Detail}
    Wait Until Element Is Visible    ${Star_Detail_A}    timeout=${Wait_timeout}
    Click Element    ${Star_Detail_A}
    Comment    Wait Until Element Is Visible    ${txt_Sreach_Star_Detail}    timeout=${Wait_timeout}
    Comment    Input Text    ${txt_Sreach_Star_Detail}    ${Dummy_Star_Detail_Sreach}
    Wait Until Page Contains    Accountability : ร่วมรับผิดชอบ    timeout=${Wait_timeout}

Check Summary Ster Resive
