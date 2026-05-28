*** Settings ***

Library    RequestsLibrary
Library    Collections



*** Variables ***
${base_url}    https://rahulshettyacademy.com/
${user}
${Book_ID}    3389
${AuthorName}    jagadish
${W_url}    https://worldweather.wmo.int/
${cityID}    523


*** Test Cases ***

Get_weather_info
    [Tags]    API    
    Create Session    my_session    ${base_url}
    ${response}=    GET On Session    my_session    ${user}

Play with dictionary
    [Tags]    API    
    &{data}=    Create Dictionary    name=jagadish    role=QA_engineer    experience=13
    ${get_key}=    Get From Dictionary    ${data}    name



Add book into library database
    [Tags]    API
    &{req_body}=    Create Dictionary    name:Learn Appium Automation with Java    isbn:bcd    aisle:227    author:John foe
    ${resp_body}=    POST    ${base_url}Library/Addbook.php    json=${req_body}    expected_status=200
    log    ${resp_body.content}
    Dictionary Should Contain Key    ${resp_body.content}    Msg

#
Get the book details which get added
    [Tags]    API
    ${get_response}=    GET    ${base_url}Library/GetBook.php    params=ID=${Book_ID}    expected_status=200
    Log    ${get_response.content}
    ${book_data}=    Convert To List    ${get_response.content}
    Log    ${book_data}

delete the book from database
    [Tags]    API
    &{post_delete}=    Create Session    Deletion     ID=${Book_ID}
    ${delete_resp}=    POST    ${base_url}Library/DeleteBook.php   json=${post_delete}    expected_status=200
    Log    ${delete_resp.status_code}
    Log    ${delete_resp.content}
    ${delete_book}=    Convert To String    ${delete_resp.content}
    Should Be Equal As Strings    book is successfully deleted    ${delete_resp.content}[msg]


Get the weather info of cities
    Create Session    weather_session    ${W_url}  #endpoint url
    ${req_body_weather}=    GET    ${W_url}/en/city.html   params=${cityID}  #request body to get weather info
    Log    ${req_body_weather.status_code}
    Log    ${req_body_weather.content}
    Log    ${req_body_weather.headers}
    #validation of status code is done
   ${status_code}=    Convert To String    ${req_body_weather.status_code}    #converted integer 200 into string
   Should Be Equal    ${status_code}    200
   ${body}=    Convert To String    ${req_body_weather.content}
   Should Contain    ${body}    temp
   ${content_value}=    Get From Dictionary    ${req_body_weather.headers}    server-name
   Should Be Equal    ${content_value}    victor2
