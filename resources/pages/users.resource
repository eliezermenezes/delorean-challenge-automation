*** Settings ***
Resource    ../setup.resource
Library     String


*** Variables ***
&{usuario}
...             nome=css:[data-test="name"] input
...             email=css:[data-test="email"] input
...             tecnologias=css:[data-test="technologies"] input
&{lista}
...             editar=css:[data-test="#name"] ~ [data-test="options"] > [data-test="edit"]
...             remover=css:[data-test="#name"] ~ [data-test="options"] > [data-test="delete"]
...             vazia=css:[data-test="no-data"]


*** Keywords ***
# Dados de entrada

Digitar o nome completo do usuário
    Generate Name
    Input Text    ${usuario.nome}    ${NAME}

Digitar o email do usuário
    Generate Email
    Input Text    ${usuario.email}    ${EMAIL}

Escolher as tecnologias favoritas do usuário
    Select Multiple Checkboxes    ${usuario.tecnologias}    4

# Cliques

Clicar no ícone de editar usuário
    Click Element    ${lista.editar.replace("#name", "${NAME}")}

Clicar no ícone de remover usuário
    Click Element    ${lista.remover.replace("#name", "${NAME}")}

Adicionar um novo usuário
    Digitar o nome completo do usuário
    Digitar o email do usuário
    Escolher as tecnologias favoritas do usuário
    Clicar no botão salvar
    Verificar se o usuário foi cadastrado

Adicionar cinco novos usuários
    FOR    ${i}    IN RANGE    5
        Adicionar um novo usuário
    END

# Asserções

Verificar se a lista de usuários está vazia
    Element Should Not Be Visible    ${lista.vazia}

Verificar se o usuário foi cadastrado
    Is Snackbar Text    Usuário cadastrado com sucesso!

Verificar se o usuário foi editado
    Is Snackbar Text    Usuário atualizado com sucesso!

Verificar se o usuário foi removido
    Is Snackbar Text    Usuário deletado com sucesso!
