-- Criando uma cópia da tabela original
CREATE OR REPLACE TABLE `project.violencias_raw`
AS
SELECT * FROM `basedosdados.br_ms_sinan.microdados_violencia`;
