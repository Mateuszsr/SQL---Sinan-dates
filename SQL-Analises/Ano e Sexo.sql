-- Casos por ano e sexo
SELECT EXTRACT(YEAR FROM data_ocorrencia) AS ano, sexo_paciente, COUNT(*) AS casos
FROM `project.violencias_dedup`
GROUP BY ano, sexo_paciente
ORDER BY ano, casos DESC;
