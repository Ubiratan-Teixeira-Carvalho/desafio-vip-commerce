# language: pt

Feature: Adicionar Combo ao carrinho

    Como um cliente eu gostaria de poder
    Adicionar combos de produtos ao meu carrinho
    Para que eu possa ganhar um desconto nos produtos 
    com preço promocional 

Concedido os seguintes combos:
  Examples:
    |         nome          |          lista_produtos                  |   data_inicial  |  data_final  |  Centro_Distribuição  |  
    |   oferta_relampago    |  Presunto,queijo,mortandela,salsicha     |    24/09/2020   |  27/09/2020  |          sim          |         
    |   oferta_Churrasco    |  Cerveja,Vinho,Cachaça,refrigerante      |    22/09/2020   |  26/09/2020  |          não          |         
    |   oferta_limpeza      |  Detergente,Sabão,Desinfetante,Álcool    |    24/09/2020   |  28/09/2020  |          sim          |                     
 


    Scenario Outline: Cliente inclui o combo no carrinho
    Given que o sistema exibe uma lista de combos disponíveis
    Then o cliente inclui um combo no carrinho
    And o sistema externo exibe o seguinte combo adicionado ao carrinho:
    |         nome          |          lista_produtos                  |   data_inicial  |  data_final  |  Centro_Distribuição  |  
    |   oferta_relampago    |  Presunto,queijo,mortandela,salsicha     |    24/09/2020   |  27/09/2020  |          sim          | 

    

    Scenario Outline: Verificação da quantidade de produtos no combo
    When  que o cliente inclui o combo no carrinho
    Then o sistema externo verifica se a quantidade de produtos do combo é no maximo 4
    usando o combo selecionado pelo cliente a seguir:
    |         nome          |          lista_produtos                  |   data_inicial  |  data_final  |  Centro_Distribuição  |  
    |   oferta_limpeza      |  Detergente,Sabão,Desinfetante,Álcool    |    24/09/2020   |  28/09/2020  |          sim          |                     



  
  