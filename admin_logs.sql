-- =====================================================
-- SISTEMA DE AUDITORIA E LOGS + FUNÇÕES ADMIN
-- Execute este script no SQL Editor do Supabase
-- =====================================================

-- 1. Tabela de Logs de Auditoria
CREATE TABLE IF NOT EXISTS audit_logs (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID REFERENCES auth.users(id),
    action TEXT NOT NULL,          -- Ex: 'LOGIN', 'PROVA_SUBMIT', 'RESET_USER'
    details JSONB DEFAULT '{}',    -- Detalhes extras em JSON
    ip_address TEXT,               -- Opcional, se disponível
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- RLS: Habilitar segurança
ALTER TABLE audit_logs ENABLE ROW LEVEL SECURITY;

-- Política: Usuários podem inserir seus próprios logs (ex: navegação)
CREATE POLICY "Users can insert own logs" ON audit_logs
FOR INSERT WITH CHECK (auth.uid() = user_id);

-- Política: Apenas Admin pode ver todos os logs
-- (Usando email fixo por enquanto, ou is_admin se disponível/confiável)
CREATE POLICY "Admin can view all logs" ON audit_logs
FOR SELECT USING (
    auth.jwt() ->> 'email' = 'podcastnextlevell@gmail.com'
);


-- 2. Função RPC para Resetar Usuário (Admin Action)
-- Esta função permite que o Admin zere o progresso de QUALQUER usuário pelo ID
CREATE OR REPLACE FUNCTION admin_reset_user(target_user_id UUID)
RETURNS VOID AS $$
BEGIN
    -- Verifica se quem chama é admin (camada extra de segurança)
    IF (auth.jwt() ->> 'email' <> 'podcastnextlevell@gmail.com') THEN
        RAISE EXCEPTION 'Acesso negado. Apenas administradores podem executar esta ação.';
    END IF;

    -- Executa a limpeza
    DELETE FROM progresso_usuario WHERE usuario_id = target_user_id;
    DELETE FROM tentativas_prova WHERE usuario_id = target_user_id;
    DELETE FROM certificados WHERE usuario_id = target_user_id;
    DELETE FROM avaliacoes_temporada WHERE usuario_id = target_user_id;
    
    UPDATE usuarios 
    SET pontuacao_total = 0 
    WHERE id = target_user_id;

    -- Registra o log da ação
    INSERT INTO audit_logs (user_id, action, details)
    VALUES (auth.uid(), 'ADMIN_RESET_USER', jsonb_build_object('target_id', target_user_id));
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
