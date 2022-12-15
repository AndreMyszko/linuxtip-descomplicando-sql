-- Databricks notebook source
SELECT * FROM silver_olist.pedido

-- COMMAND ----------

SELECT
  idPedido,
  descSituacao,
  dtEnvio,
  DATEDIFF(dtEstimativaEntrega, dtEntregue) AS qtDiasEntrega
FROM
  silver_olist.pedido
WHERE
  dtEnvio IS NOT NULL
  AND descSituacao = 'delivered'
ORDER BY
  dtEnvio

-- COMMAND ----------

SELECT
  idPedido,
  descSituacao,
  DATEDIFF(dtEstimativaEntrega, dtEnvio)
FROM
  silver_olist.pedido

-- COMMAND ----------

--MASTER TROLL SELECT WITH NO SOUL
SELECT
  idAvaliacao,
  idPedido,
  vlNota,
  descTituloComentario,
  descMensagemComentario,
  
  *
FROM
  silver_olist.avaliacao_pedido
  INNER JOIN silver_olist.cliente
  INNER JOIN silver_olist.geolocalizacao
  INNER JOIN silver_olist.item_pedido
  INNER JOIN silver_olist.pagamento_pedido
  INNER JOIN silver_olist.pedido
  INNER JOIN silver_olist.produto
  INNER JOIN silver_olist.vendedor
WHERE
  descTituloComentario IS NOT NULL
  AND descMensagemComentario IS NOT NULL
  
