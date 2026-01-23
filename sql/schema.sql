-- ============================================
-- 🎙️ NEXT LEVEL PODCAST - Database Schema
-- ============================================
-- Execute este script no SQL Editor do Supabase
-- URL: https://supabase.com/dashboard/project/dnmeeirmjljmvbwcsdpx/sql
-- ============================================

-- 1. TABELA: usuarios
-- Perfis dos usuários da plataforma
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

-- 2. TABELA: temporadas
-- Temporadas do podcast
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

-- 3. TABELA: episodios
-- Episódios de cada temporada
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

-- 4. TABELA: provas
-- Provas de cada temporada
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

-- 5. TABELA: questoes
-- Questões das provas
CREATE TABLE IF NOT EXISTS questoes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    prova_id UUID REFERENCES provas(id) ON DELETE CASCADE,
    pergunta TEXT NOT NULL,
    opcoes JSONB NOT NULL DEFAULT '[]',
    resposta_correta TEXT NOT NULL,
    ordem INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 6. TABELA: tentativas_prova
-- Histórico de tentativas de prova
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

-- 7. TABELA: certificados
-- Certificados emitidos
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

-- 8. TABELA: progresso_usuario
-- Progresso nos episódios
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

-- POLÍTICAS: usuarios
-- Usuário pode ver seu próprio perfil
CREATE POLICY "Usuários veem próprio perfil" ON usuarios
    FOR SELECT USING (auth.uid() = auth_id);

-- Admin pode ver todos os usuários
CREATE POLICY "Admin vê todos usuários" ON usuarios
    FOR SELECT USING (
        EXISTS (SELECT 1 FROM usuarios WHERE auth_id = auth.uid() AND is_admin = true)
    );

-- Admin pode atualizar usuários
CREATE POLICY "Admin atualiza usuários" ON usuarios
    FOR UPDATE USING (
        EXISTS (SELECT 1 FROM usuarios WHERE auth_id = auth.uid() AND is_admin = true)
    );

-- Usuário pode inserir próprio perfil
CREATE POLICY "Usuário insere próprio perfil" ON usuarios
    FOR INSERT WITH CHECK (auth.uid() = auth_id);

-- Usuário pode atualizar próprio perfil (campos limitados)
CREATE POLICY "Usuário atualiza próprio perfil" ON usuarios
    FOR UPDATE USING (auth.uid() = auth_id);

-- POLÍTICAS: temporadas
-- Todos podem ver temporadas ativas
CREATE POLICY "Todos veem temporadas ativas" ON temporadas
    FOR SELECT USING (status IN ('ativa', 'encerrada') OR
        EXISTS (SELECT 1 FROM usuarios WHERE auth_id = auth.uid() AND is_admin = true)
    );

-- Admin pode gerenciar temporadas
CREATE POLICY "Admin gerencia temporadas" ON temporadas
    FOR ALL USING (
        EXISTS (SELECT 1 FROM usuarios WHERE auth_id = auth.uid() AND is_admin = true)
    );

-- POLÍTICAS: episodios
-- Usuários aprovados veem episódios publicados
CREATE POLICY "Usuários veem episódios publicados" ON episodios
    FOR SELECT USING (
        status = 'publicado' OR
        EXISTS (SELECT 1 FROM usuarios WHERE auth_id = auth.uid() AND is_admin = true)
    );

-- Admin pode gerenciar episódios
CREATE POLICY "Admin gerencia episódios" ON episodios
    FOR ALL USING (
        EXISTS (SELECT 1 FROM usuarios WHERE auth_id = auth.uid() AND is_admin = true)
    );

-- POLÍTICAS: provas
-- Usuários aprovados veem provas ativas
CREATE POLICY "Usuários veem provas ativas" ON provas
    FOR SELECT USING (
        ativa = true OR
        EXISTS (SELECT 1 FROM usuarios WHERE auth_id = auth.uid() AND is_admin = true)
    );

-- Admin pode gerenciar provas
CREATE POLICY "Admin gerencia provas" ON provas
    FOR ALL USING (
        EXISTS (SELECT 1 FROM usuarios WHERE auth_id = auth.uid() AND is_admin = true)
    );

-- POLÍTICAS: questoes
-- Usuários veem questões de provas ativas
CREATE POLICY "Usuários veem questões" ON questoes
    FOR SELECT USING (
        EXISTS (SELECT 1 FROM provas WHERE provas.id = questoes.prova_id AND provas.ativa = true) OR
        EXISTS (SELECT 1 FROM usuarios WHERE auth_id = auth.uid() AND is_admin = true)
    );

-- Admin pode gerenciar questões
CREATE POLICY "Admin gerencia questões" ON questoes
    FOR ALL USING (
        EXISTS (SELECT 1 FROM usuarios WHERE auth_id = auth.uid() AND is_admin = true)
    );

-- POLÍTICAS: tentativas_prova
-- Usuário vê próprias tentativas
CREATE POLICY "Usuário vê próprias tentativas" ON tentativas_prova
    FOR SELECT USING (
        usuario_id IN (SELECT id FROM usuarios WHERE auth_id = auth.uid()) OR
        EXISTS (SELECT 1 FROM usuarios WHERE auth_id = auth.uid() AND is_admin = true)
    );

-- Usuário pode criar tentativa
CREATE POLICY "Usuário cria tentativa" ON tentativas_prova
    FOR INSERT WITH CHECK (
        usuario_id IN (SELECT id FROM usuarios WHERE auth_id = auth.uid())
    );

-- POLÍTICAS: certificados
-- Usuário vê próprios certificados
CREATE POLICY "Usuário vê próprios certificados" ON certificados
    FOR SELECT USING (
        usuario_id IN (SELECT id FROM usuarios WHERE auth_id = auth.uid()) OR
        EXISTS (SELECT 1 FROM usuarios WHERE auth_id = auth.uid() AND is_admin = true)
    );

-- Sistema pode criar certificado
CREATE POLICY "Inserir certificado" ON certificados
    FOR INSERT WITH CHECK (true);

-- POLÍTICAS: progresso_usuario
-- Usuário vê próprio progresso
CREATE POLICY "Usuário vê próprio progresso" ON progresso_usuario
    FOR SELECT USING (
        usuario_id IN (SELECT id FROM usuarios WHERE auth_id = auth.uid()) OR
        EXISTS (SELECT 1 FROM usuarios WHERE auth_id = auth.uid() AND is_admin = true)
    );

-- Usuário pode atualizar próprio progresso
CREATE POLICY "Usuário atualiza progresso" ON progresso_usuario
    FOR ALL USING (
        usuario_id IN (SELECT id FROM usuarios WHERE auth_id = auth.uid())
    );

-- ============================================
-- VIEWS para facilitar consultas
-- ============================================

-- View: Ranking público (só nickname)
CREATE OR REPLACE VIEW ranking_publico AS
SELECT 
    nickname,
    pontuacao_total,
    RANK() OVER (ORDER BY pontuacao_total DESC) as posicao
FROM usuarios
WHERE status = 'aprovado' AND pontuacao_total > 0
ORDER BY pontuacao_total DESC;

-- View: Estatísticas do Admin
CREATE OR REPLACE VIEW admin_estatisticas AS
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

-- Inserir Temporada 0 (original do HTML)
INSERT INTO temporadas (titulo, descricao, status, ordem) VALUES
('Temporada 0: O Início', 'Sua jornada de transformação para Analista de Qualidade.', 'ativa', 0)
ON CONFLICT DO NOTHING;

-- Nota: O admin será criado automaticamente quando o email 
-- podcastnextlevell@gmail.com fizer login pela primeira vez

SELECT 'Schema criado com sucesso! 🎙️' as status;
