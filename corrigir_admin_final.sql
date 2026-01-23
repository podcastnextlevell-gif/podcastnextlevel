-- ==============================================================================
-- CORREÇÃO DEFINITIVA DE PERMISSÕES DE ADMIN (RLS)
-- Execute este script COMPLETO no SQL Editor do Supabase
-- ==============================================================================

-- 1. Criar função segura para verificar se é admin
-- O "SECURITY DEFINER" permite que esta função leia a tabela usuarios 
-- ignorando as restrições de RLS temporariamente.
CREATE OR REPLACE FUNCTION public.check_is_admin()
RETURNS BOOLEAN AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1
    FROM public.usuarios
    WHERE auth_id = auth.uid()
    AND is_admin = true
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 2. Limpar TODAS as políticas antigas para evitar conflitos
DROP POLICY IF EXISTS "Admin ve todos usuarios" ON usuarios;
DROP POLICY IF EXISTS "Admin atualiza usuarios" ON usuarios;
DROP POLICY IF EXISTS "Usuarios veem seus proprios dados" ON usuarios;
DROP POLICY IF EXISTS "Qualquer um pode criar perfil" ON usuarios;
DROP POLICY IF EXISTS "Enable read access for all users" ON usuarios;
DROP POLICY IF EXISTS "Enable insert for authenticated users only" ON usuarios;
-- (Limpeza extra por segurança)
DROP POLICY IF EXISTS "select_users" ON usuarios;
DROP POLICY IF EXISTS "update_users" ON usuarios;

-- 3. Criar Políticas Novas e Corretas

-- A. VISUALIZAÇÃO (SELECT)
-- Admin pode ver TODOS. Usuário comum pode ver APENAS ELE MESMO.
CREATE POLICY "Politica de Visualizacao" ON usuarios
    FOR SELECT USING (
        public.check_is_admin() = true -- Admin vê tudo
        OR 
        auth.uid() = auth_id -- Usuário vê a si mesmo
    );

-- B. ATUALIZAÇÃO (UPDATE)
-- Admin pode aprovar/reprovar (atualizar qualquer um).
-- Usuário comum só atualiza o próprio perfil (se necessário).
CREATE POLICY "Politica de Edicao" ON usuarios
    FOR UPDATE USING (
        public.check_is_admin() = true
        OR 
        auth.uid() = auth_id
    );

-- C. CRIAÇÃO (INSERT)
-- Qualquer usuário autenticado pode criar seu próprio perfil no cadastro.
CREATE POLICY "Politica de Criacao" ON usuarios
    FOR INSERT WITH CHECK (
        auth.uid() = auth_id
    );

-- 4. Garantir que RLS está ativo
ALTER TABLE usuarios ENABLE ROW LEVEL SECURITY;

-- 5. Atualizar metadados do admin (opcional, mas recomendado para consistência)
UPDATE auth.users
SET raw_user_meta_data = jsonb_set(
  COALESCE(raw_user_meta_data, '{}'::jsonb),
  '{is_admin}',
  'true'
)
WHERE email = 'podcastnextlevell@gmail.com';

-- Confirmação
SELECT 'Correção aplicada com sucesso!' as status;
