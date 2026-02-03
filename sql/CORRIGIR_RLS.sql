-- ============================================
-- CORREÇÃO DEFINITIVA - Políticas RLS
-- Execute este SQL se as políticas estiverem bloqueando
-- ============================================

-- 1. DESABILITAR RLS TEMPORARIAMENTE PARA TESTE
-- ALTER TABLE modulos_bonus DISABLE ROW LEVEL SECURITY;
-- ALTER TABLE progresso_modulos_bonus DISABLE ROW LEVEL SECURITY;

-- 2. OU RECRIAR POLÍTICAS CORRETAS
-- Remover políticas antigas
DROP POLICY IF EXISTS "Usuários veem apenas módulos publicados" ON modulos_bonus;
DROP POLICY IF EXISTS "Usuários veem seu próprio progresso" ON progresso_modulos_bonus;
DROP POLICY IF EXISTS "Usuários podem inserir progresso" ON progresso_modulos_bonus;
DROP POLICY IF EXISTS "Admins veem tudo nos módulos" ON modulos_bonus;
DROP POLICY IF EXISTS "Admins veem todo progresso" ON progresso_modulos_bonus;

-- Criar políticas permissivas para TODOS os usuários autenticados
CREATE POLICY "allow_select_modulos" ON modulos_bonus
    FOR SELECT
    USING (auth.role() = 'authenticated');

CREATE POLICY "allow_select_progresso" ON progresso_modulos_bonus
    FOR SELECT
    USING (auth.uid() IN (SELECT auth_id FROM usuarios WHERE id = progresso_modulos_bonus.usuario_id));

CREATE POLICY "allow_insert_progresso" ON progresso_modulos_bonus
    FOR INSERT
    WITH CHECK (auth.uid() IN (SELECT auth_id FROM usuarios WHERE id = progresso_modulos_bonus.usuario_id));

-- Garantir que RLS está ativo
ALTER TABLE modulos_bonus ENABLE ROW LEVEL SECURITY;
ALTER TABLE progresso_modulos_bonus ENABLE ROW LEVEL SECURITY;

-- ============================================
-- VERIFICAR SE FUNCIONOU
-- ============================================
SELECT 
    tablename,
    policyname,
    cmd
FROM pg_policies
WHERE tablename IN ('modulos_bonus', 'progresso_modulos_bonus')
ORDER BY tablename;
