-- =====================================================
-- SCRIPT DE LIMPEZA DIRETA (V3) - "FORÇA BRUTA"
-- Execute este script no SQL Editor do Supabase
-- =====================================================

-- Este script deleta registros diretamente baseado no email, 
-- sem depender de variáveis ou funções complexas.

-- 1. Limpar Progresso (Episódios)
DELETE FROM progresso_usuario 
WHERE usuario_id IN (SELECT id FROM auth.users WHERE email ILIKE '%fernando.pevangelista%');

-- 2. Limpar Tentativas de Prova
DELETE FROM tentativas_prova 
WHERE usuario_id IN (SELECT id FROM auth.users WHERE email ILIKE '%fernando.pevangelista%');

-- 3. Limpar Certificados
DELETE FROM certificados 
WHERE usuario_id IN (SELECT id FROM auth.users WHERE email ILIKE '%fernando.pevangelista%');

-- 4. Limpar Avaliações
DELETE FROM avaliacoes_temporada 
WHERE usuario_id IN (SELECT id FROM auth.users WHERE email ILIKE '%fernando.pevangelista%');

-- 5. Zerar Pontuação
UPDATE usuarios 
SET pontuacao_total = 0 
WHERE id IN (SELECT id FROM auth.users WHERE email ILIKE '%fernando.pevangelista%');
