-- 2.1) Consulta que retorne todos os pedidos do cliente “AFONSO COSTA”
SELECT
    C5.C5_NUM AS Numero_Pedido,
    C5.C5_EMISSAO AS Data_Emissao
FROM
    C5
    JOIN A1 ON C5.C5_CODCLI = A1.A1_COD
WHERE
    A1.A1_NOME = 'AFONSO COSTA';

-- 2.2) Consulta que retorne todos os pedidos (com seus itens respectivos) emitidos no mês de janeiro de 2023
SELECT
    C5.C5_NUM AS Numero_Pedido.C5.C5_EMISSAO AS Data_Emissao,
    C6.C6_ITEM AS Numero_Item,
    C6.C6_CODPROD AS Codigo_Produto,
    C6.C6_QTD AS Quantidade,
    C6.C6_PRUNIT AS Preco_Unitario
FROM
    C5
    JOIN C6 ON C5.C5_NUM = C6.C6_NUM
WHERE
    C5.C5_EMISSAO BETWEEN '2023-01-01' AND '2023-01-31';

-- 2.3) Consulta que retorne o valor total dos pedidos em fevereiro de 2023
SELECT
    SUM(C6.C6_QTD * C6.C6_PRUNIT) AS Valor_Total_Fevereiro_2023
FROM
    C5
    JOIN C6 ON C5.C5_NUM = C6.C6_NUM
WHERE
    C5.C5_EMISSAO BETWEEN '2023-02-01' AND '2023-02-28';

-- 2.4) Consulta que retorne o valor total dos pedidos agrupados por nome de vendedor
SELECT
    A3.A3_NOME AS Nome_Vendedor,
    SUM(C6.C6_QTD * C6.C6_PRUNIT) AS Valor_Total_Pedidos
FROM
    C5
    JOIN C6 ON C5.C5_NUM = C6.C6_NUM
    JOIN A3 ON C5.C5_CODVEN = A3.A3_COD
GROUP BY
    A3.A3_NOME;

-- 2.5) Consulta que retorne o valor total dos pedidos, vendidos em 2022 agrupados por tipo de cliente (pessoa física ou jurídica)
SELECT
    A1.A1_TIPO AS Tipo_Cliente,
    SUM(C6.C6_QTD * C6.C6_PRUNIT) AS Valor_Total_Pedidos
FROM
    C5
    JOIN C6 ON C5.C5_NUM = C6.C6_NUM
    JOIN A1 ON C5.C5_CODCLI = A1.A1_COD
WHERE
    C5.C5_EMISSAO LIKE '2022%'
GROUP BY
    A1.A1_TIPO;

-- 2.6) Consulta que retorne o valor total dos pedidos, vendidos no primeiro semestre de 2023 agrupados por região do vendedor
SELECT
    A3.A3_REGIAO AS Regiao_Vendedor SUM(C6.C6_QTD * C6.C6_PRUNIT) AS Valor_Total_Pedidos
FROM
    C5
    JOIN C6 ON C5.C5_NUM = C6.C6_NUM
    JOIN A3 ON C5.C5_CODVEN = A3.A3_COD
WHERE
    C5.C5_EMISSAO BETWEEN '2023-01-01' AND 2023  -06 -30
GROUP BY
    A3.A3_REGIAO;