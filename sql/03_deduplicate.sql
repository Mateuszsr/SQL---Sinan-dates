-- Retirando duplicatas
CREATE OR REPLACE TABLE `project.violencias_dedup` AS
WITH ranked AS (
  SELECT *,
    ROW_NUMBER() OVER (
      PARTITION BY COALESCE(id_municipio_residencia,'-'), COALESCE(CAST(data_ocorrencia AS STRING), '-'),
                   COALESCE(CAST(idade_paciente AS STRING), '-'), COALESCE(sexo_paciente,'-')
      ORDER BY 
        -- prioriza registros com data_encerramento mais recente e mais campos preenchidos
        CASE WHEN data_encerramento IS NOT NULL THEN 1 ELSE 0 END DESC,
        (   -- conta campos não nulos (quanto mais, melhor)
          (IFNULL(idade_paciente, -1) >= 0) + 
          (IFNULL(sexo_paciente,'') != '') + 
          (IFNULL(ocorreu_violencia_sexual, '') != '')
        ) DESC
    ) AS rn
  FROM `project.violencias_clean`
)
SELECT * EXCEPT(rn) FROM ranked WHERE rn = 1;
