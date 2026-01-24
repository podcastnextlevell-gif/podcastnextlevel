-- =====================================================
-- SCRIPT DE LIMPEZA PROFUNDA E RESET DE USUÁRIO
-- Execute este script no SQL Editor do Supabase
-- Alvo: fernando.pevangelista@gmail.com
-- =====================================================

DO $$
DECLARE
    target_user_id UUID;
BEGIN
    -- 1. Obter ID do usuário pelo email
    SELECT id INTO target_user_id FROM auth.users WHERE email = 'fernando.pevangelista@gmail.com';

    IF target_user_id IS NOT NULL THEN
        
        -- 2. Remover Avaliações
        DELETE FROM avaliacoes_temporada WHERE usuario_id = target_user_id;

        -- 3. Remover Certificados
        DELETE FROM certificados WHERE usuario_id = target_user_id;

        -- 4. Remover Tentativas de Prova
        DELETE FROM tentativas_prova WHERE usuario_id = target_user_id;

        -- 5. Remover Progresso (Episódios assistidos)
        DELETE FROM progresso_usuario WHERE usuario_id = target_user_id;

        -- 6. Resetar Pontuação do Usuário para 0
        UPDATE usuarios 
        SET pontuacao_total = 0 
        WHERE id = target_user_id;

        RAISE NOTICE 'Limpeza concluída para o usuário %', target_user_id;
    ELSE
        RAISE NOTICE 'Usuário fernando.pevangelista@gmail.com não encontrado.';
    END IF;
END $$;
