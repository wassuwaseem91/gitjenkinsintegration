*** Settings ***
Library     Selenium2Library
Library    Collections
Variables   data.py
Library   regex.py


*** Variables ***
@{list}
@{list2}
*** Test Cases ***
TC1
    open browser   ${url}    ${browser}
    maximize browser window
    click element   ${sign_in}
    input text    ${user_name}   tennis@biz.com
    input text   ${password}    test01
    click element   ${submit}
    page should contain   Wise Tennis
    click element   ${services}
    ${table_row}=  get element count    //table[@id='services-table']//tbody/tr[1]/td
    FOR   ${i}   IN RANGE     ${table_row}
         ${iplus}=    evaluate    ${i} + 1
         ${l}=    get text    //table[@id='services-table']//tbody/tr[1]/td[${iplus}]
         Append To List   ${list}    ${l}
         #log    ${l}   warn
    END
    log   ${list}   warn

TC2
    ${price}=  get element count    //table[@id='services-table']//tbody/tr/td[6]
    FOR   ${i}   IN RANGE   ${price}
         ${x}=    evaluate    ${i} + 1
         ${l}=    get text    //table[@id='services-table']//tbody/tr[${x}]/td[6]
         Append To List   ${list2}    ${l}
    END
    log   ${list2}
    regex.reg_ex  ${list2}


    Run Keyword If   ${price} == 3  log  hi  warn
    ...  ELSE    log  hello   warn
    close browser




