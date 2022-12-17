-- Databricks notebook source
--top 10 vendedore nível Brasil (sem function ainda)
WITH tb_vendas_vendedores AS (
  SELECT
    idVendedor,
    count(*) AS qtVendas
  FROM
    silver_olist.item_pedido
  GROUP BY
    idVendedor
  ORDER BY
    qtVendas DESC
)
SELECT
  T1.*,
  T2.descUF
FROM
  tb_vendas_vendedores AS T1
  LEFT JOIN silver_olist.vendedor AS T2 ON T1.idVendedor = T2.idVendedor
ORDER BY
  qtVendas DESC
  
LIMIT 10

-- COMMAND ----------

--WINDOW FUNCTION
--top 10 vendedores -> sendo apenas um por cada estado.
WITH tb_vendas_vendedores AS (
  SELECT
    idVendedor,
    count(*) AS qtVendas
  FROM
    silver_olist.item_pedido
  GROUP BY
    idVendedor
  ORDER BY
    qtVendas DESC
)
SELECT
  T1.*,
  T2.descUF,
  ROW_NUMBER() OVER (PARTITION BY T2.descUF ORDER BY qtVendas DESC) AS RN
FROM
  tb_vendas_vendedores AS T1
  LEFT JOIN silver_olist.vendedor AS T2 ON T1.idVendedor = T2.idVendedor
ORDER BY
  qtVendas DESC
  
LIMIT 10


-- COMMAND ----------

--WINDOW FUNCTION
--top 10 vendedores por cada estado
WITH tb_vendas_vendedores AS (
  SELECT
    idVendedor,
    count(*) AS qtVendas
  FROM
    silver_olist.item_pedido
  GROUP BY
    idVendedor
  ORDER BY
    qtVendas DESC
),
tb_row_number AS(
SELECT
  T1.*,
  T2.descUF,
  ROW_NUMBER() OVER (PARTITION BY T2.descUF ORDER BY qtVendas DESC) AS RN
FROM
  tb_vendas_vendedores AS T1
  LEFT JOIN silver_olist.vendedor AS T2 ON T1.idVendedor = T2.idVendedor
  QUALIFY RN <=10 -- qualify -> filtra window_function | having -> filtra group by
ORDER BY
  descUF, qtVendas DESC
)
  
SELECT * FROM tb_row_number WHERE RN <= 10


-- COMMAND ----------


