*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
TC1
    open browser    https://www.google.com     chrome
    click element   class:gb_f
    click element   class:button
    close browser