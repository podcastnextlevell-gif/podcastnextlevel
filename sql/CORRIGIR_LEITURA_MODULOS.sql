-- 🚨 SCRIPT DE EMERGÊNCIA - LIBERAR LEITURA DE MÓDULOS
-- Execute isso no Supabase SQL Editor para corrigir a exibição do dashboard

-- 1. Garante que qualquer um (logado ou não, ou trigger) possa LER a tabela de definições de módulos
ALTER TABLE modulos_bonus ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "modulos_leitura_total" ON modulos_bonus;

CREATE POLICY "modulos_leitura_total" 
ON modulos_bonus 
FOR SELECT 
TO public 
USING (true);

-- 2. Garante leitura do progresso para o próprio dono
DROP POLICY IF EXISTS "progresso_select_own" ON progresso_modulos_bonus;

CREATE POLICY "progresso_select_own" 
ON progresso_modulos_bonus 
FOR SELECT 
TO public 
USING (auth.uid() IN (SELECT auth_id FROM usuarios WHERE id = usuario_id));

-- 3. Confirmação
SELECT count(*) as total_modulos FROM modulos_bonus;
