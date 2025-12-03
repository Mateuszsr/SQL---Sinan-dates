-- Percentual de violência sexual por faixa etária
SELECT
  CASE
    WHEN idade_paciente < 10 THEN '0-9'
    WHEN idade_paciente BETWEEN 10 AND 19 THEN '10-19'
    WHEN idade_paciente BETWEEN 20 AND 39 THEN '20-39'
    WHEN idade_paciente BETWEEN 40 AND 59 THEN '40-59'
    ELSE '60+'
  END AS faixa,
  COUNT(*) AS total,
  SUM(CASE WHEN ocorreu_violencia_sexual = '1' THEN 1 ELSE 0 END) AS sexual,
  ROUND(100 * SUM(CASE WHEN ocorreu_violencia_sexual = '1' THEN 1 ELSE 0 END)/COUNT(*),2) AS pct_sexual
FROM `project.violencias_dedup`
GROUP BY faixa
ORDER BY pct_sexual DESC;
