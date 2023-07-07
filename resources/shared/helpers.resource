*** Settings ***
Resource    ../main.resource


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
