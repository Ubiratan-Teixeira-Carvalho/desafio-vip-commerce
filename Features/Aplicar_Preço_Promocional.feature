#language:pt

Feature: Aplicar do preço promocional no carrinho via API

    O Sistema deve permitir a inclusão do preço promocional
    Após o cliente incluir o combo no carrinho
    Para otimizar o uso do sistema e garantir uma maior segurança


    Concedido os seguintes produtos:
    Examples:
    |  código  | preço_padrão | estoque |
    |  021519  |     12.50    |   sim   |
    |  024875  |     8.20     |   não   |
    |  039211  |     3.40     |   sim   |
    

    As seguintes Ofertas:
    Examples:
    | código_produto | preço_promocional | quantidade |
    |      021519    |       10.00       |      3     |
    |      024875    |       3.35        |      5     |
    |      039211    |       1.10        |      2     |


    Os seguintes combos:
    Examples:
    |         nome          |          lista_produtos                 |   data_inicial  |  data_final  |  Centro_Distribuição  |  
    |   oferta_relampago    |  Presunto,queijo,mortandela,salsicha     |    24/09/2020   |  27/09/2020  |          sim          |         
    |   oferta_Churrasco    |  Cerveja,Vinho,Cachaça,Refrigerante    |    22/09/2020   |  26/09/2020  |          não          |         
    |   oferta_limpeza      |  Detergente,Sabão,Desinfetante,Álcool  |    24/09/2020   |  28/09/2020  |          sim          |                     
 



    Scenario Outline:  Adicionar um preço promocional no carrinho via API
     When o usuário incluir o combo no carrinho com os seguintes produtos:
      |  código  | preço_padrão | estoque |
      |  021519  |     12.50    |   sim   |
      |  024875  |     8.20     |   não   |
      |  039211  |     3.40     |   sim   |
     Then o sistema externo irá aplicar as seguintes ofertas nos produtos:
    | código_produto | preço_promocional | 
    |      021519    |       10.00       |     
    |      024875    |       3.35        |    
    |      039211    |       1.10        |     

   
    Scenario Outline: Verificação da quantidade de produtos no combo
    When  o cliente inclui o combo no carrinho
    Then  o sistema externo verifica a quantidade de produtos no combo baseado nas seguintes ofertas:
    | código_produto | preço_promocional | quantidade |
    |      039211    |       10.00       |      3     |
    |      089563    |       3.35        |      5     |
And o sistema externo confirma a aplicação do preço promocional 



    