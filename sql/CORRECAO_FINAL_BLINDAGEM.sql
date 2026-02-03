-- ============================================
-- 🛡️ CORREÇÃO FINAL E BLINDAGEM DO SISTEMA
-- Execute este script COMPLETO no Supabase SQL Editor
-- ============================================

BEGIN;

-- 1. LIMPAR DUPLICATAS (Mantém apenas o primeiro registro)
DELETE FROM progresso_modulos_bonus a USING (
    SELECT MIN(ctid) as ctid, usuario_id, modulo_id, nivel
    FROM progresso_modulos_bonus 
    GROUP BY usuario_id, modulo_id, nivel
    HAVING COUNT(*) > 1
) b
WHERE a.usuario_id = b.usuario_id 
AND a.modulo_id = b.modulo_id 
AND a.nivel = b.nivel 
AND a.ctid <> b.ctid;

-- 2. ADICIONAR RESTRIÇÃO ÚNICA (Impede fisicamente duplicatas futuros)
-- Se a constraint já existir, isso pode dar erro, mas é seguro ignorar
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'progresso_unico_usuario_modulo_nivel') THEN
        ALTER TABLE progresso_modulos_bonus
        ADD CONSTRAINT progresso_unico_usuario_modulo_nivel 
        UNIQUE (usuario_id, modulo_id, nivel);
    END IF;
END $$;

-- 3. RECRIAR FUNÇÃO DE PONTUAÇÃO (Mais robusta e com Logs)
CREATE OR REPLACE FUNCTION atualizar_pontuacao_bonus()
RETURNS TRIGGER AS $$
DECLARE
    pontos_anteriores INTEGER;
BEGIN
    -- Pegar pontuacao atual para log
    SELECT pontuacao_total INTO pontos_anteriores FROM usuarios WHERE id = NEW.usuario_id;

    -- Atualizar
    UPDATE usuarios
    SET pontuacao_total = COALESCE(pontuacao_total, 0) + NEW.pontos_ganhos,
        updated_at = NOW()
    WHERE id = NEW.usuario_id;
    
    -- Log para debug no console do Supabase
    RAISE NOTICE '⭐ BONUS TRIGGER: Usuario % | Pontos: % -> % (+%)', 
        NEW.usuario_id, 
        COALESCE(pontos_anteriores, 0), 
        COALESCE(pontos_anteriores, 0) + NEW.pontos_ganhos, 
        NEW.pontos_ganhos;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER; -- SECURITY DEFINER é crucial! Ignora RLS para o update.

-- 4. REINSTALAR O TRIGGER
DROP TRIGGER IF EXISTS trigger_pontuacao_bonus ON progresso_modulos_bonus;

CREATE TRIGGER trigger_pontuacao_bonus
    AFTER INSERT ON progresso_modulos_bonus
    FOR EACH ROW
    EXECUTE FUNCTION atualizar_pontuacao_bonus();

-- 5. CORRIGIR PONTUAÇÃO (Recalcular do zero para garantir integridade)
-- Isso soma todos os pontos de progresso e define no usuário, corrigindo qualquer erro passado
WITH pontuacao_real AS (
    SELECT usuario_id, SUM(pontos_ganhos) as total_bonus
    FROM progresso_modulos_bonus
    GROUP BY usuario_id
)
UPDATE usuarios u
SET pontuacao_total = COALESCE(pr.total_bonus, 0)
FROM pontuacao_real pr
WHERE u.id = pr.usuario_id;

COMMIT;

-- 6. VERIFICAÇÃO FINAL (Output)
SELECT 
    u.nome_completo, 
    u.pontuacao_total, 
    COUNT(p.id) as modulos_completados
FROM usuarios u
LEFT JOIN progresso_modulos_bonus p ON u.id = p.usuario_id
GROUP BY u.id, u.nome_completo, u.pontuacao_total;
