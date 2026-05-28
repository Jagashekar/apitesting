*** Settings ***
Library    RequestsLibrary
Library    Collections


*** Variables ***
${base_url}    https://fake-json-api.mock.beeceptor.com


*** Test Cases ***
Create a new user details
    Create Session    user_session    ${base_url}
    ${body}=    Create Dictionary    name=jagdish    company=raj n sons    username=Osvaldo36    email=Kirk99@yahoo.com
    ${header}=   Create Dictionary    country=Sudan
    ${response}=    POST    ${base_url}/users    data=${body}    headers=${header}
    Log    ${response.status_code}
    Log    ${response.content}
*** Keywords ***

