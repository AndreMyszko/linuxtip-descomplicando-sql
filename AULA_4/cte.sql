-- Databricks notebook source
--lista de estados com menos clientes
SELECT descUF,
COUNT(DISTINCT idClienteUnico) AS clienteUnico

FROM silver_olist.cliente

GROUP BY descUF
ORDER BY COUNT(DISTINCT idClienteUnico) ASC


-- COMMAND ----------

SELECT idVendedor
FROM silver_olist.vendedor
WHERE descUF = 'SP'

-- COMMAND ----------

--select dentro do outro ainda não é cte, é "nojento", peidorrero desta forma ;-;
SELECT
  idVendedor, descUF
FROM
  silver_olist.vendedor
WHERE
  descUF = (
    SELECT
      descUF
    FROM
      silver_olist.cliente
    GROUP BY
      descUF
    ORDER BY
      COUNT (DISTINCT idClienteUnico) DESC
    LIMIT
      1
  )

-- COMMAND ----------

--ainda não, "da vontade de dar um tiro na cara do mlko q fez isso.. chatiado ;-;"
SELECT
  idVendedor, descUF
FROM
  silver_olist.vendedor
WHERE
  descUF IN (
    SELECT
      descUF
    FROM
      silver_olist.cliente
    GROUP BY
      descUF
    ORDER BY
      COUNT (DISTINCT idClienteUnico) DESC
    LIMIT
      2
  )

-- COMMAND ----------

-- CTE -> common table expression -> clausula WITH
WITH tb_estados AS (
  SELECT
    descUF
  FROM
    silver_olist.cliente
  GROUP BY
    descUF
  ORDER BY
    COUNT (DISTINCT idClienteUnico) DESC
  LIMIT
    2
), tb_vendedores AS (
  SELECT
    idVendedor,
    descUF
  FROM
    silver_olist.vendedor
  WHERE
    descUF IN (
      SELECT
        descUF
      FROM
        tb_estados
    )
  LIMIT
    5
)
SELECT * FROM tb_vendedores

-- COMMAND ----------

-- CTE -> common table expression -> clausula WITH
WITH tb_estados AS (
  SELECT
    descUF
  FROM
    silver_olist.cliente
  GROUP BY
    descUF
  ORDER BY
    COUNT (DISTINCT idClienteUnico) DESC
  LIMIT
    2
)
SELECT * FROM tb_estados

-- COMMAND ----------

-- nota média dos pedidos dos venededores de cada estado
WITH tb_pedido_nota AS (
  SELECT
    idVendedor,
    vlNota
  FROM
    silver_olist.item_pedido AS T1
    LEFT JOIN silver_olist.avaliacao_pedido AS T2 ON T1.idPedido = T2.idPedido
),
tb_avg_vendedor AS (
  SELECT
    idVendedor,
    AVG(vlNota) AS avgNota
  FROM
    tb_pedido_nota
  GROUP BY
    idVendedor
),
tb_vendedor_estado AS (
  SELECT
    T1.*,
    T2.descUF
  FROM
    tb_avg_vendedor AS T1
    LEFT JOIN silver_olist.vendedor AS T2 ON T1.idVendedor = T2.idVendedor
)
SELECT *
FROM
  tb_vendedor_estado

-- COMMAND ----------


