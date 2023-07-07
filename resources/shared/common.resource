*** Settings ***
Resource    ../setup.resource


*** Variables ***
&{botao}
...                     salvar=css:[data-test="save"]
...                     cancelar=css:[data-test="cancel"]
...                     sim=css:[data-test="yes"]
...                     deletar=css:[data-test="delete-multiple"]
${selecionar_todos}     css:[data-test="select-all"]


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
    Click Element    ${selecionar_todos}
