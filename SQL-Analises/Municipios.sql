-- Top 10 municípios com mais notificações (últimos 5 anos)
SELECT id_municipio_residencia, COUNT(*) AS total
FROM `project.violencias_dedup`
WHERE data_ocorrencia BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 5 YEAR) AND CURRENT_DATE()
GROUP BY id_municipio_residencia
ORDER BY total DESC
LIMIT 10;
