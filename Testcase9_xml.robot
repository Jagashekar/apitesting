*** Settings ***
Library    os
Library    XML
Library    Collections


*** Test Cases ***
Testcase1
    ${xml_content}=    Parse Xml    C:/robotframework_api_practise/data.xml.txt
    ${employee_element}=    Get Element Text    ${xml_content}    .//employee[1]/firstname
    Should Be Equal    ${employee_element}    John
    
    ${element}=    Get Element    ${xml_content}    .//employee[1]

    ${element_count}=    Get Element Count    ${xml_content}    .//employee
    Should Be Equal As Integers    ${element_count}    2
    
    Element Attribute Should Be    ${xml_content}    id    101    .//employee[1]

    ${child_element_list}=    Get Child Elements    ${xml_content}    .//employee[1]



