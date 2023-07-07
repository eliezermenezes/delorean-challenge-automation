*** Settings ***
Resource    ../main.resource


*** Variables ***
${URL}          https://eliezermenezes.github.io/delorean-challenge
${BROWSER}      chrome


*** Keywords ***
Definir tamanho da janela do navegador
    IF    'headless' in '${BROWSER}'
        Set Window Size    1900    1080
    ELSE
        Maximize Browser Window
    END

Abrir o navegador e acessar o site do Delorean Challenge
    Open Browser    ${URL}    ${BROWSER}
    Definir tamanho da janela do navegador

Fechar o navegador
    Close Browser
