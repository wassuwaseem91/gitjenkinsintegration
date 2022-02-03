*** Settings ***
Library     RequestsLibrary
Library     Collections
Library    JSONLibrary
*** Variables ***
${url}   http://thetestingworldapi.com/Help
*** Test Cases ***
TC1
   create session   testapi    ${url}
   ${m}=   get on session    testapi     api/technicalskills
   log to console    ${m}
   log to console    ${m.content}

TC2
   create session   testapi    ${url}
   &{a}=   create dictionary   first_name=wasim  middle_name=akram   last_name=M   date_of_birth=01/10/1990
   ${post}=   post on session   testapi     api/studentsDetails     data=${a}
   log to console   ${post.status_code}

TC3
    create session   testapi    ${url}
    &{a}=   create dictionary   first_name=wasim  middle_name=akram   last_name=9951   date_of_birth=01/10/1990
    ${content}=  create dictionary   Content-Type=application/json
    ${response}=   put on session    testapi    api/studentsDetails/   data= ${a}    headers=${content}
    ${code}=    convert to string   ${response.status_code}
    log to console    ${code}



