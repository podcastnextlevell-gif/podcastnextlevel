-- ============================================
-- DIAGNÓSTICO COMPLETO - Sistema Bônus
-- Execute TUDO no Supabase SQL Editor
-- ============================================

-- 1. VERIFICAR SE TABELAS EXISTEM
SELECT 
    table_name,
    table_type
FROM information_schema.tables
WHERE table_schema = 'public'
AND table_name IN ('modulos_bonus', 'progresso_modulos_bonus', 'usuarios');

-- 2. VERIFICAR SE MÓDULOS FORAM INSERIDOS
SELECT COUNT(*) as total_modulos FROM modulos_bonus;
SELECT codigo, nome, pontos_facil FROM modulos_bonus LIMIT 5;

-- 3. VERIFICAR SE HÁ PROGRESSO REGISTRADO
SELECT COUNT(*) as total_progresso FROM progresso_modulos_bonus;

-- 4. VERIFICAR POLÍTICAS RLS
SELECT 
    schemaname,
    tablename,
    policyname,
    permissive,
    roles,
    cmd,
    qual,
    with_check
FROM pg_policies
WHERE tablename IN ('modulos_bonus', 'progresso_modulos_bonus')
ORDER BY tablename, policyname;

-- 5. VERIFICAR SE TRIGGER EXISTE
SELECT 
    trigger_name,
    event_object_table,
    action_statement,
    action_timing,
    event_manipulation
FROM information_schema.triggers
WHERE trigger_name = 'trigger_pontuacao_bonus';

-- 6. VERIFICAR SE FUNÇÃO DO TRIGGER EXISTE
SELECT 
    routine_name,
    routine_type,
    routine_definition
FROM information_schema.routines
WHERE routine_name = 'atualizar_pontuacao_bonus';

-- ============================================
-- SE NÃO APARECER NADA ACIMA, EXECUTE ISTO:
-- ============================================

-- RECRIAR FUNÇÃO E TRIGGER
DROP TRIGGER IF EXISTS trigger_pontuacao_bonus ON progresso_modulos_bonus;
DROP FUNCTION IF EXISTS atualizar_pontuacao_bonus();

CREATE OR REPLACE FUNCTION atualizar_pontuacao_bonus()
RETURNS TRIGGER AS $$
BEGIN
    -- Atualizar pontuação total do usuário
    UPDATE usuarios
    SET pontuacao_total = COALESCE(pontuacao_total, 0) + NEW.pontos_ganhos,
        updated_at = NOW()
    WHERE id = NEW.usuario_id;
    
    RAISE NOTICE 'Pontuação atualizada: usuário=%, pontos=%', NEW.usuario_id, NEW.pontos_ganhos;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER trigger_pontuacao_bonus
    AFTER INSERT ON progresso_modulos_bonus
    FOR EACH ROW
    EXECUTE FUNCTION atualizar_pontuacao_bonus();

-- ============================================
-- TESTE MANUAL (substitua os valores)
-- ============================================

-- Pegar seu usuario_id:
SELECT id, nome_completo, email, pontuacao_total 
FROM usuarios 
WHERE email = 'podcastnextlevell@gmail.com';

-- Inserir teste (SUBSTITUA 1 pelo seu usuario_id e 1 pelo id de um módulo):
/*
INSERT INTO progresso_modulos_bonus (usuario_id, modulo_id, nivel, pontos_ganhos)
VALUES (1, 1, 'facil', 5)
RETURNING *;
*/

-- Verificar se pontos foram somados:
/*
SELECT id, nome_completo, pontuacao_total 
FROM usuarios 
WHERE id = 1;
*/
