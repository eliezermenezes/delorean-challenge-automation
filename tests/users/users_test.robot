*** Settings ***
Documentation       Suite de testes para manipular a página de usuários do site.
...                 Adiciona, edita e remove usuários.

Resource            ../../resources/pages/users.resource

Suite Setup         Abrir o navegador e acessar o site do Delorean Challenge
Suite Teardown      Fechar o navegador
Test Setup          Reload Page


*** Test Cases ***
CT01 - Deve ser possível adicionar um novo usuário
    # When
    Digitar o nome completo do usuário
    Digitar o email do usuário
    Escolher as tecnologias favoritas do usuário
    Clicar no botão salvar
    # Then
    Verificar se o usuário foi cadastrado

CT02 - Deve ser possível editar um usuário existente
    # Given
    Adicionar um novo usuário
    # When
    Clicar no ícone de editar usuário
    Digitar o email do usuário
    Clicar no botão salvar
    # Then
    Verificar se o usuário foi editado

CT03 - Deve ser possível remover um usuário existente
    # Given
    Adicionar um novo usuário
    # When
    Clicar no ícone de remover usuário
    Clicar no botão sim da caixa de diálogo
    # Then
    Verificar se o usuário foi removido

CT04 - Deve ser possível remover vários usuários existentes
    # Given
    Adicionar cinco novos usuários
    # When
    Clicar para selecionar todos os registros da tabela
    Clicar no botão remover selecionados
    Clicar no botão sim da caixa de diálogo
    # Then
    Verificar se a lista de usuários está vazia
