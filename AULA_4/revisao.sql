-- Databricks notebook source
-- revisão de join -> categoria com mais produtos
SELECT
  T2.descCategoria,
  count(*) AS qtdProdutos
FROM
  silver_olist.item_pedido AS T1
  LEFT JOIN silver_olist.produto AS T2 
  ON T1.idProduto = T2.idProduto
GROUP BY
  T2.descCategoria
ORDER BY count(*) DESC
LIMIT 5

-- COMMAND ----------

--categoria com produtos mais caros
SELECT
  T2.descCategoria,
  AVG(T1.vlPreco),
  MAX(T1.vlPreco)
FROM
  silver_olist.item_pedido AS T1
  LEFT JOIN silver_olist.produto AS T2 ON T1.idProduto = T2.idProduto
GROUP BY
  T2.descCategoria
ORDER BY
  MAX(T1.vlPreco) DESC,
  AVG(T1.vlPreco)

-- COMMAND ----------

--cliente de qual estado pagam mais frete?
SELECT
--   T1.idPedido,
--   T2.idCliente,
  AVG(T1.vlFrete) AS avgFrete,
--   T3.codCep,
  T3.descUF
FROM
  silver_olist.item_pedido AS T1
  LEFT JOIN silver_olist.pedido AS T2 ON T1.idPedido = T2.idPedido
  LEFT JOIN silver_olist.cliente AS T3 ON T2.idCliente = T3.idCliente
GROUP BY
  T3.descUF
HAVING AVG(T1.vlFrete)
ORDER BY
  avgFreteAVG(T1.vlFrete) DESC

-- COMMAND ----------


