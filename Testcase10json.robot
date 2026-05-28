*** Settings ***
Library    JSONLibrary
Library    os
Library    Collections


*** Variables ***
${phone_number}    $.phonenumber[0].number

*** Test Cases ***
Testcase1:
    ${json_obj}=    Load Json From File    C:/robotframework_api_practise/data.json.txt
    ${name_value}=    Get Value From Json    ${json_obj}    ${phone_number}
    Log    ${name_value}
