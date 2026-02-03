-- ============================================
-- 📚 MÓDULOS BÔNUS - Schema SQL
-- Execute no Supabase SQL Editor
-- ============================================

-- ============================================
-- 1. TABELA: modulos_bonus
-- Armazena todos os módulos bônus disponíveis
-- ============================================
CREATE TABLE IF NOT EXISTS modulos_bonus (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    codigo TEXT UNIQUE NOT NULL, -- Ex: 'EP00A_ROI', 'EP13_RELATORIOS'
    nome TEXT NOT NULL,
    descricao TEXT,
    temporada INTEGER NOT NULL,
    episodio_prerequisito TEXT, -- Ex: 'EP00A', 'EP13'
    tecnologias TEXT[], -- Array de strings: ['HTML', 'Python', 'Chart.js']
    pontos_facil INTEGER DEFAULT 5,
    pontos_intermediario INTEGER DEFAULT 10,
    pontos_dificil INTEGER DEFAULT 20,
    publicado BOOLEAN DEFAULT TRUE, -- Controle de visibilidade (admin)
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 2. TABELA: progresso_modulos_bonus  
-- Armazena progresso de usuários nos módulos
-- ============================================
CREATE TABLE IF NOT EXISTS progresso_modulos_bonus (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    usuario_id UUID NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    modulo_id UUID NOT NULL REFERENCES modulos_bonus(id) ON DELETE CASCADE,
    nivel TEXT NOT NULL CHECK (nivel IN ('facil', 'intermediario', 'dificil')),
    pontos_ganhos INTEGER NOT NULL,
    completado_em TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    -- Evita completar o mesmo módulo+nível múltiplas vezes
    UNIQUE(usuario_id, modulo_id, nivel)
);

-- ============================================
-- ÍNDICES para performance
-- ============================================
CREATE INDEX IF NOT EXISTS idx_modulos_bonus_temporada ON modulos_bonus(temporada);
CREATE INDEX IF NOT EXISTS idx_modulos_bonus_codigo ON modulos_bonus(codigo);
CREATE INDEX IF NOT EXISTS idx_progresso_usuario ON progresso_modulos_bonus(usuario_id);
CREATE INDEX IF NOT EXISTS idx_progresso_modulo ON progresso_modulos_bonus(modulo_id);

-- ============================================
-- RLS POLICIES
-- ============================================
ALTER TABLE modulos_bonus ENABLE ROW LEVEL SECURITY;
ALTER TABLE progresso_modulos_bonus ENABLE ROW LEVEL SECURITY;

-- Políticas modulos_bonus
DROP POLICY IF EXISTS "Todos veem módulos publicados" ON modulos_bonus;
CREATE POLICY "Todos veem módulos publicados" 
    ON modulos_bonus FOR SELECT 
    USING (publicado = TRUE OR auth.email() = 'podcastnextlevell@gmail.com');

DROP POLICY IF EXISTS "Admin gerencia módulos" ON modulos_bonus;
CREATE POLICY "Admin gerencia módulos" 
    ON modulos_bonus FOR ALL 
    USING (auth.email() = 'podcastnextlevell@gmail.com');

-- Políticas progresso_modulos_bonus
DROP POLICY IF EXISTS "Usuário vê próprio progresso módulos" ON progresso_modulos_bonus;
CREATE POLICY "Usuário vê próprio progresso módulos" 
    ON progresso_modulos_bonus FOR SELECT 
    USING (
        usuario_id IN (SELECT id FROM usuarios WHERE auth_id = auth.uid())
        OR auth.email() = 'podcastnextlevell@gmail.com'
    );

DROP POLICY IF EXISTS "Usuário insere próprio progresso" ON progresso_modulos_bonus;
CREATE POLICY "Usuário insere próprio progresso" 
    ON progresso_modulos_bonus FOR INSERT 
    WITH CHECK (usuario_id IN (SELECT id FROM usuarios WHERE auth_id = auth.uid()));

DROP POLICY IF EXISTS "Admin gerencia progresso módulos" ON progresso_modulos_bonus;
CREATE POLICY "Admin gerencia progresso módulos" 
    ON progresso_modulos_bonus FOR ALL 
    USING (auth.email() = 'podcastnextlevell@gmail.com');

-- ============================================
-- TRIGGER: Atualizar pontuacao_total ao completar módulo
-- ============================================
CREATE OR REPLACE FUNCTION atualizar_pontuacao_bonus()
RETURNS TRIGGER AS $$
BEGIN
    -- Soma os pontos ganhos ao total do usuário
    UPDATE usuarios
    SET pontuacao_total = pontuacao_total + NEW.pontos_ganhos,
        updated_at = NOW()
    WHERE id = NEW.usuario_id;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS trigger_pontuacao_bonus ON progresso_modulos_bonus;
CREATE TRIGGER trigger_pontuacao_bonus
    AFTER INSERT ON progresso_modulos_bonus
    FOR EACH ROW
    EXECUTE FUNCTION atualizar_pontuacao_bonus();

-- ============================================
-- ✅ PRONTO! Agora execute o seed para popular módulos
-- ============================================
