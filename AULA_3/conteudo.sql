-- Databricks notebook source
--order by -> top3 estados com mais cliente únicos
SELECT
  descUF,
  COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
FROM
  silver_olist.cliente
GROUP BY
  descUF
ORDER BY
  qtClienteEstado DESC
LIMIT 3

-- COMMAND ----------

--top 5 estados com mais de 100 vendedores registrados dentro de um grupo seleto de estados
SELECT
  descUF,
  count(idVendedor) AS qtVendedorUF
FROM
  silver_olist.vendedor
WHERE
  descUF IN ('SP', 'PR', 'MG', 'SC', 'RJ', 'ES', 'RS', 'GO')
GROUP BY
  descUF
HAVING
  qtVendedorUF >= 100
ORDER BY
  qtVendedorUF DESC, descUF ASC
LIMIT
  5

-- COMMAND ----------


