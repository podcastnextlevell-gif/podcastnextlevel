-- ============================================
-- 🛠️ FIX SCORING & QUIZ PERMISSIONS
-- ============================================
-- Execute este script no SQL Editor do Supabase
-- para corrigir:
-- 1. Erro ao salvar questões (Permissões insuficientes)
-- 2. Erro de pontuação (Função inexistente)
-- ============================================

-- 1. CRIAR FUNÇÃO RPC PARA PONTUAÇÃO (Fix RPC Error)
-- ============================================
CREATE OR REPLACE FUNCTION increment_pontuacao(user_id UUID, pontos INTEGER)
RETURNS VOID AS $$
BEGIN
  UPDATE usuarios
  SET pontuacao_total = COALESCE(pontuacao_total, 0) + pontos,
      updated_at = NOW()
  WHERE id = user_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 2. CORRIGIR RLS DE QUESTÕES (Fix Questions Saving)
-- ============================================
-- Remove políticas antigas que podem estar conflitando
DROP POLICY IF EXISTS "Admin gerencia questões" ON questoes;
DROP POLICY IF EXISTS "Usuários veem questões" ON questoes;

-- Política simples e direta para o ADMIN (CRUD total)
CREATE POLICY "Admin total access questoes"
ON questoes
FOR ALL
USING (
  EXISTS (SELECT 1 FROM usuarios WHERE auth_id = auth.uid() AND is_admin = true)
);

-- Política para USUÁRIOS (Apenas leitura)
CREATE POLICY "Public read questoes"
ON questoes
FOR SELECT
USING (true); -- Simplificado para debug. Se quiser restrito: (EXISTS (SELECT 1 FROM provas p WHERE p.id = questoes.prova_id AND p.ativa = true))

-- 3. CORRIGIR RLS DE TENTATIVAS (Fix Users Saving Attempts)
-- ============================================
DROP POLICY IF EXISTS "Usuário cria tentativa" ON tentativas_prova;
DROP POLICY IF EXISTS "Usuário vê próprias tentativas" ON tentativas_prova;

-- Permitir INSERT para usuários autenticados
CREATE POLICY "Users insert attempts"
ON tentativas_prova
FOR INSERT
WITH CHECK (
  auth.uid() IN (SELECT auth_id FROM usuarios WHERE id = usuario_id)
);

-- Permitir SELECT para o próprio usuário
CREATE POLICY "Users view own attempts"
ON tentativas_prova
FOR SELECT
USING (
  auth.uid() IN (SELECT auth_id FROM usuarios WHERE id = usuario_id)
);

-- 4. CORRIGIR RLS DE PROVAS (Garantir admin access)
-- ============================================
-- Apenas reforço
DROP POLICY IF EXISTS "Admin gerencia provas" ON provas;

CREATE POLICY "Admin total access provas"
ON provas
FOR ALL
USING (
  EXISTS (SELECT 1 FROM usuarios WHERE auth_id = auth.uid() AND is_admin = true)
);

SELECT 'Correções aplicadas com sucesso: RPC + RLS atualizados! 🚀' as status;
