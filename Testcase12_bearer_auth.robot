*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    SeleniumLibrary

*** Variables ***
${base_url}    https://certtransaction.elementexpress.com
${bearer_token}    "Bearer  a4F284BFADA11D01A52508ED7B92FFD7EE0905659F5DED06A4B73FC7739B48A287648801"

*** Test Cases ***
Bearer auth
    Create Session    bear_auth    ${base_url}
    &{headers}=    Create Dictionary    Authorization=${bearer_token}    Content-type=text/xml
    ${req_body}=    Get File    C:/robotframework_api_practise/data.xml.txt

    ${response}=    POST    ${base_url}/    data=${req_body}    headers=${headers}
    Log      ${response.status_code}



