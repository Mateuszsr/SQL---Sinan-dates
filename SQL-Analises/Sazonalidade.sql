-- Sazonalidade: média móvel semanal de notificações
WITH semanal AS (
  SELECT
    DATE_TRUNC(data_ocorrencia, WEEK(MONDAY)) AS semana,
    COUNT(*) AS casos
  FROM `project.violencias_dedup`
  GROUP BY semana
)
SELECT semana, casos,
  AVG(casos) OVER (ORDER BY semana ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS media_movel_4sem
FROM semanal
ORDER BY semana;
