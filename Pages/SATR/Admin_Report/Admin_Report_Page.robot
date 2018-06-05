*** Settings ***
Resource          Admin_Report_Varible.robot
Resource          ../../../Import.robot

*** Keywords ***
Go To Admin Report Page With URL : ${URL_Admin_Report_Page}
    Wait Until Element Is Visible    ${ACTIVE_Menu}    timeout=${Wait_timeout}
    Click Element    ${ACTIVE_Menu}
    Wait Until Element Is Visible    ${Report_Admin_Menu}    timeout=${Wait_timeout}
    Click Element    ${Report_Admin_Menu}

Search Resive Star With EmpID : ${Dummy_EmpID}
    Wait Until Element Is Visible    ${select_Report_type}    timeout=${Wait_timeout}
    Select From List By Value    ${select_Report_type}    give
    Wait Until Element Is Visible    ${txt_Report_Emp_ID}    timeout=${Wait_timeout}
    Input Text    ${txt_Report_Emp_ID}    ${Dummy_EmpID}
    Click Element    ${btn_Search_admin_report}
    ${Result_Search_EmpID}=    Get Text    ${Result_Resive_Search_EmpID}
    Should Be Equal As Strings    ${Result_Search_EmpID}    ${Dummy_EmpID}

Search Resive Star With Section : FU
    Wait Until Element Is Visible    ${select_Report_type}    timeout=${Wait_timeout}
    Select From List By Value    ${select_Report_type}    give
    Sleep    3
    Click Element    ${select_Section}
    Wait Until Element Is Visible    ${select_Section_Option_1}    timeout=${Wait_timeout}
    Click Element    ${select_Section_Option_1}
    Click Element    ${btn_Search_admin_report}
    ${Result_Search_Section}=    Get Text    ${Reult_Resive_Search_Section}
    Should Be Equal As Strings    ${Result_Search_Section}    FU

Search Resive Star With Section : BU
    Wait Until Element Is Visible    ${select_Report_type}    timeout=${Wait_timeout}
    Select From List By Value    ${select_Report_type}    give
    Sleep    3
    Click Element    ${select_Section}
    Wait Until Element Is Visible    ${select_Section_Option_2}    timeout=${Wait_timeout}
    Click Element    ${select_Section_Option_2}
    Click Element    ${btn_Search_admin_report}
    ${Result_Search_Section}=    Get Text    ${Reult_Resive_Search_Section}
    Should Be Equal As Strings    ${Result_Search_Section}    BU

Search Resive Star With Section : FA And BU
    Wait Until Element Is Visible    ${select_Report_type}    timeout=${Wait_timeout}
    Select From List By Value    ${select_Report_type}    give
    Sleep    3
    Click Element    ${select_Section}
    Wait Until Element Is Visible    ${select_Section_Option_2}    timeout=${Wait_timeout}
    Click Element    ${select_Section_Option_2}
    Click Element    //*[@id="detailzone"]/div[1]/div[2]/span/div/ul/li[4]/a/label
    Click Element    ${btn_Search_admin_report}
    ${count}=    Get Matching XPath Count    //*[@id="tbl_active"]/tbody/tr/td[6]
    ${Count_Corect_FA}=    Set Variable    0
    ${Count_Corect_BU}=    Set Variable    0
    ${Pass_Param}=    Set Variable    0
    : FOR    ${loopIndex}    IN RANGE    ${count}
    \    ${Element_Value}=    Get Text    //*[@id="tbl_active"]/tbody/tr[${loopIndex+1}]/td[6]
    \    Run Keyword If    "${Element_Value}" == "FA"    Evaluate    ${Count_Corect_FA} + 1
    \    Run Keyword If    "${Element_Value}" == "BU"    Evaluate    ${Count_Corect_BU} + 1
    \    Run Keyword If    ${Count_Corect_FA}>0
    \    ...    AND    ${Count_Corect_BU}>0    ${Pass_Param}=    Evaluate    ${Pass_Param}+1
    \    Exit For Loop If    ${Pass_Param}!=0

Search Resive Star With Name : ${Dummy_Emp_Name}
    Wait Until Element Is Visible    ${select_Report_type}    timeout=${Wait_timeout}
    Select From List By Value    ${select_Report_type}    give
    Sleep    3
    Input Text    ${txt_Report_Emp_Name}    ${Dummy_Emp_Name}
    Click Element    ${btn_Search_admin_report}
    Wait Until Page Contains    ${Dummy_Emp_Name}    timeout=${Wait_timeout}

Search Resive Star With Last Name : ${Dummy_Emp_Last_Name}
    Wait Until Element Is Visible    ${select_Report_type}    timeout=${Wait_timeout}
    Select From List By Value    ${select_Report_type}    give
    Sleep    3
    Input Text    ${txt_Report_Emp_Name}    ${Dummy_Emp_Last_Name}
    Click Element    ${btn_Search_admin_report}
    Wait Until Page Contains    ${Dummy_Emp_Last_Name}    timeout=${Wait_timeout}

Search Resive Star With NickName : ${Dummy_Emp_Nickname}
    Wait Until Element Is Visible    ${select_Report_type}    timeout=${Wait_timeout}
    Select From List By Value    ${select_Report_type}    give
    Sleep    3
    Input Text    ${txt_Report_Emp_Name}    ${Dummy_Emp_Nickname}
    Click Element    ${btn_Search_admin_report}
    Wait Until Page Contains    ${Dummy_Emp_Nickname}    timeout=${Wait_timeout}

Search Resive Star With Division : ฝ่ายเทคโนโลยีและสารสนเทศ
    Wait Until Element Is Visible    ${select_Report_type}    timeout=${Wait_timeout}
    Select From List By Value    ${select_Report_type}    give
    Wait Until Element Is Visible    //*[@id="detailzone"]/div[2]/div[2]/span/div/button    timeout=${Wait_timeout}
    Click Element    //*[@id="detailzone"]/div[2]/div[2]/span/div/button
    Wait Until Element Is Visible    //*[@id="detailzone"]/div[2]/div[2]/span/div/ul/li[8]/a/label    timeout=${Wait_timeout}
    Click Element    //*[@id="detailzone"]/div[2]/div[2]/span/div/ul/li[8]/a/label
    Click Element    ${btn_Search_admin_report}
    Wait Until Page Contains    ฝ่ายเทคโนโลยีและสารสนเทศ    timeout=${Wait_timeout}

Search Resive Star With Position : เจ้าหน้าที่
    Wait Until Element Is Visible    ${select_Report_type}    timeout=${Wait_timeout}
    Select From List By Value    ${select_Report_type}    give
    Wait Until Element Is Visible    //*[@id="detailzone"]/div[3]/div[1]/span/div/button    timeout=${Wait_timeout}
    Click Element    //*[@id="detailzone"]/div[3]/div[1]/span/div/button
    Wait Until Element Is Visible    //*[@id="detailzone"]/div[3]/div[1]/span/div/ul/li[12]/a/label    timeout=${Wait_timeout}
    Click Element    //*[@id="detailzone"]/div[3]/div[1]/span/div/ul/li[12]/a/label
    Click Element    //*[@id="detailzone"]/div[3]/label[1]
    Click Element    ${btn_Search_admin_report}
    Wait Until Page Contains     เจ้าหน้าที่    timeout=${Wait_timeout}

Search Resive Star With Department : แผนกพัฒนาซอฟต์แวร์
    Wait Until Element Is Visible    ${select_Report_type}    timeout=${Wait_timeout}
    Select From List By Value    ${select_Report_type}    give
    Wait Until Element Is Visible    //*[@id="detailzone"]/div[3]/div[2]/span/div/button    timeout=${Wait_timeout}
    Click Element    //*[@id="detailzone"]/div[3]/div[2]/span/div/button
    Wait Until Element Is Visible    //*[@id="detailzone"]/div[3]/div[2]/span/div/ul/li[1]/div/input    timeout=${Wait_timeout}
    Input Text    //*[@id="detailzone"]/div[3]/div[2]/span/div/ul/li[1]/div/input    พัฒนา
    Wait Until Element Is Visible    //*[@id="detailzone"]/div[3]/div[2]/span/div/ul/li[219]/a/label    timeout=${Wait_timeout}
    Click Element    //*[@id="detailzone"]/div[3]/div[2]/span/div/ul/li[219]/a/label
    Click Element    //*[@id="detailzone"]/div[3]/label[2]
    Click Element    ${btn_Search_admin_report}
    Wait Until Page Contains     แผนกพัฒนาซอฟต์แวร์    timeout=${Wait_timeout}

Search Resive Star With Type : STAR
    Wait Until Element Is Visible    ${select_Report_type}    timeout=${Wait_timeout}
    Select From List By Value    ${select_Report_type}    give
    Wait Until Element Is Visible    //*[@id="detailzone"]/div[5]/div[2]/span/span/div/button    timeout=${Wait_timeout}
    Click Element    //*[@id="detailzone"]/div[5]/div[2]/span/span/div/button
    Wait Until Element Is Visible    //*[@id="detailzone"]/div[5]/div[2]/span/span/div/ul/li[3]/a/label    timeout=${Wait_timeout}
    Click Element    //*[@id="detailzone"]/div[5]/div[2]/span/span/div/ul/li[3]/a/label
    Click Element    ${btn_Search_admin_report}
    Wait Until Page Contains    star    timeout=${Wait_timeout}

Search Resive Star With Type : STARAR
    Wait Until Element Is Visible    ${select_Report_type}    timeout=${Wait_timeout}
    Select From List By Value    ${select_Report_type}    give
    Wait Until Element Is Visible    //*[@id="detailzone"]/div[5]/div[2]/span/span/div/button    timeout=${Wait_timeout}
    Click Element    //*[@id="detailzone"]/div[5]/div[2]/span/span/div/button
    Wait Until Element Is Visible    //*[@id="detailzone"]/div[5]/div[2]/span/span/div/ul/li[4]/a/label    timeout=${Wait_timeout}
    Click Element    //*[@id="detailzone"]/div[5]/div[2]/span/span/div/ul/li[4]/a/label
    Click Element    ${btn_Search_admin_report}
    Wait Until Page Contains    starar    timeout=${Wait_timeout}
