*** Settings ***
Documentation   Resources to be used in Test Cases
...
...             This test follows the example using keywords fomr the SeleniumLibary
...             
Library         SeleniumLibrary
Library         Collections

*** Variables ***
@{ASC}
    ...     Sauce Labs Backpack
    ...     Sauce Labs Bike Light
    ...     Sauce Labs Bolt T-Shirt
    ...     Sauce Labs Fleece Jacket
    ...     Sauce Labs Onesie
    ...     Test.allTheThings() T-Shirt (Red)

@{DEC}
    ...     Test.allTheThings() T-Shirt (Red)
    ...     Sauce Labs Onesie
    ...     Sauce Labs Fleece Jacket
    ...     Sauce Labs Bolt T-Shirt
    ...     Sauce Labs Bike Light
    ...     Sauce Labs Backpack

@{LOHI}
    ...     Sauce Labs Onesie
    ...     Sauce Labs Bike Light
    ...     Sauce Labs Bolt T-Shirt
    ...     Test.allTheThings() T-Shirt (Red)
    ...     Sauce Labs Backpack
    ...     Sauce Labs Fleece Jacket

@{HILO}
    ...     Sauce Labs Fleece Jacket
    ...     Sauce Labs Backpack
    ...     Sauce Labs Bolt T-Shirt
    ...     Test.allTheThings() T-Shirt (Red)
    ...     Sauce Labs Bike Light
    ...     Sauce Labs Onesie

*** Keywords ***
Check ASC Order
    ${i}=   Set Variable    0
    ${weblist}=     Get WebElements     class:inventory_item_name
    FOR     ${element}  IN  @{weblist}
        ${temp}=    Get From List       ${ASC}      ${i}
        Should Be Equal     ${element.text}     ${temp}
        ${i}=   Evaluate    ${i}+1
    END

Check DEC Order
    ${i}=   Set Variable    0
    ${weblist}=     Get WebElements     class:inventory_item_name
    FOR     ${element}  IN  @{weblist}
        ${temp}=    Get From List       ${DEC}      ${i}
        Should Be Equal     ${element.text}     ${temp}
        ${i}=   Evaluate    ${i}+1
    END

Check LOHI Order
    ${i}=   Set Variable    0
    ${weblist}=     Get WebElements     class:inventory_item_name
    FOR     ${element}  IN  @{weblist}
        ${temp}=    Get From List       ${LOHI}      ${i}
        Should Be Equal     ${element.text}     ${temp}
        ${i}=   Evaluate    ${i}+1
    END

Check HILO Order
    ${i}=   Set Variable    0
    ${weblist}=     Get WebElements     class:inventory_item_name
    FOR     ${element}  IN  @{weblist}
        ${temp}=    Get From List       ${HILO}      ${i}
        Should Be Equal     ${element.text}     ${temp}
        ${i}=   Evaluate    ${i}+1
    END