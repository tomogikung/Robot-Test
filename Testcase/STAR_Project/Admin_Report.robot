*** Settings ***
Suite Setup       Open Browser And Go To URL ${LoginURL}
Suite Teardown    Close Browser
Resource          ../../Import.robot
Resource          ../../Pages/Login/Login_page.robot
Resource          ../../Pages/SATR/Admin_Report/Admin_Report_Page.robot

*** Test Cases ***
Secnario-1-Search Resive Star With Emp ID
    Run Keyword    User Login With Username: ${txt_username} & Password: ${txt_password}
    Run Keyword    Go To Admin Report Page With URL : ${URL_Admin_Report_Page}
    Run Keyword    Search Resive Star With EmpID : ${Dummy_EmpID}

Secnario-2-Search Resive Star With Section Case 1
    Reload Page
    Run Keyword    Search Resive Star With Section : FU

Secnario-3-Search Resive Star With Section Case 2
    Reload Page
    Run Keyword    Search Resive Star With Section : BU

Secnario-4-Search Resive Star With Section Case 3
    Reload Page
    Run Keyword    Search Resive Star With Section : FA And BU

Secnario-5-Search Resive Star With Emp Name
    Reload Page
    Run Keyword    Search Resive Star With Name : ${Dummy_Emp_Name}

Secnario-6-Search Resive Star With Emp Last Name
    Reload Page
    Run Keyword    Search Resive Star With Last Name : ${Dummy_Emp_Last_Name}

Secnario-7-Search Resive Star With Emp Nickname
    Reload Page
    Run Keyword    Search Resive Star With Last Name : ${Dummy_Emp_Last_Name}

Secnario-8-Search Resive Star With Division
    Reload Page
    Run Keyword    Search Resive Star With Division : ฝ่ายเทคโนโลยีและสารสนเทศ

Secnario-9-Search Resive Star With Position
    Reload Page
    Run Keyword    Search Resive Star With Position : เจ้าหน้าที่

Secnario-10-Search Resive Star With Department
    Reload Page
    Run Keyword    Search Resive Star With Department : แผนกพัฒนาซอฟต์แวร์

Secnario-11-Search Resive Star With Type
    Reload Page
    Run Keyword    Search Resive Star With Type : STAR
    Reload Page
    Run Keyword    Search Resive Star With Type : STARAR
