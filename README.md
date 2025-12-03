# 🗂️ Projeto: Análise e Tratamento dos Microdados de Violências (SINAN) — BigQuery + SQL

Este repositório apresenta um **projeto completo de tratamento, padronização e análise dos microdados de violências do SINAN**, utilizando **BigQuery (GCP)** e **SQL estruturado**.

O objetivo é demonstrar habilidades em:

- Limpeza e organização de dados complexos  
- Criação de pipelines SQL (ETL)  
- Deduplicação e normalização  
- Consultas analíticas eficientes  
- Estruturação de projeto para portfólio  
- Documentação clara e profissional  

---

## 📁 Estrutura do Repositório

├── sql/ # Scripts SQL de tratamento, limpeza e transformação (ETL)
│ ├── 01_raw_copy.sql
│ ├── 02_clean_table.sql
│ ├── 03_deduplicate.sql
│ └── 04_reference_tables.sql
│
├── sql_analises/ # Consultas analíticas e relatórios SQL
│ ├── 01_top_municipios.sql
│ ├── 02_serie_temporal.sql
│ ├── 03_faixa_etaria_violencia_sexual.sql
│ ├── 04_inconsistencias.sql
│ └── 05_metricas_resumo.sql
│
├── outputs/ # (Opcional) Amostras exportadas ou snapshots
│
└── README.md


---

## 🧩 Dados Utilizados

A base utilizada neste projeto é:

**Tabela:** `basedosdados.br_ms_sinan.microdados_violencia`  
**Fonte:** Base dos Dados + Ministério da Saúde (SINAN)

Para garantir reprodutibilidade e independência da tabela pública, o projeto inicia com uma **cópia local** da tabela no BigQuery.

---

# 🛠️ 1. Pipeline de Tratamento (pasta `/sql`)

A pasta `sql/` contém todo o fluxo de limpeza e transformação dos dados — um pequeno ETL estruturado.

### **📌 01_raw_copy.sql**
Cria uma cópia da tabela original, garantindo imutabilidade da fonte e permitindo manipulação segura.

### **📌 02_clean_table.sql**
Etapa principal de limpeza:

- Padronização de datas e horas (`SAFE_CAST`)
- Normalização de strings (UPPER, TRIM)
- Conversão de valores não informados para `NULL`
- Criação de variáveis derivadas (ex.: `ano_ocorrencia`)
- Padronização de categorias (ex.: sexo)
- Identificação e filtragem de inconsistências básicas
- Criação da tabela final organizada (`violencias_clean`)

### **📌 03_deduplicate.sql**
Remove duplicatas utilizando window functions:

- Seleciona o registro mais completo por indivíduo/ocorrência
- Mantém apenas uma linha por chave relevante (município × data × idade × sexo)

### **📌 04_reference_tables.sql**
Criação de tabelas auxiliares de referência:

- UF  
- Municípios  
- Tipos de violência  
- Tipos de autor  

Facilitam joins e análises posteriores.

---

# 📊 2. Consultas Analíticas (pasta `/sql_analises`)

A pasta `sql_analises/` reúne consultas bem organizadas e comentadas para demonstrar domínio analítico.

### **📌 01_top_municipios.sql**
Identifica os municípios com maior número de notificações.

### **📌 02_serie_temporal.sql**
Constrói séries temporais com agregação anual e semanal, incluindo média móvel.

### **📌 03_faixa_etaria_violencia_sexual.sql**
Cálculo do percentual de violência sexual por faixa etária.

### **📌 04_inconsistencias.sql**
Analisa problemas na base, como:

- Datas da ocorrência fora do esperado  
- Idades inválidas  
- Campos essenciais ausentes  

### **📌 05_metricas_resumo.sql**
Tabela geral com:

- Distribuição por ano  
- Por UF  
- Por sexo  
- Por faixa etária  
- Por tipo de violência  

---

# 🚀 3. Objetivos do Projeto

✔ Demonstrar domínio de SQL em ambiente de BigQuery  
✔ Trabalhar com dataset real, grande e complexo  
✔ Criar um pipeline ETL limpo, claro e reprodutível  
✔ Produzir análises exploratórias úteis  
✔ Mostrar organização profissional de repositório  

---

# 🧪 4. Como Reproduzir o Projeto

1. Clone este repositório  
2. Acesse o BigQuery no Google Cloud  
3. Ajuste o `project_id` e `dataset` nos arquivos SQL  
4. Execute os scripts da pasta `/sql` **na ordem**:

