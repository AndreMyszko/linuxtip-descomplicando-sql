-- Databricks notebook source
SELECT
  *,
  CASE
    WHEN descUF = 'SP' THEN 'paulista'
    WHEN descUF = 'RJ' THEN 'carioca'
    WHEN descUF = 'PR' THEN 'paranaense'
    ELSE 'outros'
  END AS descNacionalidade
FROM
  silver_olist.cliente

-- COMMAND ----------

SELECT
  *,
  CASE
    WHEN descUF = 'SP' THEN 'paulista'
    WHEN descUF = 'RJ' THEN 'carioca'
    WHEN descUF = 'PR' THEN 'paranaense'
    ELSE 'outros'
  END AS descNacionalidade,
  CASE
    WHEN descCidade LIKE '%sao%' THEN 'Tem são no nome'
    ELSE 'Não tem são no nome'
  END AS temSaoNoNome,
  CASE WHEN descUF IN ('MG', 'DF', 'ES') THEN 'dentro do IN'
  ELSE 'Não contempla'
  END AS dentroDoIN
FROM
  silver_olist.cliente

-- COMMAND ----------

SELECT
  *
FROM
  silver_olist.cliente
WHERE
  descCidade = 'sao paulo'

-- COMMAND ----------

SELECT
  *
FROM
  silver_olist.vendedor
WHERE
  descCidade = 'rio de janeiro'
  OR descUF = 'SP'

-- COMMAND ----------

SELECT
  *
FROM
  silver_olist.produto
WHERE
  descCategoria IN ('perfumaria', 'bebes')
  AND vlAlturaCm > 5

-- COMMAND ----------


