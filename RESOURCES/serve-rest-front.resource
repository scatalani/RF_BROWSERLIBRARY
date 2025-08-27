*** Settings ***
Library    Browser
Library    FakerLibrary

*** Variables ***
${BROWSER}           chromium
${HEADLESS}          ${false}
${SITE_SERVE_REST}    https://front.serverest.dev/



*** Keywords ***
Abrir o navegador
...    New Browser    browser=${BROWSER}    
...                   headless=${HEADLESS}

       New Context     viewport={'width': 1200, 'height': 800}

Ir para o site Serve Rest
       New Page        url=${SITE_SERVE_REST}
       ${title}        Get Title  ==  Front - ServeRest
       Log  ${title}
              

Preencher os dados do novo usuario e cadastrar
         Click           css=a[data-testid='cadastrar']
         ${EMAIL}        FakerLibrary.Email
         Set Test Variable        ${EMAIL}
         Set Test Variable    ${NOME}         Simone Catalani
         Fill Text       css=input[data-testid='nome']        ${NOME}
         Fill Text       css=input[data-testid='email']       ${EMAIL}
         Fill Text       css=input[data-testid='password']    123456
         Check Checkbox  css=input[data-testid='checkbox']
         #Click           css=button[data-testid='cadastrar']
         Click           xpath=//*[@id="root"]//button >> text="Cadastrar"
         Sleep    5s
         ${NOME_PRODUTO}   FakerLibrary.text
         Set Test Variable    ${NOME_PRODUTO}

Conferir usuário cadastrado com sucesso
    Wait For Elements State        h1       visible
    Get Text                       h1  ==  Bem Vindo Sih Catalani
    Get Element States             css=button[data-testid='logout']  validate  value & value

#Logar com usuario cadastrado

Listar os usuarios cadastrados
    Click           css=a[data-testid='listarUsuarios']
    Sleep    5s

Conferir que o usuario cadastrado está na lista
    ${elemento}    Get Table Cell Element    css=table      "Nome"     "${EMAIL}"    
    ${usuario_cadastrado}    Get Text    ${elemento}  ==  Simone Catalani
    Highlight Elements    ${elemento}
    Take Screenshot    fullPage=${true}

Cadastrar novo produto
    Click         css=a[data-testid='cadastrar-produtos']
    Fill Text       css=input[data-testid='nome']        ${NOME_PRODUTO}
    Fill Text       css=input[data-testid='preco']       5
    Fill Text       xpath=//textarea[@id='description']       Produto com qualidade
    Fill Text       css=input[data-testid='quantity']  10
    Click           css=button[data-testid='cadastarProdutos']
    Sleep    5s

Listar os produtos cadastrados
     Click           css=a[data-testid='listar-produtos']
     Sleep    5s

Conferir que o produto cadastrado está na lista
     ${elemento}    Get Table Cell Element    css=table      "Nome"     "${NOME_PRODUTO}"    
       ${produto_cadastrado}    Get Text    ${elemento}  ==  ${NOME_PRODUTO}
     Highlight Elements    ${elemento}
     Take Screenshot    fullPage=${true}

   