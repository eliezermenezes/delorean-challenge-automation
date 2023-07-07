*** Settings ***
Resource    ../main.resource


*** Variables ***
&{botao}
...                     salvar=css:[data-test="save"]
...                     cancelar=css:[data-test="cancel"]
...                     sim=css:[data-test="yes"]
...                     deletar=css:[data-test="delete-multiple"]
&{caixa_de_selecao}
...                     todos=css:[data-test="select-all"]
${notificacao}          xpath=//div[contains(@class,"mdc-snackbar__label") and contains(text(),"#message")]


*** Keywords ***
Clicar no botão salvar
    Click Button    ${botao.salvar}

Clicar no botão cancelar
    Click Button    ${botao.cancelar}

Clicar no botão sim da caixa de diálogo
    Click Button    ${botao.sim}

Clicar no botão remover selecionados
    Click Button    ${botao.deletar}

Clicar para selecionar todos os registros da tabela
    Click Element    ${caixa_de_selecao.todos}

# Asserções

A mensagem "${experada}" deve ser exibida
    Wait Until Element Is Visible    ${notificacao.replace("#message", "${experada}")}
