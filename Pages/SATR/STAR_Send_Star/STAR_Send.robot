*** Settings ***
Resource          ../../../Import.robot
Resource          STAR_Send_varible.robot
Resource          ../STAR_SreachEMP/STAR_SreachEMP.txt

*** Keywords ***
Go To Send Star Page
    Run Keyword    Go To Star Page With URL : ${Star_Sreach_Emp_Page}
    Run Keyword    Sreach Employee With EmpID : ${Emp_ID} Success Case
    Click Element    xpath=.${div_Emp_data}

Go To Profile Page
    Wait Until Element Is Visible    xpath=.${Profile_tab}    timeout=${Wait_timeout}
    Click Element    xpath=.${Profile_tab}
    Wait Until Element Is Visible    xpath=.${Profile_menu}    timeout=${Wait_timeout}
    Click Element    xpath=.${Profile_menu}
    ${Current_satr}=    Get Value    xpath=.${span_send_star}
    Return From Keyword    ${Current_satr}
