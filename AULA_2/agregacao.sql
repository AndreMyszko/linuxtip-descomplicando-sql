-- Databricks notebook source
SELECT
  count(*) AS totalLinhasNaoNulas
FROM
  silver_olist.cliente

-- COMMAND ----------

SELECT
  count(idCliente) AS totalClientesNaoNulos
FROM
  silver_olist.cliente

-- COMMAND ----------

SELECT
  count(distinct idCliente) AS totalClientesDistintosNaoNulos
FROM
  silver_olist.cliente

-- COMMAND ----------

SELECT
  count(idClienteUnico) AS totalClientesUnicos,
  count(DISTINCT idClienteUnico) AS totalClientesUnicos
FROM
  silver_olist.cliente

-- COMMAND ----------

SELECT
  count(*) AS habitantesDePrePru
FROM
  silver_olist.cliente
WHERE
  descCidade = 'presidente prudente'

-- COMMAND ----------

SELECT
  ROUND(AVG(vlPreco), 2) AS avgPrecoItem,
  PERCENTILE(vlPreco, 0.5) AS precoMedioItem,  --preco medio
  MAX(vlPreco) AS precoMAXItem,
  AVG(vlFrete) AS precoMINFrete,
  MAX(vlFrete) AS precoMAXFrete,
  MIN(vlFrete) AS precoMINFrete
FROM
  silver_olist.item_pedido

-- COMMAND ----------

SELECT COUNT(*)
FROM silver_olist.cliente
WHERE descUF = 'SP'
