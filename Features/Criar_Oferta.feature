# language: pt


Feature: Criar Oferta

    Como um administrador eu gostaria de poder adicionar ofertas ao meu sistema
    Para que eu possa aumentar a visibilidade do sistema e do que é vendido no mesmo

      Concedido os seguintes produtos:
    Examples:
    |  código  | preço_padrão | estoque |
    |  021519  |     12.50    |   sim   |
    |  024875  |     8.20     |   não   |
    |  039211  |     3.40     |   sim   |

     Os seguintes combos:
    Examples:
    |         nome          |          lista_produtos                |   data_inicial  |  data_final  |  Centro_Distribuição   |  
    |   oferta_relampago    |  Presunto,queijo,mortandela,salsicha   |    24/09/2020   |  27/09/2020  |          sim           |         
    |   oferta_Churrasco    |  Cerveja,Vinho,Cachaça,Refrigerante    |    22/09/2020   |  26/09/2020  |          não           |         
    |   oferta_limpeza      |  Detergente,Sabão,Desinfetante,Álcool  |    24/09/2020   |  28/09/2020  |          sim           |     




    Scenario Outline: Verificação Estoque da oferta
     Given os seguintes produtos:
       |  código  | preço_padrão | estoque |
       |  021519  |     12.50    |   sim   |
       |  024875  |     8.20     |   não   |
       |  039211  |     3.40     |   sim   |
     When o admnistrador tenta criar a oferta
     Then  o sistema externo verifica o estoque do produto:
       |  código   | estoque |
       |  024875   |   não   |
       |  039211   |   sim   |
         


    Scenario Outline: Verificação do centro de distribuição
    When o admnistrador tenta criar a oferta
    Then o sistema externo exibe a tabela de combos da seguinte forma:
      |         nome          |          lista_produtos                |   data_inicial  |  data_final  |  Centro_Distribuição   |  
      |   oferta_relampago    |  Presunto,queijo,mortandela,salsicha   |    24/09/2020   |  27/09/2020  |          sim           |         
      |   oferta_Churrasco    |  Cerveja,Vinho,Cachaça,Refrigerante    |    22/09/2020   |  26/09/2020  |          não           |         
      |   oferta_limpeza      |  Detergente,Sabão,Desinfetante,Álcool  |    24/09/2020   |  28/09/2020  |          sim           | 
    And  o sistema externo verifica se o produto do combo está associado a um centro de distribuição:
      |            lista_produtos           |   Centro_Distribuição   | 
      | Presunto,queijo,mortandela,salsicha |           sim           |
      | Cerveja,Vinho,Cachaça,Refrigerante  |           não           |
      


    Scenario Outline: Verificação Período da Oferta 
      When o admnistrador tenta criar a oferta
      Then é dado a seguinte tabela:
      |         nome          |         Código_produtos         |  data_inicial  |  data_final  | 
      |   oferta_relampago    |   547849,159872,87459,026595    |   24/09/2020   |  27/09/2020  |               
      |   oferta_Churrasco    |   039211,450698,048759,126985   |   22/09/2020   |  26/09/2020  |               
      |   oferta_limpeza      |   024875,264978,123059,210219   |   24/09/2020   |  28/09/2020  |    
        And  é comparado se já possui um produto com o mesmo período de uma oferta existente com a seguinte tabela:        
         |  código  | 
         |  021519  |     
         |  024875  |   
         |  039211  |     
