-- Databricks notebook source
-- buscar pela tabela fato, nesta arquitetura ela pode é a tabela de pedidos, com todos os ids
--JOIN, LEFT JOIN, RIGHT JOIN, INNER JOIN

--
SELECT
  T1.*,
  T2.descUF
FROM
  silver_olist.pedido AS T1
  LEFT JOIN silver_olist.cliente AS T2 ON T1.idCliente = T2.idCliente
