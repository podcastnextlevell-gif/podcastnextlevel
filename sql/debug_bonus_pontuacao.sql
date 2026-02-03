-- ============================================
-- DEBUG: Verificar Sistema de Pontuação Bônus
-- Execute no Supabase SQL Editor
-- ============================================

-- 1. Verificar se trigger existe
SELECT 
    trigger_name,
    event_manipulation,
    event_object_table,
    action_statement
FROM information_schema.triggers
WHERE trigger_name = 'trigger_pontuacao_bonus';

-- 2. Verificar registros em progresso_modulos_bonus
SELECT 
    p.*,
    u.nome_completo,
    u.pontuacao_total as pontos_usuario_atual,
    m.codigo as modulo_codigo,
    m.nome as modulo_nome
FROM progresso_modulos_bonus p
JOIN usuarios u ON p.usuario_id = u.id
JOIN modulos_bonus m ON p.modulo_id = m.id
ORDER BY p.completado_em DESC
LIMIT 10;

-- 3. Verificar pontuação total dos usuários
SELECT 
    id,
    nome_completo,
    email,
    pontuacao_total,
    updated_at
FROM usuarios
ORDER BY updated_at DESC
LIMIT 5;

-- 4. Verificar se módulos foram inseridos
SELECT COUNT(*) as total_modulos FROM modulos_bonus;

-- 5. Verificar se há progresso registrado
SELECT COUNT(*) as total_conclusoes FROM progresso_modulos_bonus;

-- ============================================
-- Se trigger não existe, executar:
-- ============================================
/*
CREATE OR REPLACE FUNCTION atualizar_pontuacao_bonus()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE usuarios
    SET pontuacao_total = pontuacao_total + NEW.pontos_ganhos,
        updated_at = NOW()
    WHERE id = NEW.usuario_id;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER trigger_pontuacao_bonus
    AFTER INSERT ON progresso_modulos_bonus
    FOR EACH ROW
    EXECUTE FUNCTION atualizar_pontuacao_bonus();
*/
