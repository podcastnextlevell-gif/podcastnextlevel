-- AGENT GENERATED SEED SCRIPT
-- Validado em: 2026-01-23T02:41:55.806Z

-- =============================================
-- 1. TEMPORADAS
-- =============================================

INSERT INTO temporadas (titulo, descricao, ordem, status)
VALUES ('Temporada 0: Episódios Introdutórios', 'Temporada 0 do Next Level Podcast', 0, 'ativa')
ON CONFLICT (id) DO NOTHING; -- IDs are UUIDs, so this conflict check isn't on title.
-- We should probably use a pragmatic lookup to avoid creating dupes if we run this multiple times.
-- Better approach: Check existence by Title or Update based on Order?
-- Let's use ON CONFLICT DO NOTHING implies we trust the ID gen, but we don't produce IDs here.
-- Instead, let's allow duplicates? No.
-- Strict SQL with "NOT EXISTS" check:
INSERT INTO temporadas (titulo, descricao, ordem, status)
SELECT 'Temporada 0: Episódios Introdutórios', 'Temporada 0 do Next Level Podcast', 0, 'ativa'
WHERE NOT EXISTS (SELECT 1 FROM temporadas WHERE ordem = 0);


INSERT INTO temporadas (titulo, descricao, ordem, status)
VALUES ('Temporada 1: CX Avançado', 'Temporada 1 do Next Level Podcast', 1, 'ativa')
ON CONFLICT (id) DO NOTHING; -- IDs are UUIDs, so this conflict check isn't on title.
-- We should probably use a pragmatic lookup to avoid creating dupes if we run this multiple times.
-- Better approach: Check existence by Title or Update based on Order?
-- Let's use ON CONFLICT DO NOTHING implies we trust the ID gen, but we don't produce IDs here.
-- Instead, let's allow duplicates? No.
-- Strict SQL with "NOT EXISTS" check:
INSERT INTO temporadas (titulo, descricao, ordem, status)
SELECT 'Temporada 1: CX Avançado', 'Temporada 1 do Next Level Podcast', 1, 'ativa'
WHERE NOT EXISTS (SELECT 1 FROM temporadas WHERE ordem = 1);


INSERT INTO temporadas (titulo, descricao, ordem, status)
VALUES ('Temporada 2: IA Aplicada', 'Temporada 2 do Next Level Podcast', 2, 'ativa')
ON CONFLICT (id) DO NOTHING; -- IDs are UUIDs, so this conflict check isn't on title.
-- We should probably use a pragmatic lookup to avoid creating dupes if we run this multiple times.
-- Better approach: Check existence by Title or Update based on Order?
-- Let's use ON CONFLICT DO NOTHING implies we trust the ID gen, but we don't produce IDs here.
-- Instead, let's allow duplicates? No.
-- Strict SQL with "NOT EXISTS" check:
INSERT INTO temporadas (titulo, descricao, ordem, status)
SELECT 'Temporada 2: IA Aplicada', 'Temporada 2 do Next Level Podcast', 2, 'ativa'
WHERE NOT EXISTS (SELECT 1 FROM temporadas WHERE ordem = 2);


INSERT INTO temporadas (titulo, descricao, ordem, status)
VALUES ('Temporada 3: Fundamentos Data-Driven', 'Temporada 3 do Next Level Podcast', 3, 'ativa')
ON CONFLICT (id) DO NOTHING; -- IDs are UUIDs, so this conflict check isn't on title.
-- We should probably use a pragmatic lookup to avoid creating dupes if we run this multiple times.
-- Better approach: Check existence by Title or Update based on Order?
-- Let's use ON CONFLICT DO NOTHING implies we trust the ID gen, but we don't produce IDs here.
-- Instead, let's allow duplicates? No.
-- Strict SQL with "NOT EXISTS" check:
INSERT INTO temporadas (titulo, descricao, ordem, status)
SELECT 'Temporada 3: Fundamentos Data-Driven', 'Temporada 3 do Next Level Podcast', 3, 'ativa'
WHERE NOT EXISTS (SELECT 1 FROM temporadas WHERE ordem = 3);


INSERT INTO temporadas (titulo, descricao, ordem, status)
VALUES ('Temporada 4: Python para Qualidade', 'Temporada 4 do Next Level Podcast', 4, 'ativa')
ON CONFLICT (id) DO NOTHING; -- IDs are UUIDs, so this conflict check isn't on title.
-- We should probably use a pragmatic lookup to avoid creating dupes if we run this multiple times.
-- Better approach: Check existence by Title or Update based on Order?
-- Let's use ON CONFLICT DO NOTHING implies we trust the ID gen, but we don't produce IDs here.
-- Instead, let's allow duplicates? No.
-- Strict SQL with "NOT EXISTS" check:
INSERT INTO temporadas (titulo, descricao, ordem, status)
SELECT 'Temporada 4: Python para Qualidade', 'Temporada 4 do Next Level Podcast', 4, 'ativa'
WHERE NOT EXISTS (SELECT 1 FROM temporadas WHERE ordem = 4);


INSERT INTO temporadas (titulo, descricao, ordem, status)
VALUES ('Temporada 5: Soft Skills do Futuro', 'Temporada 5 do Next Level Podcast', 5, 'ativa')
ON CONFLICT (id) DO NOTHING; -- IDs are UUIDs, so this conflict check isn't on title.
-- We should probably use a pragmatic lookup to avoid creating dupes if we run this multiple times.
-- Better approach: Check existence by Title or Update based on Order?
-- Let's use ON CONFLICT DO NOTHING implies we trust the ID gen, but we don't produce IDs here.
-- Instead, let's allow duplicates? No.
-- Strict SQL with "NOT EXISTS" check:
INSERT INTO temporadas (titulo, descricao, ordem, status)
SELECT 'Temporada 5: Soft Skills do Futuro', 'Temporada 5 do Next Level Podcast', 5, 'ativa'
WHERE NOT EXISTS (SELECT 1 FROM temporadas WHERE ordem = 5);


INSERT INTO temporadas (titulo, descricao, ordem, status)
VALUES ('Temporada 6: Ferramentas Avançadas', 'Temporada 6 do Next Level Podcast', 6, 'ativa')
ON CONFLICT (id) DO NOTHING; -- IDs are UUIDs, so this conflict check isn't on title.
-- We should probably use a pragmatic lookup to avoid creating dupes if we run this multiple times.
-- Better approach: Check existence by Title or Update based on Order?
-- Let's use ON CONFLICT DO NOTHING implies we trust the ID gen, but we don't produce IDs here.
-- Instead, let's allow duplicates? No.
-- Strict SQL with "NOT EXISTS" check:
INSERT INTO temporadas (titulo, descricao, ordem, status)
SELECT 'Temporada 6: Ferramentas Avançadas', 'Temporada 6 do Next Level Podcast', 6, 'ativa'
WHERE NOT EXISTS (SELECT 1 FROM temporadas WHERE ordem = 6);


INSERT INTO temporadas (titulo, descricao, ordem, status)
VALUES ('Temporada 7: Projetos Práticos', 'Temporada 7 do Next Level Podcast', 7, 'ativa')
ON CONFLICT (id) DO NOTHING; -- IDs are UUIDs, so this conflict check isn't on title.
-- We should probably use a pragmatic lookup to avoid creating dupes if we run this multiple times.
-- Better approach: Check existence by Title or Update based on Order?
-- Let's use ON CONFLICT DO NOTHING implies we trust the ID gen, but we don't produce IDs here.
-- Instead, let's allow duplicates? No.
-- Strict SQL with "NOT EXISTS" check:
INSERT INTO temporadas (titulo, descricao, ordem, status)
SELECT 'Temporada 7: Projetos Práticos', 'Temporada 7 do Next Level Podcast', 7, 'ativa'
WHERE NOT EXISTS (SELECT 1 FROM temporadas WHERE ordem = 7);


INSERT INTO temporadas (titulo, descricao, ordem, status)
VALUES ('Temporada 8: Futuro da Qualidade', 'Temporada 8 do Next Level Podcast', 8, 'ativa')
ON CONFLICT (id) DO NOTHING; -- IDs are UUIDs, so this conflict check isn't on title.
-- We should probably use a pragmatic lookup to avoid creating dupes if we run this multiple times.
-- Better approach: Check existence by Title or Update based on Order?
-- Let's use ON CONFLICT DO NOTHING implies we trust the ID gen, but we don't produce IDs here.
-- Instead, let's allow duplicates? No.
-- Strict SQL with "NOT EXISTS" check:
INSERT INTO temporadas (titulo, descricao, ordem, status)
SELECT 'Temporada 8: Futuro da Qualidade', 'Temporada 8 do Next Level Podcast', 8, 'ativa'
WHERE NOT EXISTS (SELECT 1 FROM temporadas WHERE ordem = 8);


-- =============================================
-- 2. EPISÓDIOS
-- =============================================

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Como se Tornar Analista de Qualidade', 0, 'publicado'
FROM temporadas WHERE ordem = 0
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 0 AND e.ordem = 0);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Roadmap de Estudos para Qualidade', 0, 'publicado'
FROM temporadas WHERE ordem = 0
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 0 AND e.ordem = 0);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Jornada do Cliente Data-Driven', 1, 'publicado'
FROM temporadas WHERE ordem = 1
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 1 AND e.ordem = 1);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Voice of Customer com Tecnologia', 2, 'publicado'
FROM temporadas WHERE ordem = 1
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 1 AND e.ordem = 2);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Métricas Avançadas de CX', 3, 'publicado'
FROM temporadas WHERE ordem = 1
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 1 AND e.ordem = 3);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Omnicanalidade e Experiência Integrada', 4, 'publicado'
FROM temporadas WHERE ordem = 1
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 1 AND e.ordem = 4);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Experiência Emocional e Neurociência', 5, 'publicado'
FROM temporadas WHERE ordem = 1
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 1 AND e.ordem = 5);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'CX Preditivo e Proativo', 6, 'publicado'
FROM temporadas WHERE ordem = 1
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 1 AND e.ordem = 6);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Fundamentos de IA para CX', 7, 'publicado'
FROM temporadas WHERE ordem = 2
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 2 AND e.ordem = 7);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Modelos Preditivos para Experiência', 8, 'publicado'
FROM temporadas WHERE ordem = 2
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 2 AND e.ordem = 8);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Chatbots e Automação Inteligente de CX', 9, 'publicado'
FROM temporadas WHERE ordem = 2
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 2 AND e.ordem = 9);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Personalização em Escala para CX', 10, 'publicado'
FROM temporadas WHERE ordem = 2
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 2 AND e.ordem = 10);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'IA Generativa para Análise de CX', 11, 'publicado'
FROM temporadas WHERE ordem = 2
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 2 AND e.ordem = 11);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Ética e Responsabilidade em IA para CX', 12, 'publicado'
FROM temporadas WHERE ordem = 2
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 2 AND e.ordem = 12);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Mindset Analítico para CX', 13, 'publicado'
FROM temporadas WHERE ordem = 3
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 3 AND e.ordem = 13);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'SQL para Análise de Experiência', 14, 'publicado'
FROM temporadas WHERE ordem = 3
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 3 AND e.ordem = 14);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Estatística Aplicada ao CX', 15, 'publicado'
FROM temporadas WHERE ordem = 3
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 3 AND e.ordem = 15);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Excel Avançado para Análise de CX', 16, 'publicado'
FROM temporadas WHERE ordem = 3
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 3 AND e.ordem = 16);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Visualização de Dados de CX', 17, 'publicado'
FROM temporadas WHERE ordem = 3
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 3 AND e.ordem = 17);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Metodologias Ágeis para CX', 18, 'publicado'
FROM temporadas WHERE ordem = 3
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 3 AND e.ordem = 18);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Python Básico para Analistas de CX', 19, 'publicado'
FROM temporadas WHERE ordem = 4
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 4 AND e.ordem = 19);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Análise de Dados de CX com Pandas', 20, 'publicado'
FROM temporadas WHERE ordem = 4
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 4 AND e.ordem = 20);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Automação de Relatórios de CX', 21, 'publicado'
FROM temporadas WHERE ordem = 4
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 4 AND e.ordem = 21);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Web Scraping para Dados de Experiência', 22, 'publicado'
FROM temporadas WHERE ordem = 4
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 4 AND e.ordem = 22);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'NLP para Análise de Feedback', 23, 'publicado'
FROM temporadas WHERE ordem = 4
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 4 AND e.ordem = 23);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Projeto Prático: Dashboard de CX Automatizado', 24, 'publicado'
FROM temporadas WHERE ordem = 4
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 4 AND e.ordem = 24);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Comunicação de Insights Complexos', 25, 'publicado'
FROM temporadas WHERE ordem = 5
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 5 AND e.ordem = 25);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Pensamento Crítico e Resolução de Problemas', 26, 'publicado'
FROM temporadas WHERE ordem = 5
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 5 AND e.ordem = 26);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Liderança Baseada em Dados', 27, 'publicado'
FROM temporadas WHERE ordem = 5
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 5 AND e.ordem = 27);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Adaptabilidade e Aprendizado Contínuo', 28, 'publicado'
FROM temporadas WHERE ordem = 5
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 5 AND e.ordem = 28);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Colaboração em Equipes Multidisciplinares', 29, 'publicado'
FROM temporadas WHERE ordem = 5
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 5 AND e.ordem = 29);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Ética e Responsabilidade em Dados', 30, 'publicado'
FROM temporadas WHERE ordem = 5
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 5 AND e.ordem = 30);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Power BI Avançado para CX', 31, 'publicado'
FROM temporadas WHERE ordem = 6
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 6 AND e.ordem = 31);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'APIs e Integração de Sistemas', 32, 'publicado'
FROM temporadas WHERE ordem = 6
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 6 AND e.ordem = 32);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Ferramentas No-Code para CX', 33, 'publicado'
FROM temporadas WHERE ordem = 6
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 6 AND e.ordem = 33);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Plataformas de BI e Analytics', 34, 'publicado'
FROM temporadas WHERE ordem = 6
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 6 AND e.ordem = 34);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Implementação Prática de IA Aplicada', 35, 'publicado'
FROM temporadas WHERE ordem = 6
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 6 AND e.ordem = 35);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Orquestração de Ecossistemas de Dados', 36, 'publicado'
FROM temporadas WHERE ordem = 6
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 6 AND e.ordem = 36);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Projeto: Alerta de Churn Proativo', 37, 'publicado'
FROM temporadas WHERE ordem = 7
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 7 AND e.ordem = 37);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Projeto: Dashboard Executivo 360º', 38, 'publicado'
FROM temporadas WHERE ordem = 7
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 7 AND e.ordem = 38);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Projeto: Automação de Feedback com IA', 39, 'publicado'
FROM temporadas WHERE ordem = 7
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 7 AND e.ordem = 39);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Projeto: Otimização de Processos com IA', 40, 'publicado'
FROM temporadas WHERE ordem = 7
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 7 AND e.ordem = 40);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Projeto: Personalização com IA', 41, 'publicado'
FROM temporadas WHERE ordem = 7
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 7 AND e.ordem = 41);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Projeto: Centro de Excelência em CX', 42, 'publicado'
FROM temporadas WHERE ordem = 7
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 7 AND e.ordem = 42);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Tendências Emergentes no CX', 43, 'publicado'
FROM temporadas WHERE ordem = 8
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 8 AND e.ordem = 43);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'IA Generativa de Próxima Geração', 44, 'publicado'
FROM temporadas WHERE ordem = 8
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 8 AND e.ordem = 44);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Computação Quântica e CX', 45, 'publicado'
FROM temporadas WHERE ordem = 8
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 8 AND e.ordem = 45);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Sustentabilidade e CX Responsável', 46, 'publicado'
FROM temporadas WHERE ordem = 8
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 8 AND e.ordem = 46);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'O Analista de Qualidade do Futuro', 47, 'publicado'
FROM temporadas WHERE ordem = 8
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 8 AND e.ordem = 47);

INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, 'Construindo o Futuro da Qualidade', 48, 'publicado'
FROM temporadas WHERE ordem = 8
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = 8 AND e.ordem = 48);

-- =============================================
-- 3. PROVAS E QUESTÕES
-- =============================================

DO $$
DECLARE
    v_temporada_id UUID;
    v_prova_id UUID;
BEGIN
    -- Obter ID da Temporada
    SELECT id INTO v_temporada_id FROM temporadas WHERE ordem = 0 LIMIT 1;
    
    IF v_temporada_id IS NOT NULL THEN
        -- Inserir/Buscar Prova
        -- Upsert strategy based on Season ID
        INSERT INTO provas (temporada_id, titulo, descricao, ativa)
        VALUES (v_temporada_id, 'Prova - Temporada 0', 'Avaliação da Temporada 0', true)
        ON CONFLICT DO NOTHING; -- No unique constraint usually on (temporada_id), so this might duplicate.
        -- Better: Select existing or insert
        
        SELECT id INTO v_prova_id FROM provas WHERE temporada_id = v_temporada_id LIMIT 1;
        
        IF v_prova_id IS NULL THEN
             INSERT INTO provas (temporada_id, titulo, descricao, ativa)
             VALUES (v_temporada_id, 'Prova - Temporada 0', 'Avaliação da Temporada 0', true)
             RETURNING id INTO v_prova_id;
        END IF;

        -- Inserir Questões (Deletar antigas dessa prova para garantir sync limpo? Talvez perigoso se já houver tentativas)
        -- Vamos apenas Inserir se não existir (baseado no texto da pergunta)

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é a principal mudança de mentalidade exigida do Analista Next Level, conforme discutido no EP00A?', '[{"value":"A","label":"Focar apenas em relatórios de TMA e FCR."},{"value":"B","label":"Mudar de um reportador para um arquiteto de soluções e escritor de scripts."},{"value":"C","label":"Priorizar a velocidade de atendimento acima da qualidade."},{"value":"D","label":"Depender integralmente do time de TI para todas as análises."},{"value":"E","label":"Concentrar-se apenas em soft skills, ignorando as técnicas."}]'::jsonb, 'B', 1
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 1);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'No Roadmap de Estudos (EP00B), qual é o foco principal da fase de **Fundamentos (Meses 1-2)**?', '[{"value":"A","label":"Especialização em NLP e Machine Learning."},{"value":"B","label":"Automação de relatórios com Python."},{"value":"C","label":"Domínio de SQL Básico e Estatística Descritiva."},{"value":"D","label":"Criação de dashboards avançados no Power BI."},{"value":"E","label":"Web Scraping para coleta de dados externos."}]'::jsonb, 'C', 2
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 2);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal benefício de usar SQL para o Analista de Qualidade, conforme o contexto da Temporada 0?', '[{"value":"A","label":"Criar apresentações visuais."},{"value":"B","label":"Automatizar o envio de e-mails."},{"value":"C","label":"Extrair dados brutos e cruzar informações de diferentes tabelas com autonomia."},{"value":"D","label":"Realizar auditorias de chamadas."},{"value":"E","label":"Desenvolver chatbots."}]'::jsonb, 'C', 3
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 3);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'O que o Analista Next Level deve fazer com o tempo economizado pela automação de tarefas manuais (como relatórios)?', '[{"value":"A","label":"Tirar férias mais longas."},{"value":"B","label":"Investir na fase de Especialização (IA, NLP)."},{"value":"C","label":"Aumentar o TMA para melhorar a qualidade."},{"value":"D","label":"Focar em tarefas de supervisão."},{"value":"E","label":"Reduzir a carga horária de trabalho."}]'::jsonb, 'B', 4
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 4);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'A visão de negócio para o Analista Next Level implica em transformar o **custo** do atendimento em quê?', '[{"value":"A","label":"Um centro de reclamações."},{"value":"B","label":"Um centro de custo ainda maior."},{"value":"C","label":"Um valor para o cliente e um centro de lucro para a empresa."},{"value":"D","label":"Um indicador de performance para o agente."},{"value":"E","label":"Uma métrica de satisfação."}]'::jsonb, 'C', 5
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 5);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o objetivo da fase de **Especialização (Meses 5-6)** no Roadmap de Estudos?', '[{"value":"A","label":"Aprender a usar o Excel."},{"value":"B","label":"Dominar o Power BI."},{"value":"C","label":"Mergulhar em IA Aplicada (Modelos Preditivos) e NLP."},{"value":"D","label":"Focar em soft skills de comunicação."},{"value":"E","label":"Aprender a fazer Testes A/B."}]'::jsonb, 'C', 6
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 6);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é a principal diferença entre um analista júnior e um Analista Next Level ao analisar um alto volume de re-chamadas?', '[{"value":"A","label":"O júnior reporta o número; o Next Level usa SQL para segmentar e descobrir a causa-raiz (ex: falha na validação de dados)."},{"value":"B","label":"O júnior ignora o problema; o Next Level resolve o problema."},{"value":"C","label":"O júnior usa Python; o Next Level usa Excel."},{"value":"D","label":"O júnior foca no FCR; o Next Level foca no TMA."},{"value":"E","label":"Não há diferença significativa."}]'::jsonb, 'A', 7
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 7);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'O que significa ter uma **visão de negócio** para o Analista de Qualidade?', '[{"value":"A","label":"Apenas saber o preço do produto."},{"value":"B","label":"Entender que cada interação do cliente impacta o ROI da empresa."},{"value":"C","label":"Focar apenas no treinamento de agentes."},{"value":"D","label":"Ignorar o impacto financeiro das métricas."},{"value":"E","label":"Ter um bom relacionamento com o time de vendas."}]'::jsonb, 'B', 8
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 8);

    END IF;
END $$;

DO $$
DECLARE
    v_temporada_id UUID;
    v_prova_id UUID;
BEGIN
    -- Obter ID da Temporada
    SELECT id INTO v_temporada_id FROM temporadas WHERE ordem = 1 LIMIT 1;
    
    IF v_temporada_id IS NOT NULL THEN
        -- Inserir/Buscar Prova
        -- Upsert strategy based on Season ID
        INSERT INTO provas (temporada_id, titulo, descricao, ativa)
        VALUES (v_temporada_id, 'Prova - Temporada 1', 'Avaliação da Temporada 1', true)
        ON CONFLICT DO NOTHING; -- No unique constraint usually on (temporada_id), so this might duplicate.
        -- Better: Select existing or insert
        
        SELECT id INTO v_prova_id FROM provas WHERE temporada_id = v_temporada_id LIMIT 1;
        
        IF v_prova_id IS NULL THEN
             INSERT INTO provas (temporada_id, titulo, descricao, ativa)
             VALUES (v_temporada_id, 'Prova - Temporada 1', 'Avaliação da Temporada 1', true)
             RETURNING id INTO v_prova_id;
        END IF;

        -- Inserir Questões (Deletar antigas dessa prova para garantir sync limpo? Talvez perigoso se já houver tentativas)
        -- Vamos apenas Inserir se não existir (baseado no texto da pergunta)

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal erro da multicanalidade que a Omnicanalidade busca corrigir, conforme o EP04?', '[{"value":"A","label":"A falta de canais de atendimento."},{"value":"B","label":"O alto custo das chamadas telefônicas."},{"value":"C","label":"O **Handoff Quebrado**, onde o cliente precisa repetir toda a história ao mudar de canal."},{"value":"D","label":"A ausência de chatbots."},{"value":"E","label":"A baixa velocidade de resposta."}]'::jsonb, 'C', 1
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 1);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'O que o **Viés de Pico-Fim** (Neurociência, EP05) sugere que o Analista Next Level deve priorizar no design de uma interação de atendimento?', '[{"value":"A","label":"A duração total da chamada."},{"value":"B","label":"O ponto mais alto (positivo ou negativo) e o final da interação."},{"value":"C","label":"A voz do agente."},{"value":"D","label":"A quantidade de informações fornecidas."},{"value":"E","label":"O tempo de espera na fila."}]'::jsonb, 'B', 2
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 2);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'No contexto da Jornada do Cliente Data-Driven (EP01), o que o Analista Next Level deve fazer ao identificar que 80% dos clientes ligam por apenas 3 motivos?', '[{"value":"A","label":"Ignorar o dado e focar no TMA."},{"value":"B","label":"Usar o dado para identificar a **etapa da jornada** onde esses motivos se concentram (ex: Ativação do Serviço) e propor uma correção na causa-raiz."},{"value":"C","label":"Treinar os agentes para serem mais rápidos nesses 3 motivos."},{"value":"D","label":"Desligar o canal de telefone."},{"value":"E","label":"Aumentar o preço do produto."}]'::jsonb, 'B', 3
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 3);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é a principal diferença entre o CX Reativo e o **CX Preditivo e Proativo** (EP06)?', '[{"value":"A","label":"O CX Reativo usa IA; o Preditivo não."},{"value":"B","label":"O CX Reativo antecipa problemas; o Preditivo reage a eles."},{"value":"C","label":"O CX Reativo lida com a dor; o Preditivo usa modelos para **antecipar** e **prevenir** a dor (ex: Alerta de Churn)."},{"value":"D","label":"O CX Reativo foca no NPS; o Preditivo foca no CSAT."},{"value":"E","label":"O CX Reativo é mais caro."}]'::jsonb, 'C', 4
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 4);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é a métrica avançada que mede a capacidade do agente de resolver o problema atual e **prevenir o próximo**?', '[{"value":"A","label":"Customer Effort Score (CES)."},{"value":"B","label":"Net Promoter Score (NPS)."},{"value":"C","label":"First Call Resolution (FCR)."},{"value":"D","label":"**Next Issue Avoidance (NIA)**."},{"value":"E","label":"Tempo Médio de Atendimento (TMA)."}]'::jsonb, 'D', 5
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 5);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'No contexto do **Voice of Customer (VoC) com Tecnologia** (EP02), qual é o principal benefício de usar o NLP?', '[{"value":"A","label":"Reduzir o TMA."},{"value":"B","label":"Auditar 100% das chamadas que o algoritmo sinalizou como de **Alto Risco** (em vez de auditar 5% aleatoriamente)."},{"value":"C","label":"Aumentar o número de canais."},{"value":"D","label":"Criar um novo produto."},{"value":"E","label":"Aumentar o salário dos agentes."}]'::jsonb, 'B', 6
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 6);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'O que o Analista Next Level deve fazer ao descobrir que um agente tem um TMA alto, mas um FCR de 95%?', '[{"value":"A","label":"Penalizar o agente pelo TMA alto."},{"value":"B","label":"Mostrar que o agente, apesar do tempo maior, está **prevenindo re-chamadas** e, portanto, **reduzindo o custo operacional total** (NIA)."},{"value":"C","label":"Exigir que o agente seja mais rápido."},{"value":"D","label":"Focar apenas no CSAT."},{"value":"E","label":"Mudar o agente de setor."}]'::jsonb, 'B', 7
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 7);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal objetivo do **Mapeamento Emocional** da jornada do cliente (EP05)?', '[{"value":"A","label":"Identificar o nome do cliente."},{"value":"B","label":"Minimizar a **ansiedade** e maximizar o **alívio** do cliente, projetando interações que criam memórias positivas."},{"value":"C","label":"Aumentar o número de vendas."},{"value":"D","label":"Reduzir o custo da operação."},{"value":"E","label":"Apenas registrar a nota do CSAT."}]'::jsonb, 'B', 8
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 8);

    END IF;
END $$;

DO $$
DECLARE
    v_temporada_id UUID;
    v_prova_id UUID;
BEGIN
    -- Obter ID da Temporada
    SELECT id INTO v_temporada_id FROM temporadas WHERE ordem = 2 LIMIT 1;
    
    IF v_temporada_id IS NOT NULL THEN
        -- Inserir/Buscar Prova
        -- Upsert strategy based on Season ID
        INSERT INTO provas (temporada_id, titulo, descricao, ativa)
        VALUES (v_temporada_id, 'Prova - Temporada 2', 'Avaliação da Temporada 2', true)
        ON CONFLICT DO NOTHING; -- No unique constraint usually on (temporada_id), so this might duplicate.
        -- Better: Select existing or insert
        
        SELECT id INTO v_prova_id FROM provas WHERE temporada_id = v_temporada_id LIMIT 1;
        
        IF v_prova_id IS NULL THEN
             INSERT INTO provas (temporada_id, titulo, descricao, ativa)
             VALUES (v_temporada_id, 'Prova - Temporada 2', 'Avaliação da Temporada 2', true)
             RETURNING id INTO v_prova_id;
        END IF;

        -- Inserir Questões (Deletar antigas dessa prova para garantir sync limpo? Talvez perigoso se já houver tentativas)
        -- Vamos apenas Inserir se não existir (baseado no texto da pergunta)

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é a principal função da IA para o Analista de CX, conforme o EP07?', '[{"value":"A","label":"Substituir todos os agentes humanos."},{"value":"B","label":"Fazer a **Automação** de tarefas repetitivas e a **Previsão** de eventos futuros (ex: Churn)."},{"value":"C","label":"Apenas gerar relatórios."},{"value":"D","label":"Apenas criar chatbots."},{"value":"E","label":"Apenas fazer a triagem de e-mails."}]'::jsonb, 'B', 1
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 1);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'O que o **Aprendizado Não Supervisionado** pode fazer pelo Analista de CX (EP07)?', '[{"value":"A","label":"Classificar o motivo da chamada."},{"value":"B","label":"Prever o CSAT."},{"value":"C","label":"**Descobrir novos temas de reclamação** que a empresa nem sabia que existiam."},{"value":"D","label":"Automatizar o envio de SMS."},{"value":"E","label":"Treinar agentes."}]'::jsonb, 'C', 2
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 2);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'No contexto de **Modelos Preditivos** (EP08), o que significa um cliente ser classificado como "Risco de Churn Alto (92%)"?', '[{"value":"A","label":"O cliente já cancelou."},{"value":"B","label":"O cliente está em **Zona de Risco** e deve acionar uma **abordagem proativa e personalizada** do time de retenção."},{"value":"C","label":"O agente deve encerrar a chamada rapidamente."},{"value":"D","label":"O cliente deve ser ignorado."},{"value":"E","label":"O modelo está errado."}]'::jsonb, 'B', 3
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 3);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o conceito-chave que permite ao chatbot saber quando **parar** e passar para um agente humano de forma eficiente (EP09)?', '[{"value":"A","label":"Apenas a Intenção."},{"value":"B","label":"Apenas a Escalação."},{"value":"C","label":"A **Escalação Inteligente**, que considera a complexidade da intenção e a análise de sentimento do cliente."},{"value":"D","label":"O TMA do agente."},{"value":"E","label":"O FCR do chatbot."}]'::jsonb, 'C', 4
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 4);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'A **Personalização em Escala** (EP10) usa a IA para sugerir a **Próxima Melhor Ação (NBA)**. Qual é o principal benefício da NBA para o call center?', '[{"value":"A","label":"Reduzir o tempo de espera."},{"value":"B","label":"Transformar a chamada de suporte em uma **oportunidade de venda qualificada** ou retenção."},{"value":"C","label":"Aumentar o número de reclamações."},{"value":"D","label":"Diminuir o salário dos agentes."},{"value":"E","label":"Apenas registrar o histórico do cliente."}]'::jsonb, 'B', 5
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 5);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o papel do Analista Next Level em relação à **IA Generativa** (EP11)?', '[{"value":"A","label":"Apenas usar o ChatGPT para escrever e-mails."},{"value":"B","label":"Ser um mestre em **Prompts Otimizados** para gerar resumos de chamadas e planos de ação a partir de feedbacks."},{"value":"C","label":"Ignorar a IA Generativa."},{"value":"D","label":"Treinar o modelo do zero."},{"value":"E","label":"Apenas auditar o trabalho dos agentes."}]'::jsonb, 'B', 6
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 6);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o maior risco ético da IA que o Analista Next Level deve mitigar (EP12)?', '[{"value":"A","label":"O alto custo da IA."},{"value":"B","label":"A dificuldade de implementação."},{"value":"C","label":"Os **Vieses Algorítmicos**, que podem levar a discriminação ou tratamento injusto de grupos de clientes."},{"value":"D","label":"A lentidão do processamento."},{"value":"E","label":"A falta de dados."}]'::jsonb, 'C', 7
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 7);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal benefício da **Síntese de Chamadas** por IA Generativa (EP11) para o supervisor?', '[{"value":"A","label":"Aumentar o TMA."},{"value":"B","label":"Reduzir o tempo de espera."},{"value":"C","label":"Economizar horas de trabalho ao gerar um **resumo de 3 linhas** com problema, solução e sentimento, permitindo que o supervisor analise mais interações."},{"value":"D","label":"Criar novos produtos."},{"value":"E","label":"Fazer a triagem de e-mails."}]'::jsonb, 'C', 8
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 8);

    END IF;
END $$;

DO $$
DECLARE
    v_temporada_id UUID;
    v_prova_id UUID;
BEGIN
    -- Obter ID da Temporada
    SELECT id INTO v_temporada_id FROM temporadas WHERE ordem = 3 LIMIT 1;
    
    IF v_temporada_id IS NOT NULL THEN
        -- Inserir/Buscar Prova
        -- Upsert strategy based on Season ID
        INSERT INTO provas (temporada_id, titulo, descricao, ativa)
        VALUES (v_temporada_id, 'Prova - Temporada 3', 'Avaliação da Temporada 3', true)
        ON CONFLICT DO NOTHING; -- No unique constraint usually on (temporada_id), so this might duplicate.
        -- Better: Select existing or insert
        
        SELECT id INTO v_prova_id FROM provas WHERE temporada_id = v_temporada_id LIMIT 1;
        
        IF v_prova_id IS NULL THEN
             INSERT INTO provas (temporada_id, titulo, descricao, ativa)
             VALUES (v_temporada_id, 'Prova - Temporada 3', 'Avaliação da Temporada 3', true)
             RETURNING id INTO v_prova_id;
        END IF;

        -- Inserir Questões (Deletar antigas dessa prova para garantir sync limpo? Talvez perigoso se já houver tentativas)
        -- Vamos apenas Inserir se não existir (baseado no texto da pergunta)

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é a principal característica do **Mindset Analítico** (EP13) para o Analista de CX?', '[{"value":"A","label":"Aceitar o dado bruto sem questionar."},{"value":"B","label":"Focar apenas em relatórios de TMA."},{"value":"C","label":"A capacidade de **Formular Hipóteses** e **Validá-las com Dados** (ex: Teste A/B)."},{"value":"D","label":"Ignorar a contradição nos dados."},{"value":"E","label":"Usar apenas o Excel para análise."}]'::jsonb, 'C', 1
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 1);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual comando SQL é essencial para o Analista de CX que precisa cruzar informações de diferentes tabelas (ex: chamadas e vendas)?', '[{"value":"A","label":"SELECT."},{"value":"B","label":"WHERE."},{"value":"C","label":"**JOIN**."},{"value":"D","label":"GROUP BY."},{"value":"E","label":"COUNT."}]'::jsonb, 'C', 2
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 2);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'No contexto de **Estatística Aplicada ao CX** (EP15), qual é o principal objetivo de um **Teste A/B**?', '[{"value":"A","label":"Apenas medir o TMA."},{"value":"B","label":"Determinar se a diferença entre duas versões (ex: scripts de atendimento) é um **resultado real** ou apenas **sorte** (Significância Estatística)."},{"value":"C","label":"Aumentar o número de chamadas."},{"value":"D","label":"Reduzir o custo da operação."},{"value":"E","label":"Focar apenas na Correlação."}]'::jsonb, 'B', 3
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 3);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é a principal vantagem de usar o **Power Query** no Excel Avançado (EP16) para o Analista de CX?', '[{"value":"A","label":"Criar gráficos de pizza."},{"value":"B","label":"Automatizar o envio de e-mails."},{"value":"C","label":"Importar, limpar e transformar dados de **múltiplas fontes** sem precisar copiar e colar."},{"value":"D","label":"Fazer cálculos simples."},{"value":"E","label":"Apenas formatar células."}]'::jsonb, 'C', 4
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 4);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é a regra de ouro da **Visualização de Dados de CX** (EP17) para apresentações executivas?', '[{"value":"A","label":"Usar o máximo de cores possível."},{"value":"B","label":"Usar **Gráficos de Pizza** para todas as métricas."},{"value":"C","label":"Destaque o **Insight** e use o título para guiar o leitor para a **conclusão** (Storytelling Visual)."},{"value":"D","label":"Usar apenas tabelas."},{"value":"E","label":"Focar apenas na beleza do gráfico."}]'::jsonb, 'C', 5
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 5);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal benefício de usar o **Kanban** (Metodologias Ágeis, EP18) para o Analista de CX?', '[{"value":"A","label":"Aumentar o número de reuniões."},{"value":"B","label":"Garantir a **Iteração Rápida** e a **Melhoria Contínua** ao visualizar o fluxo de trabalho (A Fazer, Em Análise, Concluído)."},{"value":"C","label":"Focar apenas em projetos de longo prazo."},{"value":"D","label":"Reduzir o número de agentes."},{"value":"E","label":"Ignorar o feedback do cliente."}]'::jsonb, 'B', 6
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 6);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'O que o Analista Next Level deve fazer ao se deparar com um dado que **contradiz** sua crença inicial (Mindset Analítico, EP13)?', '[{"value":"A","label":"Ignorar o dado."},{"value":"B","label":"Forçar o dado a se encaixar na crença."},{"value":"C","label":"Considerar o dado como o **mais interessante** e investigá-lo a fundo, pois pode revelar um ponto cego do negócio."},{"value":"D","label":"Apenas reportar o dado."},{"value":"E","label":"Culpar o sistema."}]'::jsonb, 'C', 7
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 7);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é a principal diferença entre **Correlação** e **Causalidade** (Estatística, EP15)?', '[{"value":"A","label":"Não há diferença."},{"value":"B","label":"Correlação significa que um evento causa o outro; Causalidade significa que eles acontecem juntos."},{"value":"C","label":"Correlação mede a força da relação entre dois eventos; Causalidade prova que um evento é a **causa** do outro."},{"value":"D","label":"Apenas a Causalidade é importante para o CX."},{"value":"E","label":"Apenas a Correlação é importante para o CX."}]'::jsonb, 'C', 8
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 8);

    END IF;
END $$;

DO $$
DECLARE
    v_temporada_id UUID;
    v_prova_id UUID;
BEGIN
    -- Obter ID da Temporada
    SELECT id INTO v_temporada_id FROM temporadas WHERE ordem = 4 LIMIT 1;
    
    IF v_temporada_id IS NOT NULL THEN
        -- Inserir/Buscar Prova
        -- Upsert strategy based on Season ID
        INSERT INTO provas (temporada_id, titulo, descricao, ativa)
        VALUES (v_temporada_id, 'Prova - Temporada 4', 'Avaliação da Temporada 4', true)
        ON CONFLICT DO NOTHING; -- No unique constraint usually on (temporada_id), so this might duplicate.
        -- Better: Select existing or insert
        
        SELECT id INTO v_prova_id FROM provas WHERE temporada_id = v_temporada_id LIMIT 1;
        
        IF v_prova_id IS NULL THEN
             INSERT INTO provas (temporada_id, titulo, descricao, ativa)
             VALUES (v_temporada_id, 'Prova - Temporada 4', 'Avaliação da Temporada 4', true)
             RETURNING id INTO v_prova_id;
        END IF;

        -- Inserir Questões (Deletar antigas dessa prova para garantir sync limpo? Talvez perigoso se já houver tentativas)
        -- Vamos apenas Inserir se não existir (baseado no texto da pergunta)

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal benefício de usar Python para a **limpeza de dados** (EP19) em comparação com o Excel?', '[{"value":"A","label":"É mais fácil de aprender."},{"value":"B","label":"Garante a **Reprodutibilidade** e a **padronização** de grandes volumes de dados em segundos, eliminando o erro humano."},{"value":"C","label":"É mais barato."},{"value":"D","label":"Permite criar gráficos de pizza."},{"value":"E","label":"É mais rápido para digitar."}]'::jsonb, 'B', 1
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 1);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é a biblioteca de Python que transforma a linguagem em uma ferramenta de análise de dados de alta performance, utilizando a estrutura **DataFrame** (EP20)?', '[{"value":"A","label":"BeautifulSoup."},{"value":"B","label":"NLTK."},{"value":"C","label":"**Pandas**."},{"value":"D","label":"Matplotlib."},{"value":"E","label":"Scikit-learn."}]'::jsonb, 'C', 2
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 2);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal objetivo da **Automação de Relatórios** (EP21) para o Analista de CX?', '[{"value":"A","label":"Aumentar o tempo gasto em relatórios."},{"value":"B","label":"Liberar o analista do **trabalho repetitivo** de copiar e colar, permitindo que ele foque na **análise estratégica**."},{"value":"C","label":"Apenas enviar e-mails."},{"value":"D","label":"Apenas gerar gráficos."},{"value":"E","label":"Aumentar o TMA."}]'::jsonb, 'B', 3
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 3);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'O **Web Scraping** (EP22) é uma técnica de coleta de dados públicos. Qual é o seu principal uso para o Analista de CX?', '[{"value":"A","label":"Coletar dados internos do CRM."},{"value":"B","label":"Monitorar **reclamações e feedback** sobre a empresa e concorrentes em sites externos (ex: Reclame Aqui)."},{"value":"C","label":"Criar modelos preditivos."},{"value":"D","label":"Fazer a triagem de chamadas."},{"value":"E","label":"Treinar agentes."}]'::jsonb, 'B', 4
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 4);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é a principal capacidade do **NLP (Processamento de Linguagem Natural)** (EP23) para o Analista de CX?', '[{"value":"A","label":"Fazer cálculos estatísticos."},{"value":"B","label":"Entender a linguagem humana para realizar **Análise de Sentimento** e **Extração de Temas** em escala (ex: 10.000 transcrições)."},{"value":"C","label":"Criar dashboards."},{"value":"D","label":"Automatizar o roteamento de chamadas."},{"value":"E","label":"Fazer a limpeza de dados numéricos."}]'::jsonb, 'B', 5
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 5);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'No **Projeto Prático: Dashboard de CX Automatizado** (EP24), qual é o papel do indicador de **Alerta de Crise**?', '[{"value":"A","label":"Apenas mostrar o NPS."},{"value":"B","label":"Monitorar métricas críticas (volume de chamadas, sentimento) e, se houver um pico, **sinalizar imediatamente** a liderança para uma gestão de crise proativa."},{"value":"C","label":"Apenas mostrar o TMA."},{"value":"D","label":"Fazer a triagem de e-mails."},{"value":"E","label":"Gerar o relatório semanal."}]'::jsonb, 'B', 6
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 6);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é a estrutura de dados mais importante do Pandas (EP20) que se assemelha a uma planilha superpoderosa?', '[{"value":"A","label":"Listas."},{"value":"B","label":"Dicionários."},{"value":"C","label":"**DataFrame**."},{"value":"D","label":"Tuplas."},{"value":"E","label":"Sets."}]'::jsonb, 'C', 7
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 7);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal objetivo do Analista Next Level ao usar o NLP para analisar 20.000 transcrições de chamadas (EP23)?', '[{"value":"A","label":"Encontrar erros de digitação."},{"value":"B","label":"Descobrir que, apesar do CSAT estável, o **Sentimento Negativo** em um tema específico (ex: \"Instabilidade do Servidor\") aumentou, antecipando uma crise."},{"value":"C","label":"Contar o número de palavras."},{"value":"D","label":"Aumentar o FCR."},{"value":"E","label":"Reduzir o TMA."}]'::jsonb, 'B', 8
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 8);

    END IF;
END $$;

DO $$
DECLARE
    v_temporada_id UUID;
    v_prova_id UUID;
BEGIN
    -- Obter ID da Temporada
    SELECT id INTO v_temporada_id FROM temporadas WHERE ordem = 5 LIMIT 1;
    
    IF v_temporada_id IS NOT NULL THEN
        -- Inserir/Buscar Prova
        -- Upsert strategy based on Season ID
        INSERT INTO provas (temporada_id, titulo, descricao, ativa)
        VALUES (v_temporada_id, 'Prova - Temporada 5', 'Avaliação da Temporada 5', true)
        ON CONFLICT DO NOTHING; -- No unique constraint usually on (temporada_id), so this might duplicate.
        -- Better: Select existing or insert
        
        SELECT id INTO v_prova_id FROM provas WHERE temporada_id = v_temporada_id LIMIT 1;
        
        IF v_prova_id IS NULL THEN
             INSERT INTO provas (temporada_id, titulo, descricao, ativa)
             VALUES (v_temporada_id, 'Prova - Temporada 5', 'Avaliação da Temporada 5', true)
             RETURNING id INTO v_prova_id;
        END IF;

        -- Inserir Questões (Deletar antigas dessa prova para garantir sync limpo? Talvez perigoso se já houver tentativas)
        -- Vamos apenas Inserir se não existir (baseado no texto da pergunta)

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal objetivo do **Storytelling Técnico** (EP25) ao comunicar insights complexos para a liderança?', '[{"value":"A","label":"Mostrar o código Python que foi usado."},{"value":"B","label":"Transformar dados complexos em uma **narrativa simples e acionável** focada no **problema, solução e impacto financeiro**."},{"value":"C","label":"Focar apenas na beleza dos gráficos."},{"value":"D","label":"Usar o máximo de jargões técnicos."},{"value":"E","label":"Aumentar o tempo da apresentação."}]'::jsonb, 'B', 1
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 1);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é a técnica de **Pensamento Crítico** (EP26) que ajuda o analista a ir além do sintoma e encontrar a **causa-raiz** de um problema (ex: TMA alto)?', '[{"value":"A","label":"Teste A/B."},{"value":"B","label":"**Análise de Causa-Raiz (5 Porquês)**."},{"value":"C","label":"Storytelling Técnico."},{"value":"D","label":"Liderança Baseada em Dados."},{"value":"E","label":"Web Scraping."}]'::jsonb, 'B', 2
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 2);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'A **Liderança Baseada em Dados** (EP27) se manifesta na capacidade do analista de:', '[{"value":"A","label":"Fazer o trabalho do supervisor."},{"value":"B","label":"Usar **fatos e evidências** (dados) para guiar o time e a empresa, transformando a reunião em uma discussão sobre **dados** e não sobre opiniões."},{"value":"C","label":"Ignorar as métricas de outros times."},{"value":"D","label":"Aumentar o TMA."},{"value":"E","label":"Apenas definir metas."}]'::jsonb, 'B', 3
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 3);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é a principal característica da **Adaptabilidade** (EP28) para o Analista Next Level?', '[{"value":"A","label":"Resistir a novas tecnologias."},{"value":"B","label":"Ter um **Mindset de Crescimento** e ser o primeiro a entender e integrar novas ferramentas e processos (ex: nova API de CRM)."},{"value":"C","label":"Focar apenas no que já sabe fazer."},{"value":"D","label":"Aumentar o FCR."},{"value":"E","label":"Fazer o mesmo relatório todos os dias."}]'::jsonb, 'B', 4
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 4);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o papel do Analista Next Level na **Colaboração em Equipes Multidisciplinares** (EP29)?', '[{"value":"A","label":"Ser o dono de todos os dados."},{"value":"B","label":"Ser o **Tradutor de Dados**, transformando o dado bruto do call center em um **argumento de negócio** que ressoa com outros times (Vendas, TI, Produto)."},{"value":"C","label":"Focar apenas no seu próprio time."},{"value":"D","label":"Ignorar os objetivos dos outros times."},{"value":"E","label":"Apenas fazer o trabalho de TI."}]'::jsonb, 'B', 5
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 5);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal risco ético que o Analista Next Level deve mitigar em relação à **Ética e Responsabilidade em Dados** (EP30)?', '[{"value":"A","label":"O alto custo do Python."},{"value":"B","label":"A violação da **Privacidade** e da **Confiança** do cliente (ex: uso indevido de transcrições de chamadas)."},{"value":"C","label":"A falta de dados."},{"value":"D","label":"A lentidão do sistema."},{"value":"E","label":"A dificuldade de aprendizado."}]'::jsonb, 'B', 6
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 6);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Ao apresentar um TMA alto, o Analista Next Level usa o Pensamento Crítico para propor uma solução que **redesenha a interface do agente** em vez de apenas treiná-lo. Qual é a causa-raiz identificada (EP26)?', '[{"value":"A","label":"Falta de treinamento."},{"value":"B","label":"O agente é lento."},{"value":"C","label":"O sistema foi desenhado para o **back-office** e exige **mais cliques** do agente do call center."},{"value":"D","label":"O cliente é difícil."},{"value":"E","label":"O FCR está baixo."}]'::jsonb, 'C', 7
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 7);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é a estrutura de um **Pitch Executivo** eficaz (EP25)?', '[{"value":"A","label":"Dados brutos, gráficos complexos, jargões."},{"value":"B","label":"**Gancho (A Dor), Clímax (O Insight), Resolução (A Ação e o ROI)**."},{"value":"C","label":"Introdução, Desenvolvimento, Conclusão."},{"value":"D","label":"Apenas gráficos de pizza."},{"value":"E","label":"Foco no TMA e FCR."}]'::jsonb, 'B', 8
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 8);

    END IF;
END $$;

DO $$
DECLARE
    v_temporada_id UUID;
    v_prova_id UUID;
BEGIN
    -- Obter ID da Temporada
    SELECT id INTO v_temporada_id FROM temporadas WHERE ordem = 6 LIMIT 1;
    
    IF v_temporada_id IS NOT NULL THEN
        -- Inserir/Buscar Prova
        -- Upsert strategy based on Season ID
        INSERT INTO provas (temporada_id, titulo, descricao, ativa)
        VALUES (v_temporada_id, 'Prova - Temporada 6', 'Avaliação da Temporada 6', true)
        ON CONFLICT DO NOTHING; -- No unique constraint usually on (temporada_id), so this might duplicate.
        -- Better: Select existing or insert
        
        SELECT id INTO v_prova_id FROM provas WHERE temporada_id = v_temporada_id LIMIT 1;
        
        IF v_prova_id IS NULL THEN
             INSERT INTO provas (temporada_id, titulo, descricao, ativa)
             VALUES (v_temporada_id, 'Prova - Temporada 6', 'Avaliação da Temporada 6', true)
             RETURNING id INTO v_prova_id;
        END IF;

        -- Inserir Questões (Deletar antigas dessa prova para garantir sync limpo? Talvez perigoso se já houver tentativas)
        -- Vamos apenas Inserir se não existir (baseado no texto da pergunta)

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal foco do **Power BI Avançado** (EP31) para o Analista de CX?', '[{"value":"A","label":"Apenas criar gráficos de barra."},{"value":"B","label":"**Modelagem de Dados** e o uso de **DAX** para criar métricas complexas (ex: FCR Ponderado)."},{"value":"C","label":"Automatizar o envio de e-mails."},{"value":"D","label":"Fazer a triagem de chamadas."},{"value":"E","label":"Usar apenas o Excel."}]'::jsonb, 'B', 1
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 1);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'No contexto de **APIs e Integração de Sistemas** (EP32), qual é o principal benefício para a **Omnicanalidade Real** no call center?', '[{"value":"A","label":"Apenas enviar e-mails."},{"value":"B","label":"Permitir que diferentes sistemas (CRM, telefonia, chat) **troquem dados em tempo real** para dar ao agente uma Visão 360º do cliente."},{"value":"C","label":"Aumentar o TMA."},{"value":"D","label":"Reduzir o FCR."},{"value":"E","label":"Apenas puxar dados de um sistema."}]'::jsonb, 'B', 2
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 2);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal uso das **Ferramentas No-Code** (EP33) para o Analista de CX?', '[{"value":"A","label":"Programar modelos de IA complexos."},{"value":"B","label":"**Prototipar soluções rapidamente** e criar **fluxos de trabalho automatizados** (ex: Alerta de NPS Detrator para o supervisor)."},{"value":"C","label":"Substituir o Power BI."},{"value":"D","label":"Fazer a limpeza de dados."},{"value":"E","label":"Apenas criar páginas web."}]'::jsonb, 'B', 3
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 3);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'A **Orquestração de Ecossistemas de Dados** (EP36) é crucial para a **Tomada de Decisão em Tempo Real** no call center porque garante:', '[{"value":"A","label":"Apenas a segurança dos dados."},{"value":"B","label":"Apenas o monitoramento."},{"value":"C","label":"A **Qualidade do Dado** e a **Consistência** do dado que flui entre todos os sistemas (ETL/ELT)."},{"value":"D","label":"Apenas o uso de Python."},{"value":"E","label":"Apenas o uso de SQL."}]'::jsonb, 'C', 4
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 4);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal fator que o Analista Next Level deve considerar ao escolher entre **Plataformas de BI** (EP34) como Power BI, Tableau ou Looker?', '[{"value":"A","label":"Apenas o preço."},{"value":"B","label":"Apenas a beleza dos gráficos."},{"value":"C","label":"A **Complexidade dos Dados**, a **Capacidade de Modelagem** e a **Integração** com o ecossistema de dados da empresa."},{"value":"D","label":"Apenas a curva de aprendizado."},{"value":"E","label":"Apenas o número de usuários."}]'::jsonb, 'C', 5
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 5);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'O que o **AutoML** (EP35) permite que o Analista de CX faça?', '[{"value":"A","label":"Programar em C++."},{"value":"B","label":"Construir **Modelos de Machine Learning** (ex: Previsão de Churn) sem ser um cientista de dados, focando na seleção de algoritmos e otimização."},{"value":"C","label":"Apenas limpar dados."},{"value":"D","label":"Apenas criar dashboards."},{"value":"E","label":"Apenas escrever roteiros."}]'::jsonb, 'B', 6
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 6);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal objetivo de usar **DAX** no Power BI Avançado (EP31)?', '[{"value":"A","label":"Conectar tabelas."},{"value":"B","label":"Criar **medidas e métricas complexas** que não existem no dado bruto (ex: CSAT para clientes que esperaram mais de 5 minutos)."},{"value":"C","label":"Apenas importar dados."},{"value":"D","label":"Fazer a limpeza de dados."},{"value":"E","label":"Criar gráficos de linha."}]'::jsonb, 'B', 7
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 7);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal benefício de usar a **API de SMS** em um fluxo de automação (EP32) após o fechamento de um ticket?', '[{"value":"A","label":"Aumentar o TMA."},{"value":"B","label":"Enviar uma **pesquisa de CSAT** ou um **e-mail de acompanhamento** automaticamente, fechando o ciclo de feedback em tempo real."},{"value":"C","label":"Apenas fechar o ticket."},{"value":"D","label":"Apenas creditar bônus ao agente."},{"value":"E","label":"Apenas puxar dados."}]'::jsonb, 'B', 8
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 8);

    END IF;
END $$;

DO $$
DECLARE
    v_temporada_id UUID;
    v_prova_id UUID;
BEGIN
    -- Obter ID da Temporada
    SELECT id INTO v_temporada_id FROM temporadas WHERE ordem = 7 LIMIT 1;
    
    IF v_temporada_id IS NOT NULL THEN
        -- Inserir/Buscar Prova
        -- Upsert strategy based on Season ID
        INSERT INTO provas (temporada_id, titulo, descricao, ativa)
        VALUES (v_temporada_id, 'Prova - Temporada 7', 'Avaliação da Temporada 7', true)
        ON CONFLICT DO NOTHING; -- No unique constraint usually on (temporada_id), so this might duplicate.
        -- Better: Select existing or insert
        
        SELECT id INTO v_prova_id FROM provas WHERE temporada_id = v_temporada_id LIMIT 1;
        
        IF v_prova_id IS NULL THEN
             INSERT INTO provas (temporada_id, titulo, descricao, ativa)
             VALUES (v_temporada_id, 'Prova - Temporada 7', 'Avaliação da Temporada 7', true)
             RETURNING id INTO v_prova_id;
        END IF;

        -- Inserir Questões (Deletar antigas dessa prova para garantir sync limpo? Talvez perigoso se já houver tentativas)
        -- Vamos apenas Inserir se não existir (baseado no texto da pergunta)

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal objetivo do **Projeto: Alerta de Churn Proativo** (EP37)?', '[{"value":"A","label":"Esperar o cliente ligar para cancelar."},{"value":"B","label":"Usar **SQL, IA e No-Code** para identificar clientes em alto risco e acionar o time de retenção para uma **intervenção proativa**."},{"value":"C","label":"Apenas medir o Churn."},{"value":"D","label":"Apenas treinar o time de retenção."},{"value":"E","label":"Apenas criar um dashboard."}]'::jsonb, 'B', 1
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 1);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'O **Dashboard Executivo 360º** (EP38) deve ter três camadas de informação. Qual é a camada que foca nos **KPIs de alto nível** (NPS, Churn, LTV)?', '[{"value":"A","label":"Camada Tática."},{"value":"B","label":"Camada Operacional."},{"value":"C","label":"**Camada Estratégica**."},{"value":"D","label":"Camada de Detalhes."},{"value":"E","label":"Camada de Agente."}]'::jsonb, 'C', 2
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 2);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal benefício do **Projeto: Automação de Feedback com IA** (EP39) para a empresa?', '[{"value":"A","label":"Apenas coletar comentários."},{"value":"B","label":"Garantir a **Velocidade do Insight**, processando feedback (Scraping, NLP) e distribuindo **alertas de alta prioridade** para o time responsável em minutos."},{"value":"C","label":"Aumentar o volume de chamadas."},{"value":"D","label":"Reduzir o TMA."},{"value":"E","label":"Apenas criar um formulário."}]'::jsonb, 'B', 3
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 3);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'O **Projeto: Otimização de Processos com IA** (EP40) usa **Análise de Processos (Process Mining)** para:', '[{"value":"A","label":"Apenas medir o TMA."},{"value":"B","label":"Mapear o caminho real do cliente e identificar **gargalos** e **desvios** que causam alto CES e retrabalho."},{"value":"C","label":"Criar um novo produto."},{"value":"D","label":"Treinar agentes."},{"value":"E","label":"Fazer a triagem de e-mails."}]'::jsonb, 'B', 4
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 4);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'No **Projeto: Personalização com IA** (EP41), o **Motor de Recomendações** sugere a **Próxima Melhor Ação (NBA)**. Qual é o resultado prático disso no call center?', '[{"value":"A","label":"Apenas um aumento no TMA."},{"value":"B","label":"Transformar uma chamada de suporte em uma **venda de alto valor** ou retenção proativa."},{"value":"C","label":"Aumento do Churn."},{"value":"D","label":"Redução do FCR."},{"value":"E","label":"Apenas um aumento no NPS."}]'::jsonb, 'B', 5
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 5);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'O **Projeto: Centro de Excelência em CX (CoE)** (EP42) transforma a área de CX em quê?', '[{"value":"A","label":"Um setor isolado."},{"value":"B","label":"Um **centro de coordenação estratégica** que garante que a Qualidade seja uma prioridade em toda a empresa (Governança, Processos, Talentos)."},{"value":"C","label":"Um centro de custo."},{"value":"D","label":"Um centro de reclamações."},{"value":"E","label":"Apenas um time de treinamento."}]'::jsonb, 'B', 6
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 6);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal benefício de usar o **Dashboard Executivo 360º** (EP38) em uma reunião de diretoria?', '[{"value":"A","label":"Mostrar o volume de chamadas."},{"value":"B","label":"Garantir que a conversa seja sobre **dados** e **insights acionáveis** (ex: drill-down para a causa-raiz da queda do NPS), e não sobre opiniões."},{"value":"C","label":"Apenas mostrar o TMA."},{"value":"D","label":"Aumentar o número de agentes."},{"value":"E","label":"Reduzir o custo."}]'::jsonb, 'B', 7
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 7);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'No **Projeto: Otimização de Processos com IA** (EP40), a sugestão de criar um **formulário web** para "Troca de Endereço" em vez de usar 4 agentes diferentes resultou em quê?', '[{"value":"A","label":"Aumento do TMA."},{"value":"B","label":"Redução do **TMA** e do **CES** (Customer Effort Score) em 50% para essa solicitação."},{"value":"C","label":"Aumento do Churn."},{"value":"D","label":"Apenas um aumento no FCR."},{"value":"E","label":"Aumento do número de chamadas."}]'::jsonb, 'B', 8
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 8);

    END IF;
END $$;

DO $$
DECLARE
    v_temporada_id UUID;
    v_prova_id UUID;
BEGIN
    -- Obter ID da Temporada
    SELECT id INTO v_temporada_id FROM temporadas WHERE ordem = 8 LIMIT 1;
    
    IF v_temporada_id IS NOT NULL THEN
        -- Inserir/Buscar Prova
        -- Upsert strategy based on Season ID
        INSERT INTO provas (temporada_id, titulo, descricao, ativa)
        VALUES (v_temporada_id, 'Prova - Temporada 8', 'Avaliação da Temporada 8', true)
        ON CONFLICT DO NOTHING; -- No unique constraint usually on (temporada_id), so this might duplicate.
        -- Better: Select existing or insert
        
        SELECT id INTO v_prova_id FROM provas WHERE temporada_id = v_temporada_id LIMIT 1;
        
        IF v_prova_id IS NULL THEN
             INSERT INTO provas (temporada_id, titulo, descricao, ativa)
             VALUES (v_temporada_id, 'Prova - Temporada 8', 'Avaliação da Temporada 8', true)
             RETURNING id INTO v_prova_id;
        END IF;

        -- Inserir Questões (Deletar antigas dessa prova para garantir sync limpo? Talvez perigoso se já houver tentativas)
        -- Vamos apenas Inserir se não existir (baseado no texto da pergunta)

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal impacto da **Realidade Aumentada (RA)** (EP43) no suporte técnico do call center?', '[{"value":"A","label":"Apenas criar avatares."},{"value":"B","label":"**Guiar o cliente na solução de um problema físico** (ex: roteador) e reduzir o TMA em 30% para problemas técnicos."},{"value":"C","label":"Aumentar o volume de chamadas."},{"value":"D","label":"Fazer a triagem de e-mails."},{"value":"E","label":"Apenas vender produtos."}]'::jsonb, 'B', 1
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 1);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'A **IA Generativa de Próxima Geração** (EP44) será capaz de ir além do resumo de chamadas e:', '[{"value":"A","label":"Apenas escrever e-mails."},{"value":"B","label":"Atuar como **Agentes Autônomos** que podem executar tarefas de ponta a ponta (ex: gerenciar um ticket de suporte) e **simular interações** para testar scripts."},{"value":"C","label":"Apenas fazer a limpeza de dados."},{"value":"D","label":"Aumentar o TMA."},{"value":"E","label":"Apenas criar gráficos."}]'::jsonb, 'B', 2
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 2);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal benefício da **Computação Quântica** (EP45) para o call center?', '[{"value":"A","label":"Apenas criar novos produtos."},{"value":"B","label":"**Otimizar o roteamento de chamadas** em milissegundos, garantindo que o agente mais qualificado atenda o cliente com a **maior probabilidade de FCR**."},{"value":"C","label":"Aumentar o custo."},{"value":"D","label":"Reduzir o número de agentes."},{"value":"E","label":"Apenas fazer a triagem."}]'::jsonb, 'B', 3
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 3);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'A **Sustentabilidade e CX Responsável** (EP46) se manifesta no call center principalmente através de qual ação?', '[{"value":"A","label":"Apenas plantar árvores."},{"value":"B","label":"**Digitalização de Processos** e migração de chamadas para o autoatendimento, reduzindo a **pegada de carbono** e o custo operacional."},{"value":"C","label":"Aumentar o uso de papel."},{"value":"D","label":"Ignorar a LGPD."},{"value":"E","label":"Apenas medir o NPS."}]'::jsonb, 'B', 4
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 4);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'O **Analista de Qualidade do Futuro** (EP47) será o **Elo entre o Dado e a Decisão**. Qual é a sua principal função?', '[{"value":"A","label":"Apenas gerar relatórios."},{"value":"B","label":"Ser um **Consultor Estratégico** e **Arquiteto de Soluções**, treinando e auditando IAs e definindo a estratégia de atendimento."},{"value":"C","label":"Focar apenas no treinamento de agentes."},{"value":"D","label":"Aumentar o TMA."},{"value":"E","label":"Apenas fazer o trabalho de TI."}]'::jsonb, 'B', 5
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 5);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal legado do Analista Next Level na **Construção do Futuro da Qualidade** (EP48)?', '[{"value":"A","label":"Apenas o aumento do TMA."},{"value":"B","label":"A **Autonomia e a Eficiência** deixadas para trás, com um ecossistema de dados orquestrado e agentes autônomos que garantem a qualidade 24/7."},{"value":"C","label":"Apenas a redução do FCR."},{"value":"D","label":"Aumento do Churn."},{"value":"E","label":"Apenas a criação de um script."}]'::jsonb, 'B', 6
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 6);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'No contexto de **IA Generativa de Próxima Geração** (EP44), o que o Analista Next Level deve fazer para garantir a qualidade dos **Agentes Autônomos**?', '[{"value":"A","label":"Ignorar o trabalho deles."},{"value":"B","label":"Atuar como **Curador da IA**, treinando, auditando e refinando o trabalho dos Agentes Autônomos."},{"value":"C","label":"Apenas usar o ChatGPT."},{"value":"D","label":"Aumentar o volume de chamadas."},{"value":"E","label":"Focar apenas no TMA."}]'::jsonb, 'B', 7
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 7);

        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, 'Qual é o principal desafio que o **Metaverso e a Web3** (EP43) impõem ao Analista de CX?', '[{"value":"A","label":"Apenas a dificuldade de treinar agentes."},{"value":"B","label":"A necessidade de criar **Novas Métricas** (ex: CES em ambiente 3D) e garantir a **privacidade** e a **confiança** em tecnologias descentralizadas."},{"value":"C","label":"Aumento do custo."},{"value":"D","label":"Apenas a criação de avatares."},{"value":"E","label":"A falta de dados."}]'::jsonb, 'B', 8
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = 8);

    END IF;
END $$;
