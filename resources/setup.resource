*** Settings ***
Resource    shared/helpers.resource
Resource    shared/common.resource


*** Variables ***
${URL}          https://eliezermenezes.github.io/delorean-challenge
${BROWSER}      chrome
# ${OPTIONS}      add_argument("--disable-dev-shm-usage"); add_argument("--headless"); add_argument("--no-sandbox")


*** Keywords ***
Abrir o navegador e acessar o site do Delorean Challenge
    Log To Console    Browser:
    Log To Console    ${BROWSER}
    Open Browser    ${URL}    ${BROWSER}
    IF    '${BROWSER}' == 'chrome'
        Maximize Browser Window
    ELSE
        Set Window Size    1900    1080
    END

Fechar o navegador
    Close Browser
