*** Settings ***
Library    RequestsLibrary
Library    Collections



*** Variables ***

${base_url}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Validation of headers
    Create Session    headers_session    ${base_url}
    ${response}=    GET    ${base_url}/photos
    Log    ${response.headers}
    
    ${headers_context}=    Get From Dictionary    ${response.headers}    via
    ${headers_powered}=    Get From Dictionary    ${response.headers}    x-powered-by


