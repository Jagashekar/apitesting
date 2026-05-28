*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${basic_url}    https://id.atlassian.com/login

*** Test Cases ***
Basic auth
    ${auth}=    Create List    jaga.shekar@gmail.com    !jarure@123
    Create Session    authentication    ${basic_url}    auth=${auth}
    ${response}=    get    ${basic_url}/user
    Log    ${response.content}


