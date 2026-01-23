-- ============================================
-- 📦 SUPABASE STORAGE POLICIES
-- ============================================
-- Execute este script no SQL Editor do Supabase para corrigir o erro:
-- "new row violates row-level security policy"
-- ============================================

-- 1. Garantir que os buckets existem (caso não tenham sido criados manualmente)
INSERT INTO storage.buckets (id, name, public)
VALUES 
  ('audios', 'audios', true), 
  ('imagens', 'imagens', true)
ON CONFLICT (id) DO UPDATE SET public = true;

-- 2. Remover políticas antigas para evitar conflitos
DROP POLICY IF EXISTS "Acesso público a audios e imagens" ON storage.objects;
DROP POLICY IF EXISTS "Upload autenticado" ON storage.objects;
DROP POLICY IF EXISTS "Update autenticado" ON storage.objects;
DROP POLICY IF EXISTS "Delete autenticado" ON storage.objects;

-- 3. Criar Políticas de Segurança (RLS)

-- ✅ ALLOW PUBLIC READ: Qualquer pessoa pode ver/baixar os arquivos (necessário para os usuários ouvirem o podcast)
CREATE POLICY "Acesso público a audios e imagens"
ON storage.objects FOR SELECT
USING ( bucket_id IN ('audios', 'imagens') );

-- ✅ ALLOW AUTHENTICATED UPLOAD: Apenas usuários logados podem enviar arquivos
CREATE POLICY "Upload autenticado"
ON storage.objects FOR INSERT
WITH CHECK (
  bucket_id IN ('audios', 'imagens') 
  AND auth.role() = 'authenticated'
);

-- ✅ ALLOW AUTHENTICATED UPDATE: Apenas usuários logados podem substituir arquivos
CREATE POLICY "Update autenticado"
ON storage.objects FOR UPDATE
USING (
  bucket_id IN ('audios', 'imagens') 
  AND auth.role() = 'authenticated'
);

-- ✅ ALLOW AUTHENTICATED DELETE: Apenas usuários logados podem deletar arquivos
CREATE POLICY "Delete autenticado"
ON storage.objects FOR DELETE
USING (
  bucket_id IN ('audios', 'imagens') 
  AND auth.role() = 'authenticated'
);

SELECT 'Políticas de Storage aplicadas com sucesso! 🚀' as status;
