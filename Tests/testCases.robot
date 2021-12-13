*** Settings ***
Documentation   A test suite for the test cases for the SauceDemo website 
...
...             This test follows the example using keywords fomr the SeleniumLibary
...             
Resource        resources.robot

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

4
    Open Browser    https://www.saucedemo.com/  chrome
    Maximize browser Window
    Input Text  user-name       problem_user
    Input Text  password        secret_sauce
    Click Button    login-button
    Click Element   item_4_title_link
    Element Text Should Not Be  class:inventory_details_name     Sauce Labs Backpack
    [Teardown]  Close Browser

5
    Open Browser    https://www.saucedemo.com/  chrome
    Maximize browser Window
    Input Text  user-name       standard_user
    Input Text  password        secret_sauce
    Click Button    login-button
    Select From List By Value   class:product_sort_container    az
    Check ASC Order
    [Teardown]  Close Browser

6
    Open Browser    https://www.saucedemo.com/  chrome
    Maximize browser Window
    Input Text  user-name       standard_user
    Input Text  password        secret_sauce
    Click Button    login-button
    Select From List By Value   class:product_sort_container    za
    Check DEC Order
    [Teardown]  Close Browser

7
    Open Browser    https://www.saucedemo.com/  chrome
    Maximize browser Window
    Input Text  user-name       standard_user
    Input Text  password        secret_sauce
    Click Button    login-button
    Select From List By Value   class:product_sort_container    lohi
    Check LOHI Order
    [Teardown]  Close Browser

8
    Open Browser    https://www.saucedemo.com/  chrome
    Maximize browser Window
    Input Text  user-name       standard_user
    Input Text  password        secret_sauce
    Click Button    login-button
    Select From List By Value   class:product_sort_container    hilo
    Check HILO Order
    [Teardown]  Close Browser