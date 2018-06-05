*** Settings ***
Suite Setup       Open Browser And Go To URL ${LoginURL}
Suite Teardown    Close Browser
Resource          ../../Import.robot
Resource          ../../Pages/SATR/STAR_SreachEMP/STAR_SreachEMP.txt
Resource          ../../Pages/Login/Login_page.robot

*** Test Cases ***
Scenario-1-Sreach Emp ID Success Case
    Run Keyword    User Login With Username: ${txt_username} & Password: ${txt_password}
    Run Keyword    Go To Star Page With URL : ${Star_Sreach_Emp_Page}
    Run Keyword    Sreach Employee With EmpID : ${Emp_ID} Success Case

Scenario-2-Sreach Emp ID Fail Case
    Run Keyword    Sreach Employee With EmpID : ${Emp_ID} Fail Case

Scenario-3-Sreach Emp Name Success Case
    Run Keyword    Sreach Employee With Emp Frist Name : ${Emp_name} Success Case

Scenario-4-Sreach Emp Name Fail Case
    Run Keyword    Sreach Employee With Emp Frist Name : ${Emp_name} Fail Case

Scenario-6-Sreach Emp Nick Name Success Case
    Run Keyword    Sreach Employee With Emp Nick Name : ${Emp_Nickname} Success Case

Scenario-7-Sreach Emp Nick Name Fail Case
    Run Keyword    Sreach Employee With Emp Nick Name : ${Emp_Nickname} Fail Case

Scenario-8-Sreach Emp Full Division Name Success Case
    Run Keyword    Sreach Employee With Emp Full Name Division : ${Full_Divition_Name} Success Case

Scenario-9-Sreach Emp Full Division Name Fail Case
    Run Keyword    Sreach Employee With Emp Full Name Division : ${Full_Divition_Name} Fail Case

Scenario-10-Sreach Emp Short Division Name Success Case
    Run Keyword    Sreach Employee With Emp Short Name Division : ${Short_Divition_Name} Success Case

Scenario-11-Sreach Emp Short Division Name Fail Case
    Run Keyword    Sreach Employee With Emp Short Name Division : ${Short_Divition_Name} Fail Case

Scenario-12-Sreach Emp Department Success Case
    Run Keyword    Sreach Employee With Emp Short Departmaent : ${DepartmentName} Success Case

Scenario-13-Sreach Emp Department Fail Case
    Run Keyword    Sreach Employee With Emp Short Departmaent : ${DepartmentName} Fail Case
