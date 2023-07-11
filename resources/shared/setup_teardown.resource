*** Settings ***
Resource    ../main.resource


*** Variables ***
${URL}          https://eliezermenezes.github.io/delorean-challenge
${BROWSER}      chrome
${OPTIONS}      add_argument("--disable-dev-shm-usage"); add_argument("--headless"); add_argument("--no-sandbox")


*** Keywords ***
Definir tamanho da janela do navegador
    IF    'headless' in '${BROWSER}'
        Set Window Size    1900    1080
    ELSE
        Maximize Browser Window
    END

Abrir o navegador e acessar o site do Delorean Challenge
    Open Browser    ${URL}    ${BROWSER}    options=${OPTIONS}
    Definir tamanho da janela do navegador

Fechar o navegador
    Close Browser
