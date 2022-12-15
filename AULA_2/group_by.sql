-- Databricks notebook source
SELECT
  descUF,
  count(DISTINCT idClienteUnico)
FROM
  silver_olist.cliente
GROUP BY
  descUF
