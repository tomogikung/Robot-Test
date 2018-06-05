*** Settings ***
Suite Setup       Open Browser And Go To URL ${LoginURL}
Suite Teardown    Close Browser
Resource          ../../Import.robot
Resource          ../../Pages/Login/Login_page.robot
Resource          ../../Pages/SATR/STAR_Detail/STAR_Detail_Page.robot
Resource          ../../Pages/SATR/STAR_Send_Star/STAR_Send.robot

*** Test Cases ***
Scenario-1-Go to Star Detail Page
    Run Keyword    User Login With Username: ${txt_username} & Password: ${txt_password}
    Run Keyword    Go To Profile Page
    Run Keyword    Go To Star Detail Page

Scenario-2-Check Summary Score
    Run Keyword    Go To Profile Page
    Comment    ${Current_Star_Resive}=    Get Value    ${span_resive_star}
    Comment    ${Current_Star_Send}=    Get Value    ${span_send_star}
    Wait Until Element Is Visible    ${Link_Star_Detail}    timeout=${Wait_timeout}
    Click Element    ${Link_Star_Detail}
    ${Count_Element_score}=    Get Matching XPath Count    //*[@id="frmEmpdetail"]/b/div[1]/div/div/div/div[2]/span
    ${Summary_Score}=    Set Variable    0
    :FOR    ${Loop_Index}    IN RANGE    ${Count_Element_score}
    \    ${Score}=    Get Text    //*[@id="frmEmpdetail"]/b/div[1]/div[${Loop_Index}+1]/div/div/div[2]/span
    \    ${Summary_Score}=    Evaluate    ${Summary_Score} + ${Score}
    Run Keyword    Go To Profile Page
    ${Total_Score}=    Get Text    //*[@id="formProfile"]/div/div[2]/div/div/b/h1/b/center
    Should Be Equal As Integers    ${Summary_Score}    ${Total_Score}

Scenario-3-Check Summary Star
    Run Keyword    Go To Profile Page
    ${Current_Star_Resive}=    Get Value    ${span_resive_star}
    ${Current_Star_Send}=    Get Value    ${span_send_star}
    Wait Until Element Is Visible    ${Link_Star_Detail}    timeout=${Wait_timeout}
    Click Element    ${Link_Star_Detail}
    ${Count_Element_Star_Resive}=    Get Matching XPath Count    //*[@id="frmEmpdetail"]/b/div[1]/div/div/div/div[1]/input
    ${Count_Element_Star_Send}=    Get Matching XPath Count    //*[@id="frmEmpdetail"]/b/b/div/div/div/div/span[2]/input
    ${Summary_Score_Star_Resive}=    Set Variable    0
    ${Summary_Score_Star_Send}=    Set Variable    0
    :FOR    ${Loop_Index}    IN RANGE    ${Count_Element_Star_Resive}
    \    ${Star_Resive}=    Get Value    //*[@id="frmEmpdetail"]/b/div[1]/div[${Loop_Index}+1]/div/div/div[1]/input
    \    ${Star_Send}=    Get Value    //*[@id="frmEmpdetail"]/b/b/div/div[${Loop_Index}+1]/div/div/span[2]/input
    \    ${Summary_Score_Star_Resive}=    Evaluate    ${Star_Resive} + ${Summary_Score_Star_Resive}
    \    ${Summary_Score_Star_Send}=    Evaluate    ${Star_Send} + ${Summary_Score_Star_Send}
    Should Be Equal As Integers    ${Summary_Score_Star_Resive}    ${Current_Star_Resive}
    Should Be Equal As Integers    ${Summary_Score_Star_Send}    ${Current_Star_Send}
