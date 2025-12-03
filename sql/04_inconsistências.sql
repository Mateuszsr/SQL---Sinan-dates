-- Identificar inconsistências (data_encerramento anterior a data_ocorrencia)
SELECT *
FROM `project.violencias_dedup`
WHERE data_encerramento IS NOT NULL AND data_encerramento < data_ocorrencia
LIMIT 100;
