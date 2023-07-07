*** Settings ***
Resource    shared/helpers.resource
Resource    shared/common.resource


*** Variables ***
${URL}    https://eliezermenezes.github.io/delorean-challenge
# ${URL}          http://localhost:4200
${BROWSER}      chrome


*** Keywords ***
Abrir o navegador e acessar o site do Delorean Challenge
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Close Browser
