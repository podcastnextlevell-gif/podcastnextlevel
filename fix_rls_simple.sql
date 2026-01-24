-- =====================================================
-- SOLUÇÃO SIMPLIFICADA - DESABILITAR RLS PARA TABELAS DE CONTEÚDO
-- Execute este script no SQL Editor do Supabase
-- =====================================================

-- Para tabelas de conteúdo gerenciadas apenas pelo admin,
-- a abordagem mais simples é desabilitar RLS

-- EPISÓDIOS - desabilitar RLS (apenas admin gerencia)
ALTER TABLE episodios DISABLE ROW LEVEL SECURITY;

-- TEMPORADAS - desabilitar RLS (apenas admin gerencia)
ALTER TABLE temporadas DISABLE ROW LEVEL SECURITY;

-- PROVAS - desabilitar RLS (apenas admin gerencia)
ALTER TABLE provas DISABLE ROW LEVEL SECURITY;

-- QUESTOES - desabilitar RLS (apenas admin gerencia)
ALTER TABLE questoes DISABLE ROW LEVEL SECURITY;

-- =====================================================
-- MANTER RLS PARA TABELAS COM DADOS DE USUÁRIOS
-- =====================================================

-- CERTIFICADOS - habilitar com políticas permissivas
ALTER TABLE certificados ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Allow all on certificados" ON certificados;
CREATE POLICY "Allow all on certificados" ON certificados FOR ALL USING (true) WITH CHECK (true);

-- TENTATIVAS_PROVA - habilitar com políticas permissivas
ALTER TABLE tentativas_prova ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Allow all on tentativas_prova" ON tentativas_prova;
CREATE POLICY "Allow all on tentativas_prova" ON tentativas_prova FOR ALL USING (true) WITH CHECK (true);

-- USUARIOS - habilitar com políticas permissivas
ALTER TABLE usuarios ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Allow all on usuarios" ON usuarios;
CREATE POLICY "Allow all on usuarios" ON usuarios FOR ALL USING (true) WITH CHECK (true);

-- PROGRESSO_USUARIO - habilitar com políticas permissivas
ALTER TABLE progresso_usuario ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Allow all on progresso_usuario" ON progresso_usuario;
CREATE POLICY "Allow all on progresso_usuario" ON progresso_usuario FOR ALL USING (true) WITH CHECK (true);

-- AVALIACOES_TEMPORADA - habilitar com políticas permissivas
ALTER TABLE avaliacoes_temporada ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Allow all on avaliacoes_temporada" ON avaliacoes_temporada;
CREATE POLICY "Allow all on avaliacoes_temporada" ON avaliacoes_temporada FOR ALL USING (true) WITH CHECK (true);

-- =====================================================
-- FUNÇÃO RPC PARA INCREMENTAR PONTUAÇÃO
-- =====================================================
CREATE OR REPLACE FUNCTION increment_pontuacao(user_id UUID, pontos INTEGER)
RETURNS VOID AS $$
BEGIN
    UPDATE usuarios 
    SET pontuacao_total = COALESCE(pontuacao_total, 0) + pontos
    WHERE id = user_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
