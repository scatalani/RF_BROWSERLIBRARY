*** Settings ***
Resource    ../resources/serve-rest-front.resource


    

*** Test Cases ***
Login com Sucesso Serve Rest front
    Abrir o navegador
    Ir para o site Serve Rest
    Preencher os dados do novo usuario e cadastrar
    Conferir usuário cadastrado com sucesso

Listar os usuarios cadastrados
    Abrir o navegador
    Ir para o site Serve Rest
    Preencher os dados do novo usuario e cadastrar
    Listar os usuarios cadastrados
    Conferir que o usuario cadastrado está na lista

Cadastrar novo produto
    Abrir o navegador
    Ir para o site Serve Rest
    Preencher os dados do novo usuario e cadastrar
    Cadastrar novo produto
    Listar os produtos cadastrados
    Conferir que o produto cadastrado está na lista

    
