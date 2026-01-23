-- ============================================
-- 🎙️ NEXT LEVEL PODCAST - Database Schema
-- ============================================
-- Execute este script no SQL Editor do Supabase
-- URL: https://supabase.com/dashboard/project/dnmeeirmjljmvbwcsdpx/sql
-- VALIDADO EM: 2026-01-22 (Sprint 2)
-- ============================================

-- ============================================
-- LIMPAR POLÍTICAS EXISTENTES (evitar conflitos)
-- ============================================
DROP POLICY IF EXISTS "Usuários veem próprio perfil" ON usuarios;
DROP POLICY IF EXISTS "Admin vê todos usuários" ON usuarios;
DROP POLICY IF EXISTS "Admin atualiza usuários" ON usuarios;
DROP POLICY IF EXISTS "Usuário insere próprio perfil" ON usuarios;
DROP POLICY IF EXISTS "Usuário atualiza próprio perfil" ON usuarios;
DROP POLICY IF EXISTS "Todos veem temporadas ativas" ON temporadas;
DROP POLICY IF EXISTS "Admin gerencia temporadas" ON temporadas;
DROP POLICY IF EXISTS "Usuários veem episódios publicados" ON episodios;
DROP POLICY IF EXISTS "Admin gerencia episódios" ON episodios;
DROP POLICY IF EXISTS "Usuários veem provas ativas" ON provas;
DROP POLICY IF EXISTS "Admin gerencia provas" ON provas;
DROP POLICY IF EXISTS "Usuários veem questões" ON questoes;
DROP POLICY IF EXISTS "Admin gerencia questões" ON questoes;
DROP POLICY IF EXISTS "Usuário vê próprias tentativas" ON tentativas_prova;
DROP POLICY IF EXISTS "Usuário cria tentativa" ON tentativas_prova;
DROP POLICY IF EXISTS "Usuário vê próprios certificados" ON certificados;
DROP POLICY IF EXISTS "Inserir certificado" ON certificados;
DROP POLICY IF EXISTS "Usuário vê próprio progresso" ON progresso_usuario;
DROP POLICY IF EXISTS "Usuário atualiza progresso" ON progresso_usuario;

-- ============================================
-- 1. TABELA: usuarios
-- ============================================
CREATE TABLE IF NOT EXISTS usuarios (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    auth_id UUID UNIQUE REFERENCES auth.users(id) ON DELETE CASCADE,
    nome_completo TEXT NOT NULL,
    nickname TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    matricula TEXT,
    cargo TEXT,
    area_atuacao TEXT,
    is_admin BOOLEAN DEFAULT FALSE,
    status TEXT DEFAULT 'pendente' CHECK (status IN ('pendente', 'aprovado', 'reprovado')),
    pontuacao_total INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 2. TABELA: temporadas
-- ============================================
CREATE TABLE IF NOT EXISTS temporadas (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    titulo TEXT NOT NULL,
    descricao TEXT,
    imagem_capa TEXT,
    status TEXT DEFAULT 'planejamento' CHECK (status IN ('planejamento', 'lancamento', 'ativa', 'encerrada')),
    data_inicio DATE,
    data_fim DATE,
    ordem INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 3. TABELA: episodios
-- ============================================
CREATE TABLE IF NOT EXISTS episodios (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    temporada_id UUID REFERENCES temporadas(id) ON DELETE CASCADE,
    titulo TEXT NOT NULL,
    descricao TEXT,
    audio_url TEXT,
    imagem_url TEXT,
    duracao_segundos INTEGER DEFAULT 0,
    template_id TEXT,
    status TEXT DEFAULT 'rascunho' CHECK (status IN ('rascunho', 'previa', 'publicado')),
    ordem INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 4. TABELA: provas
-- ============================================
CREATE TABLE IF NOT EXISTS provas (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    temporada_id UUID REFERENCES temporadas(id) ON DELETE CASCADE,
    titulo TEXT NOT NULL,
    descricao TEXT,
    nota_minima DECIMAL(5,2) DEFAULT 7.00,
    pontos_por_acerto INTEGER DEFAULT 10,
    tempo_limite_minutos INTEGER DEFAULT 30,
    ativa BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 5. TABELA: questoes
-- ============================================
CREATE TABLE IF NOT EXISTS questoes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    prova_id UUID REFERENCES provas(id) ON DELETE CASCADE,
    pergunta TEXT NOT NULL,
    opcoes JSONB NOT NULL DEFAULT '[]',
    resposta_correta TEXT NOT NULL,
    ordem INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 6. TABELA: tentativas_prova
-- ============================================
CREATE TABLE IF NOT EXISTS tentativas_prova (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    usuario_id UUID REFERENCES usuarios(id) ON DELETE CASCADE,
    prova_id UUID REFERENCES provas(id) ON DELETE CASCADE,
    respostas JSONB DEFAULT '{}',
    acertos INTEGER DEFAULT 0,
    total_questoes INTEGER DEFAULT 0,
    nota DECIMAL(5,2) DEFAULT 0,
    pontuacao INTEGER DEFAULT 0,
    aprovado BOOLEAN DEFAULT FALSE,
    tempo_gasto_segundos INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 7. TABELA: certificados
-- ============================================
CREATE TABLE IF NOT EXISTS certificados (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    usuario_id UUID REFERENCES usuarios(id) ON DELETE CASCADE,
    temporada_id UUID REFERENCES temporadas(id) ON DELETE CASCADE,
    tentativa_id UUID REFERENCES tentativas_prova(id) ON DELETE SET NULL,
    codigo_validacao TEXT UNIQUE NOT NULL,
    nota DECIMAL(5,2) NOT NULL,
    pdf_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 8. TABELA: progresso_usuario
-- ============================================
CREATE TABLE IF NOT EXISTS progresso_usuario (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    usuario_id UUID REFERENCES usuarios(id) ON DELETE CASCADE,
    episodio_id UUID REFERENCES episodios(id) ON DELETE CASCADE,
    completado BOOLEAN DEFAULT FALSE,
    tempo_assistido INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(usuario_id, episodio_id)
);

-- ============================================
-- ÍNDICES para performance
-- ============================================
CREATE INDEX IF NOT EXISTS idx_usuarios_auth_id ON usuarios(auth_id);
CREATE INDEX IF NOT EXISTS idx_usuarios_status ON usuarios(status);
CREATE INDEX IF NOT EXISTS idx_usuarios_pontuacao ON usuarios(pontuacao_total DESC);
CREATE INDEX IF NOT EXISTS idx_episodios_temporada ON episodios(temporada_id);
CREATE INDEX IF NOT EXISTS idx_questoes_prova ON questoes(prova_id);
CREATE INDEX IF NOT EXISTS idx_tentativas_usuario ON tentativas_prova(usuario_id);
CREATE INDEX IF NOT EXISTS idx_progresso_usuario ON progresso_usuario(usuario_id);

-- ============================================
-- TRIGGERS para updated_at automático
-- ============================================
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS tr_usuarios_updated_at ON usuarios;
DROP TRIGGER IF EXISTS tr_temporadas_updated_at ON temporadas;
DROP TRIGGER IF EXISTS tr_episodios_updated_at ON episodios;
DROP TRIGGER IF EXISTS tr_provas_updated_at ON provas;
DROP TRIGGER IF EXISTS tr_progresso_updated_at ON progresso_usuario;

CREATE TRIGGER tr_usuarios_updated_at
    BEFORE UPDATE ON usuarios
    FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER tr_temporadas_updated_at
    BEFORE UPDATE ON temporadas
    FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER tr_episodios_updated_at
    BEFORE UPDATE ON episodios
    FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER tr_provas_updated_at
    BEFORE UPDATE ON provas
    FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER tr_progresso_updated_at
    BEFORE UPDATE ON progresso_usuario
    FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- ============================================
-- ROW LEVEL SECURITY (RLS)
-- ============================================

-- Habilitar RLS em todas as tabelas
ALTER TABLE usuarios ENABLE ROW LEVEL SECURITY;
ALTER TABLE temporadas ENABLE ROW LEVEL SECURITY;
ALTER TABLE episodios ENABLE ROW LEVEL SECURITY;
ALTER TABLE provas ENABLE ROW LEVEL SECURITY;
ALTER TABLE questoes ENABLE ROW LEVEL SECURITY;
ALTER TABLE tentativas_prova ENABLE ROW LEVEL SECURITY;
ALTER TABLE certificados ENABLE ROW LEVEL SECURITY;
ALTER TABLE progresso_usuario ENABLE ROW LEVEL SECURITY;

-- ============================================
-- POLÍTICAS: usuarios
-- ============================================

-- Usuário pode ver seu próprio perfil
CREATE POLICY "Usuários veem próprio perfil" ON usuarios
    FOR SELECT USING (auth.uid() = auth_id);

-- Admin pode ver todos os usuários
CREATE POLICY "Admin vê todos usuários" ON usuarios
    FOR SELECT USING (
        EXISTS (SELECT 1 FROM usuarios u WHERE u.auth_id = auth.uid() AND u.is_admin = true)
    );

-- Admin pode atualizar usuários
CREATE POLICY "Admin atualiza usuários" ON usuarios
    FOR UPDATE USING (
        EXISTS (SELECT 1 FROM usuarios u WHERE u.auth_id = auth.uid() AND u.is_admin = true)
    );

-- Usuário pode inserir próprio perfil
CREATE POLICY "Usuário insere próprio perfil" ON usuarios
    FOR INSERT WITH CHECK (auth.uid() = auth_id);

-- Usuário pode atualizar próprio perfil
CREATE POLICY "Usuário atualiza próprio perfil" ON usuarios
    FOR UPDATE USING (auth.uid() = auth_id);

-- ============================================
-- POLÍTICAS: temporadas
-- ============================================

CREATE POLICY "Todos veem temporadas ativas" ON temporadas
    FOR SELECT USING (
        status IN ('ativa', 'encerrada') OR
        EXISTS (SELECT 1 FROM usuarios u WHERE u.auth_id = auth.uid() AND u.is_admin = true)
    );

CREATE POLICY "Admin gerencia temporadas" ON temporadas
    FOR ALL USING (
        EXISTS (SELECT 1 FROM usuarios u WHERE u.auth_id = auth.uid() AND u.is_admin = true)
    );

-- ============================================
-- POLÍTICAS: episodios
-- ============================================

CREATE POLICY "Usuários veem episódios publicados" ON episodios
    FOR SELECT USING (
        status = 'publicado' OR
        EXISTS (SELECT 1 FROM usuarios u WHERE u.auth_id = auth.uid() AND u.is_admin = true)
    );

CREATE POLICY "Admin gerencia episódios" ON episodios
    FOR ALL USING (
        EXISTS (SELECT 1 FROM usuarios u WHERE u.auth_id = auth.uid() AND u.is_admin = true)
    );

-- ============================================
-- POLÍTICAS: provas
-- ============================================

CREATE POLICY "Usuários veem provas ativas" ON provas
    FOR SELECT USING (
        ativa = true OR
        EXISTS (SELECT 1 FROM usuarios u WHERE u.auth_id = auth.uid() AND u.is_admin = true)
    );

CREATE POLICY "Admin gerencia provas" ON provas
    FOR ALL USING (
        EXISTS (SELECT 1 FROM usuarios u WHERE u.auth_id = auth.uid() AND u.is_admin = true)
    );

-- ============================================
-- POLÍTICAS: questoes
-- ============================================

CREATE POLICY "Usuários veem questões" ON questoes
    FOR SELECT USING (
        EXISTS (SELECT 1 FROM provas p WHERE p.id = questoes.prova_id AND p.ativa = true) OR
        EXISTS (SELECT 1 FROM usuarios u WHERE u.auth_id = auth.uid() AND u.is_admin = true)
    );

CREATE POLICY "Admin gerencia questões" ON questoes
    FOR ALL USING (
        EXISTS (SELECT 1 FROM usuarios u WHERE u.auth_id = auth.uid() AND u.is_admin = true)
    );

-- ============================================
-- POLÍTICAS: tentativas_prova
-- ============================================

CREATE POLICY "Usuário vê próprias tentativas" ON tentativas_prova
    FOR SELECT USING (
        usuario_id IN (SELECT id FROM usuarios WHERE auth_id = auth.uid()) OR
        EXISTS (SELECT 1 FROM usuarios u WHERE u.auth_id = auth.uid() AND u.is_admin = true)
    );

CREATE POLICY "Usuário cria tentativa" ON tentativas_prova
    FOR INSERT WITH CHECK (
        usuario_id IN (SELECT id FROM usuarios WHERE auth_id = auth.uid())
    );

-- ============================================
-- POLÍTICAS: certificados
-- ============================================

CREATE POLICY "Usuário vê próprios certificados" ON certificados
    FOR SELECT USING (
        usuario_id IN (SELECT id FROM usuarios WHERE auth_id = auth.uid()) OR
        EXISTS (SELECT 1 FROM usuarios u WHERE u.auth_id = auth.uid() AND u.is_admin = true)
    );

CREATE POLICY "Inserir certificado" ON certificados
    FOR INSERT WITH CHECK (true);

-- ============================================
-- POLÍTICAS: progresso_usuario
-- ============================================

CREATE POLICY "Usuário vê próprio progresso" ON progresso_usuario
    FOR SELECT USING (
        usuario_id IN (SELECT id FROM usuarios WHERE auth_id = auth.uid()) OR
        EXISTS (SELECT 1 FROM usuarios u WHERE u.auth_id = auth.uid() AND u.is_admin = true)
    );

CREATE POLICY "Usuário atualiza progresso" ON progresso_usuario
    FOR ALL USING (
        usuario_id IN (SELECT id FROM usuarios WHERE auth_id = auth.uid())
    );

-- ============================================
-- VIEWS para facilitar consultas
-- ============================================

DROP VIEW IF EXISTS ranking_publico;
DROP VIEW IF EXISTS admin_estatisticas;

CREATE VIEW ranking_publico AS
SELECT 
    nickname,
    pontuacao_total,
    RANK() OVER (ORDER BY pontuacao_total DESC) as posicao
FROM usuarios
WHERE status = 'aprovado' AND pontuacao_total > 0
ORDER BY pontuacao_total DESC;

CREATE VIEW admin_estatisticas AS
SELECT
    (SELECT COUNT(*) FROM usuarios) as total_usuarios,
    (SELECT COUNT(*) FROM usuarios WHERE status = 'pendente') as usuarios_pendentes,
    (SELECT COUNT(*) FROM usuarios WHERE status = 'aprovado') as usuarios_aprovados,
    (SELECT COUNT(*) FROM temporadas WHERE status = 'ativa') as temporadas_ativas,
    (SELECT COUNT(*) FROM episodios WHERE status = 'publicado') as episodios_publicados,
    (SELECT COALESCE(AVG(nota), 0) FROM tentativas_prova) as media_notas,
    (SELECT COUNT(*) FROM certificados) as certificados_emitidos;

-- ============================================
-- DADOS INICIAIS
-- ============================================

-- Inserir Temporada 0
INSERT INTO temporadas (titulo, descricao, status, ordem) VALUES
('Temporada 0: O Início', 'Sua jornada de transformação para Analista de Qualidade.', 'ativa', 0)
ON CONFLICT DO NOTHING;

-- ============================================
-- 🔑 CRIAR PERFIL DO ADMIN
-- ============================================
-- Cria o perfil admin para o usuário já existente no auth.users

INSERT INTO usuarios (
    auth_id,
    nome_completo,
    nickname,
    email,
    is_admin,
    status,
    pontuacao_total
)
SELECT 
    id as auth_id,
    'Administrador' as nome_completo,
    'Admin' as nickname,
    email,
    true as is_admin,
    'aprovado' as status,
    0 as pontuacao_total
FROM auth.users 
WHERE email = 'podcastnextlevell@gmail.com'
ON CONFLICT (auth_id) DO UPDATE SET
    is_admin = true,
    status = 'aprovado';

-- ============================================
SELECT 'Schema criado com sucesso! 🎙️' as status;
