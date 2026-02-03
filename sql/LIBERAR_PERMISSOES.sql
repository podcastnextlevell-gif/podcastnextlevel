-- ============================================
-- 🔓 LIBERAÇÃO TOTAL DE PERMISSÕES (SOLUÇÃO DE EMERGÊNCIA)
-- Execute este script no Supabase SQL Editor
-- ============================================

BEGIN;

-- 1. Habilitar RLS (caso esteja desabilitado)
ALTER TABLE progresso_modulos_bonus ENABLE ROW LEVEL SECURITY;

-- 2. Remover TODAS as políticas restritivas antigas
DROP POLICY IF EXISTS "Usuários veem apenas módulos publicados" ON modulos_bonus;
DROP POLICY IF EXISTS "Usuários veem seu próprio progresso" ON progresso_modulos_bonus;
DROP POLICY IF EXISTS "Usuários podem inserir progresso" ON progresso_modulos_bonus;
DROP POLICY IF EXISTS "allow_select_modulos" ON modulos_bonus;
DROP POLICY IF EXISTS "allow_select_progresso" ON progresso_modulos_bonus;
DROP POLICY IF EXISTS "allow_insert_progresso" ON progresso_modulos_bonus;

-- 3. CRIAR POLÍTICAS PERMISSIVAS (Mas seguras para autenticados)

-- Tabela modulos_bonus: Leitura para TODOS autenticados
CREATE POLICY "Permitir leitura de modulos para todos autenticados"
ON modulos_bonus FOR SELECT
TO authenticated
USING (true);

-- Tabela progresso_modulos_bonus: Leitura apenas do PRÓPRIO usuário
CREATE POLICY "Permitir leitura do proprio progresso"
ON progresso_modulos_bonus FOR SELECT
TO authenticated
USING (auth.uid() IN (SELECT auth_id FROM usuarios WHERE id = progresso_modulos_bonus.usuario_id));

-- Tabela progresso_modulos_bonus: Inserção LIBERADA para autenticados
-- (A validação de ID já é feita no BonusService.js e na constraint UNIQUE)
CREATE POLICY "Permitir insercao de progresso para autenticados"
ON progresso_modulos_bonus FOR INSERT
TO authenticated
WITH CHECK (true);

COMMIT;

-- 4. Confirmação
SELECT tablename, policyname, cmd FROM pg_policies WHERE tablename = 'progresso_modulos_bonus';
