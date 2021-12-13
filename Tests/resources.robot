*** Settings ***
Documentation   A test suite for the test cases for the SauceDemo website 
...
...             This test follows the example using keywords fomr the SeleniumLibary
...             
Library         SeleniumLibrary

*** Test Cases ***
1
    Open Browser    https://www.saucedemo.com/  chrome
    Maximize browser Window
    Input Text  user-name       standard_user
    Input Text  password        secret_sauce
    Click Button    login-button
    Element Text Should Be  class:title     PRODUCTS
    [Teardown]  Close Browser

2
    Open Browser    https://www.saucedemo.com/  chrome
    Maximize browser Window
    Input Text  user-name       locked_out_user
    Input Text  password        secret_sauce
    Click Button    login-button
    Element Text Should Be  class:error-message-container     Epic sadface: Sorry, this user has been locked out.
    [Teardown]  Close Browser

3
    Open Browser    https://www.saucedemo.com/  chrome
    Maximize browser Window
    Input Text  user-name       standard_user
    Input Text  password        s3cret_sauce
    Click Button    login-button
    Element Text Should Be  class:error-message-container     Epic sadface: Username and password do not match any user in this service
    [Teardown]  Close Browser

3
    Open Browser    https://www.saucedemo.com/  chrome
    Maximize browser Window
    Input Text  user-name       problem_user
    Input Text  password        secret_sauce
    Click Button    login-button
    Element Text Should Be  class:error-message-container     Epic sadface: Username and password do not match any user in this service
    [Teardown]  Close Browser

4
    