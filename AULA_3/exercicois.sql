-- Databricks notebook source
-- atrasos na entrega em dezembro 2017
SELECT
date(dtEntregue),
date(dtEstimativaEntrega),
*
FROM
  silver_olist.pedido
WHERE year(dtPedido) = 2017
AND month(dtPedido) = 12
AND descSituacao = 'delivered'
AND date(dtEntregue) > date(dtEstimativaEntrega)

-- COMMAND ----------

-- pedidos com duas ou mais parcelas
SELECT *,
  ROUND((vlPagamento / nrPacelas), 2) AS parcelasMaiores
FROM
  silver_olist.pagamento_pedido
WHERE nrPacelas >= 2
AND vlPagamento / nrPacelas < 20

-- COMMAND ----------

-- case 02 selecione todos os intens de pedidos e defina os grupos em uma nova coluna
SELECT
  *,
  vlPreco + vlFrete AS vlTotal,
  vlFrete / (vlPreco + vlFrete) AS pctFrete,
  CASE
    WHEN vlFrete / (vlPreco + vlFrete) <= 0.1 THEN '10%'
    WHEN vlFrete / (vlPreco + vlFrete) <= 0.25 THEN '10% A 25%'
    WHEN vlFrete / (vlPreco + vlFrete) <= 0.5 THEN '10% A 50%'
    ELSE '+50%'
  END AS descFretePct
FROM
  silver_olist.item_pedido
