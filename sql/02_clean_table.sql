
CREATE OR REPLACE TABLE `project.violencias_clean`
PARTITION BY DATE(data_ocorrencia)
CLUSTER BY id_municipio_residencia, sexo_paciente
AS
SELECT
  -- ids e códigos (mantém originais)
  tipo_notificacao,
  id_uf_notificacao,
  id_municipio_notificacao,
  id_municipio_6_notificacao,
  id_unidade_notificacao,
  id_regional_saude_notificacao,

  -- datas / hora
  SAFE_CAST(NULLIF(TRIM(data_ocorrencia), '') AS DATE) AS data_ocorrencia,
  SAFE_CAST(NULLIF(TRIM(hora_ocorrencia), '') AS TIME) AS hora_ocorrencia,
  SAFE_CAST(NULLIF(TRIM(data_encerramento), '') AS DATE) AS data_encerramento,

  -- residencia / ocorrencia
  id_uf_ocorrencia,
  id_municipio_ocorrencia,
  id_municipio_6_ocorrencia,
  id_uf_residencia,
  id_municipio_residencia,
  id_municipio_6_residencia,
  id_regional_saude_residencia,

  -- paciente: padroniza idade e ano
  CASE
    WHEN SAFE_CAST(NULLIF(TRIM(idade_paciente), '') AS INT64) BETWEEN 0 AND 120
      THEN SAFE_CAST(NULLIF(TRIM(idade_paciente), '') AS INT64)
    ELSE NULL
  END AS idade_paciente,
  CASE
    WHEN TRIM(UPPER(COALESCE(sexo_paciente, ''))) IN ('M', 'F', 'MASCULINO', 'FEMININO')
      THEN CASE WHEN SUBSTR(UPPER(TRIM(sexo_paciente)),1,1) = 'M' THEN 'M' ELSE 'F' END
    ELSE NULL
  END AS sexo_paciente,

  -- variáveis binárias (0/1/NULL) — normaliza 'Não informado' ou textos
  NULLIF(TRIM(encaminhamento_saude), '') AS encaminhamento_saude,
  NULLIF(TRIM(ocorreu_violencia_fisica), '') AS ocorreu_violencia_fisica,
  NULLIF(TRIM(ocorreu_violencia_psicologica), '') AS ocorreu_violencia_psicologica,
  NULLIF(TRIM(ocorreu_violencia_sexual), '') AS ocorreu_violencia_sexual,
  -- (adicione aqui outras colunas importantes)
  
  -- metadados
  CURRENT_TIMESTAMP() AS load_timestamp
FROM `project.violencias_raw`;
