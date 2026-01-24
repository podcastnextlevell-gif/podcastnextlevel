-- =====================================================
-- SCRIPT DE DEBUG E LIMPEZA FORÇADA (V2)
-- Execute este script no SQL Editor do Supabase
-- =====================================================

DO $$
DECLARE
    target_user_id UUID;
    count_progresso INTEGER;
    user_email TEXT := 'fernando.pevangelista@gmail.com';
BEGIN
    -- 1. Buscar ID do usuário (Ignorando maiúsculas/minúsculas)
    SELECT id INTO target_user_id 
    FROM auth.users 
    WHERE email ILIKE user_email
    LIMIT 1;

    IF target_user_id IS NOT NULL THEN
        RAISE NOTICE 'Usuário encontrado: % (ID: %)', user_email, target_user_id;

        -- 2. Verificar e Deletar Progresso
        SELECT count(*) INTO count_progresso FROM progresso_usuario WHERE usuario_id = target_user_id;
        RAISE NOTICE 'Registros de progresso encontrados antes do delete: %', count_progresso;
        
        DELETE FROM progresso_usuario WHERE usuario_id = target_user_id;
        
        SELECT count(*) INTO count_progresso FROM progresso_usuario WHERE usuario_id = target_user_id;
        RAISE NOTICE 'Registros de progresso após delete: %', count_progresso;

        -- 3. Verificar e Deletar Tentativas
        DELETE FROM tentativas_prova WHERE usuario_id = target_user_id;

        -- 4. Verificar e Deletar Certificados
        DELETE FROM certificados WHERE usuario_id = target_user_id;

        -- 5. Verificar e Deletar Avaliações
        DELETE FROM avaliacoes_temporada WHERE usuario_id = target_user_id;

        -- 6. Resetar Pontuação
        UPDATE usuarios SET pontuacao_total = 0 WHERE id = target_user_id;
        
        RAISE NOTICE ' LIMPEZA CONCLUÍDA COM SUCESSO! ';
    ELSE
        RAISE NOTICE ' ERRO: Usuário % não encontrado no banco de dados auth.users.', user_email;
        -- Listar emails parecidos para debug
        FOR user_email IN SELECT email FROM auth.users WHERE email ILIKE '%fernando%' LOOP
            RAISE NOTICE 'Sugestão encontrada: %', user_email;
        END LOOP;
    END IF;
END $$;
