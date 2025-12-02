CREATE SCHEMA IF NOT EXISTS sinan;

CREATE TABLE IF NOT EXISTS sinan.violencias_raw (
    -- Identificadores
    id_serial BIGSERIAL PRIMARY KEY,
    id_unico_caso TEXT,
    
    -- Local de notificação / ocorrência
    tipo_notificacao TEXT,
    id_uf_notificacao TEXT,
    id_municipio_notificacao TEXT,
    id_municipio_6_notificacao TEXT,
    id_unidade_notificacao TEXT,
    id_regional_saude_notificacao TEXT,
    
    data_ocorrencia_raw TEXT,
    id_uf_ocorrencia TEXT,
    id_municipio_ocorrencia TEXT,
    id_municipio_6_ocorrencia TEXT,
    hora_ocorrencia_raw TEXT,
    local_ocorrencia_raw TEXT,
    outro_local_ocorrencia TEXT,
    outras_vezes_ocorrencia TEXT,
    
    -- Residência
    id_uf_residencia TEXT,
    id_municipio_residencia TEXT,
    id_municipio_6_residencia TEXT,
    id_regional_saude_residencia TEXT,
    
    -- Paciente / demografia
    idade_paciente_raw TEXT,
    sexo_paciente_raw TEXT,
    gestante_paciente_raw TEXT,
    raca_paciente_raw TEXT,
    escolaridade_paciente_raw TEXT,
    ocupacao_paciente_raw TEXT,
    estado_civil_paciente_raw TEXT,
    orientacao_sexual_paciente_raw TEXT,
    identidade_genero_paciente_raw TEXT,
    
    -- Violência e características
    motivacao_violencia_raw TEXT,
    violencia_relacionada_trabalho_raw TEXT,
    emitiu_cat_raw TEXT,
    
    -- Deficiências / transtornos
    deficiencia_transtorno_paciente_raw TEXT,
    deficiencia_fisica_paciente_raw TEXT,
    deficiencia_mental_paciente_raw TEXT,
    deficiencia_visual_paciente_raw TEXT,
    deficiencia_auditiva_paciente_raw TEXT,
    outras_deficiencias_paciente_raw TEXT,
    quais_outras_deficiencias_paciente TEXT,
    
    -- Tipos de violência (muitos campos)
    lesao_autoprovocada_raw TEXT,
    ocorreu_violencia_fisica_raw TEXT,
    ocorreu_violencia_psicologica_raw TEXT,
    ocorreu_tortura_raw TEXT,
    ocorreu_violencia_sexual_raw TEXT,
    ocorreu_trafico_ser_humano_raw TEXT,
    ocorreu_violencia_financeira_raw TEXT,
    ocorreu_negligencia_abandono_raw TEXT,
    ocorreu_trabalho_infantil_raw TEXT,
    ocorreu_intervencao_legal_raw TEXT,
    ocorreu_outra_violencia_raw TEXT,
    ocorreu_qual_outra TEXT,
    
    -- Meios
    meio_forca_raw TEXT,
    meio_enforcamento_raw TEXT,
    meio_objeto_contundente_raw TEXT,
    meio_objeto_perfurante_raw TEXT,
    meio_objeto_quente_raw TEXT,
    meio_envenenamento_raw TEXT,
    meio_arma_fogo_raw TEXT,
    meio_ameaca_raw TEXT,
    meio_outros_raw TEXT,
    meio_qual_outro TEXT,
    
    -- Autores (vários campos)
    autor_pai_raw TEXT,
    autor_mae_raw TEXT,
    autor_padrasto_raw TEXT,
    autor_madrasta_raw TEXT,
    autor_conjugue_raw TEXT,
    autor_ex_conjugue_raw TEXT,
    autor_namorado_a_raw TEXT,
    autor_ex_namorado_a_raw TEXT,
    autor_filho_a_raw TEXT,
    autor_desconhecido_raw TEXT,
    autor_irmao_raw TEXT,
    autor_conhecido_raw TEXT,
    autor_cuidador_raw TEXT,
    autor_patrao_chefe_raw TEXT,
    autor_institucional_raw TEXT,
    autor_policial_raw TEXT,
    autor_propria_pessoa_raw TEXT,
    autor_outros_raw TEXT,
    autor_relacao_outros TEXT,
    autor_sexo_raw TEXT,
    autor_usou_alcool_raw TEXT,
    
    -- Encaminhamentos
    encaminhamento_saude_raw TEXT,
    encaminhamento_assistencia_social_raw TEXT,
    encaminhamento_educacao_raw TEXT,
    encaminhamento_atendimento_mulher_raw TEXT,
    encaminhamento_conselho_tutelar_raw TEXT,
    encaminhamento_conselho_idoso_raw TEXT,
    encaminhamento_delegacia_idoso_raw TEXT,
    encaminhamento_direitos_humanos_raw TEXT,
    encaminhamento_mpu_raw TEXT,
    encaminhamento_delegacia_crianca_raw TEXT,
    encaminhamento_delegacia_mulher_raw TEXT,
    encaminhamento_delegacia_raw TEXT,
    encaminhamento_justica_infancia_juventude_raw TEXT,
    encaminhamento_defensoria_publica_raw TEXT,
    
    data_encerramento_raw TEXT,
    fonte TEXT
);
