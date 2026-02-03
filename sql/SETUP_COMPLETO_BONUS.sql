-- ============================================
-- 🔧 CORREÇÃO DEFINITIVA - SISTEMA BÔNUS COMPLETO
-- Execute este script COMPLETO no Supabase SQL Editor
-- ============================================

-- =====================
-- PASSO 1: VERIFICAR TABELAS
-- =====================
-- Isso vai confirmar se as tabelas existem
SELECT table_name FROM information_schema.tables 
WHERE table_schema = 'public' 
AND table_name IN ('modulos_bonus', 'progresso_modulos_bonus', 'usuarios');

-- =====================
-- PASSO 2: CRIAR TABELAS SE NÃO EXISTIREM
-- =====================

-- Tabela de módulos bônus
CREATE TABLE IF NOT EXISTS modulos_bonus (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(50) UNIQUE NOT NULL,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    tipo VARCHAR(50) DEFAULT 'exercicio',
    temporada INTEGER DEFAULT 0,
    episodio_prerequisito VARCHAR(20) DEFAULT 'EP00',
    pontos_facil INTEGER DEFAULT 5,
    pontos_intermediario INTEGER DEFAULT 10,
    pontos_dificil INTEGER DEFAULT 20,
    publicado BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabela de progresso dos módulos bônus
CREATE TABLE IF NOT EXISTS progresso_modulos_bonus (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    modulo_id INTEGER NOT NULL REFERENCES modulos_bonus(id) ON DELETE CASCADE,
    nivel VARCHAR(20) CHECK (nivel IN ('facil', 'intermediario', 'dificil')),
    pontos_ganhos INTEGER NOT NULL DEFAULT 0,
    completado_em TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(usuario_id, modulo_id, nivel)
);

-- =====================
-- PASSO 3: RECRIAR TRIGGER DE PONTUAÇÃO
-- =====================

-- Remover trigger antigo se existir
DROP TRIGGER IF EXISTS trigger_pontuacao_bonus ON progresso_modulos_bonus;
DROP FUNCTION IF EXISTS atualizar_pontuacao_bonus() CASCADE;

-- Criar função que atualiza pontuação
CREATE OR REPLACE FUNCTION atualizar_pontuacao_bonus()
RETURNS TRIGGER AS $$
BEGIN
    -- Atualizar pontuação total do usuário
    UPDATE usuarios
    SET pontuacao_total = COALESCE(pontuacao_total, 0) + NEW.pontos_ganhos,
        updated_at = NOW()
    WHERE id = NEW.usuario_id;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Criar trigger
CREATE TRIGGER trigger_pontuacao_bonus
    AFTER INSERT ON progresso_modulos_bonus
    FOR EACH ROW
    EXECUTE FUNCTION atualizar_pontuacao_bonus();

-- =====================
-- PASSO 4: CONFIGURAR PERMISSÕES (RLS)
-- =====================

-- Habilitar RLS
ALTER TABLE modulos_bonus ENABLE ROW LEVEL SECURITY;
ALTER TABLE progresso_modulos_bonus ENABLE ROW LEVEL SECURITY;

-- Remover políticas antigas
DROP POLICY IF EXISTS "modulos_select_all" ON modulos_bonus;
DROP POLICY IF EXISTS "progresso_select_own" ON progresso_modulos_bonus;
DROP POLICY IF EXISTS "progresso_insert_own" ON progresso_modulos_bonus;

-- Criar políticas novas
CREATE POLICY "modulos_select_all" ON modulos_bonus
    FOR SELECT TO authenticated USING (true);

CREATE POLICY "progresso_select_own" ON progresso_modulos_bonus
    FOR SELECT TO authenticated
    USING (usuario_id IN (SELECT id FROM usuarios WHERE auth_id = auth.uid()));

CREATE POLICY "progresso_insert_own" ON progresso_modulos_bonus
    FOR INSERT TO authenticated
    WITH CHECK (usuario_id IN (SELECT id FROM usuarios WHERE auth_id = auth.uid()));

-- =====================
-- PASSO 5: VERIFICAR/INSERIR MÓDULOS
-- =====================

-- Verificar se há módulos
SELECT COUNT(*) as total_modulos FROM modulos_bonus;

-- Se não houver módulos, inserir os 28
INSERT INTO modulos_bonus (codigo, nome, descricao, temporada, pontos_facil, pontos_intermediario, pontos_dificil, episodio_prerequisito)
VALUES 
    ('EP00A_ROI', 'Calculadora de ROI', 'Calcule o retorno sobre investimento da sua carreira', 0, 5, 10, 20, 'EP00'),
    ('EP00B_META', 'Definidor de Metas SMART', 'Crie metas inteligentes para sua evolução', 0, 5, 10, 20, 'EP00'),
    ('EP01_NPS', 'Simulador NPS Avançado', 'Simule e analise NPS com IA', 1, 5, 10, 20, 'EP01'),
    ('EP02_JORNADA', 'Mapeador de Jornada', 'Mapeie a jornada do cliente', 1, 5, 10, 20, 'EP02'),
    ('EP03_VOC', 'Análise VOC', 'Analise a voz do cliente', 1, 5, 10, 20, 'EP03'),
    ('EP04_CES', 'Calculadora CES', 'Calcule o Customer Effort Score', 1, 5, 10, 20, 'EP04'),
    ('EP05_CHURN', 'Preditor de Churn', 'Preveja cancelamentos com IA', 1, 5, 10, 20, 'EP05'),
    ('EP06_SENTIMENTO', 'Análise de Sentimento', 'Analise sentimentos em texto', 2, 5, 10, 20, 'EP06'),
    ('EP07_CHATBOT', 'Construtor de Chatbot', 'Crie um chatbot inteligente', 2, 5, 10, 20, 'EP07'),
    ('EP08_ML_CHURN', 'ML para Churn', 'Machine Learning aplicado', 2, 5, 10, 20, 'EP08'),
    ('EP09_RECOMENDADOR', 'Sistema Recomendador', 'Crie recomendações personalizadas', 2, 5, 10, 20, 'EP09'),
    ('EP10_SQL', 'SQL Interativo', 'Pratique SQL com dados reais', 3, 5, 10, 20, 'EP10'),
    ('EP11_ESTATISTICA', 'Teste A/B', 'Aprenda testes estatísticos', 3, 5, 10, 20, 'EP11'),
    ('EP12_DASHBOARD', 'Dashboard Builder', 'Crie dashboards profissionais', 3, 5, 10, 20, 'EP12'),
    ('EP13_RELATORIOS', 'Gerador de Relatórios', 'Automatize relatórios', 4, 5, 10, 20, 'EP13'),
    ('EP14_SCRAPING', 'Web Scraping', 'Extraia dados da web', 4, 5, 10, 20, 'EP14'),
    ('EP15_NLP', 'Processamento de Texto', 'NLP descomplicado', 4, 5, 10, 20, 'EP15'),
    ('EP16_COMUNICACAO', 'Comunicação Assertiva', 'Desenvolva sua comunicação', 5, 5, 10, 20, 'EP16'),
    ('EP17_LIDERANCA', 'Liderança Prática', 'Lidere equipes de alto desempenho', 5, 5, 10, 20, 'EP17'),
    ('EP18_NEGOCIACAO', 'Negociação Avançada', 'Técnicas de negociação', 5, 5, 10, 20, 'EP18'),
    ('EP19_POWERBI', 'Power BI Essencial', 'Dashboards profissionais', 6, 5, 10, 20, 'EP19'),
    ('EP20_NOCODE', 'Automação No-Code', 'Automatize sem programar', 6, 5, 10, 20, 'EP20'),
    ('EP21_API', 'Integrações API', 'Conecte sistemas', 6, 5, 10, 20, 'EP21'),
    ('EP22_PROJETO_CHURN', 'Projeto: Redução de Churn', 'Projeto prático completo', 7, 5, 10, 20, 'EP22'),
    ('EP23_PROJETO_DASHBOARD', 'Projeto: Dashboard Executivo', 'Dashboard para diretoria', 7, 5, 10, 20, 'EP23'),
    ('EP24_PROJETO_FEEDBACK', 'Projeto: Sistema de Feedback', 'Sistema completo de VOC', 7, 5, 10, 20, 'EP24'),
    ('EP25_METAVERSO', 'IA Generativa', 'O futuro do atendimento', 8, 5, 10, 20, 'EP25'),
    ('EP26_RA', 'Futuro do CX', 'Tendências e inovações', 8, 5, 10, 20, 'EP26')
ON CONFLICT (codigo) DO NOTHING;

-- =====================
-- PASSO 6: VERIFICAÇÃO FINAL
-- =====================

-- Ver módulos inseridos
SELECT codigo, nome, pontos_facil FROM modulos_bonus ORDER BY id LIMIT 10;

-- Ver políticas criadas
SELECT tablename, policyname, cmd FROM pg_policies 
WHERE tablename IN ('modulos_bonus', 'progresso_modulos_bonus');

-- Ver trigger criado
SELECT trigger_name, event_manipulation FROM information_schema.triggers
WHERE trigger_name = 'trigger_pontuacao_bonus';

-- =====================
-- SUCESSO! Agora teste o sistema
-- =====================
