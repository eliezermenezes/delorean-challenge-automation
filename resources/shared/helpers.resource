*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary    locale=pt_BR
Library     String


*** Variables ***
${notificacao}      xpath=//div[contains(@class,"mdc-snackbar__label") and contains(text(),"#message")]


*** Keywords ***
Generate Name
    ${name}    Name
    Set Suite Variable    ${NAME}

Generate Email
    ${email}    Email
    Set Suite Variable    ${EMAIL}

Select Multiple Checkboxes
    [Arguments]    ${locator}    ${amount}

    ${webelements}    Get WebElements    ${locator}

    # Get random elements from list
    ${chosen_elements}    Random Elements    ${webelements}    length=${amount}    unique=True

    # Select the chosen checkboxes
    FOR    ${element}    IN    @{chosen_elements}
        Select Checkbox    ${element}
    END

Is Snackbar Text
    [Arguments]    ${expected}
    ${element}    Replace String    ${notificacao}    \#message    ${expected}
    Wait Until Element Is Visible    ${element}
