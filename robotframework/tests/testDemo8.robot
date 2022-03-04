*** Settings ***
Documentation       this utilty used for send a mail with attach and without attachment
...                 devloper mr tarun jaiswal if you have any queries..
Library       Collections
Library       RequestsLibrary
Library       OperatingSystem
Library       ../customLibrary/EmailNotificationUtility.py  ${SMTP_SERVER}  ${USER}     ${PASS}     ${TO}      ${subject}       ${TEXT_MESSAGE}     ${FILE_ATTACH}
Resource      ../pageObjects/generic.robot
*** Variables ***
${base_url}         https://rahulshettyacademy.com
${book_id}
${book_name}        RobotFramework
${SMTP_SERVER}      smtp.gmail.com
${USER}             tarunjaiswal92@gmail.com
${PASS}             skkdlttwiuzvaii.
${TO}               tarunjaiswal92@gmail.com
${subject}          Testing Mail
${TEXT_MESSAGE}     Welcome to robot framework community
${FILE_ATTACH}      C:\\Users\\tarun.jaiswal\\PycharmProjects\\pythonProject\\robotframework\\tests\\output.xml,C:\\Users\\tarun.jaiswal\\PycharmProjects\\pythonProject\\robotframework\\tests\\log.html,C:\\Users\\tarun.jaiswal\\PycharmProjects\\pythonProject\\robotframework\\tests\\geckodriver.log
${NUMBER}           0
${STRING}           Dogf
*** Test Cases ***
Play around with Dictinoary
    [Tags]      API
    &{data}=    Create Dictionary      name=rahulshetty     course=robot       website=rahulshettyacademy.com
    log     ${data}
    Dictionary Should Contain Key     ${data}     name
    log     ${data}[name]
    ${url}=     Get From Dictionary     ${data}     website
    log   ${url}


Add Book into Library DataBase
        [Tags]      API
      &{req_body}=  Create Dictionary    name=${book_name}        isbn=942303     aisle=324534        author=rahulshetty
       ${response}=     POST        ${base_url}/Library/Addbook.php     json=${req_body}    expected_status=200
        log      ${response.json()}
        Dictionary Should Contain Key     ${response.json()}     ID
         ${book_id}=    Get From Dictionary     ${response.json()}    ID
         Set Global Variable    ${book_id}
         log  ${book_id}
         Should be equal as Strings     successfully added      ${response.json()}[Msg]
         status should be       200     ${response}

Get the Book Details which got added
       [Tags]      API
      ${get_response}=   GET     ${base_url}/Library/GetBook.php     params=ID=${book_id}      expected_status=200
      log    ${get_response.json()}
      Should be Equal as Strings     ${book_name}    ${get_response.json()}[0][book_name]


Delete the Book from database
        [Tags]      API
        &{delete_req}=      Create Dictionary       ID=${book_id}
       ${delete_resp}=   POST    ${base_url}/Library/DeleteBook.php      json=${delete_req}      expected_status=200
       log      ${delete_resp.json()}
       Should be Equal as Strings   book is successfully deleted    ${delete_resp.json()}[msg]

example mail
    [Tags]      EMAIL   API
    send mail with attachment


Do conditional IF - ELSE IF - ELSE execution
    [Tags]     API      EMAIL
    IF    ${NUMBER} > 1
        Log    Greater than one.
    ELSE IF    "${STRING}" == "dog"
        Log    It's a dog!
    ELSE
        Log    Probably a cat. 🤔
    END

create file and write
    [Tags]     API      EMAIL
    Create File     helloworld.txt          Hi iam new in file handling

#file checking
#    [Tags]     API      EMAIL
#    file should exist       helloworld.txt       where is my file
#    file should not exist   helloworl2d.txt       my file is found
##    ${values}=      get environment variable        %{path}
##    log to console     ${values}
#    ${getfile}=         get file                C:\Users\tarun.jaiswal\PycharmProjects\pythonProject\robotframework\tests\epfo.pdf
#    log to console      ${getfile}















