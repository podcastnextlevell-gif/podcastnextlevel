-- Tabela de Avaliações
CREATE TABLE IF NOT EXISTS avaliacoes_temporada (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    usuario_id UUID REFERENCES usuarios(id) NOT NULL,
    temporada_id UUID REFERENCES temporadas(id) NOT NULL,
    nota INTEGER CHECK (nota >= 1 AND nota <= 5),
    comentario TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Habilitar RLS (Segurança)
ALTER TABLE avaliacoes_temporada ENABLE ROW LEVEL SECURITY;

-- Políticas de Acesso

-- 1. Usuários podem criar suas próprias avaliações
CREATE POLICY "Usuários podem criar avaliações" 
ON avaliacoes_temporada FOR INSERT 
TO authenticated 
WITH CHECK (auth.uid() = usuario_id);

-- 2. Apenas Admins podem ver todas as avaliações
CREATE POLICY "Admins podem ver avaliações" 
ON avaliacoes_temporada FOR SELECT 
TO authenticated 
USING (
    EXISTS (
        SELECT 1 FROM usuarios 
        WHERE id = auth.uid() 
        AND is_admin = true
    )
);

-- (Opcional) Usuário pode ver suas próprias avaliações (se quiser mostrar histórico futuro)
CREATE POLICY "Usuários podem ver suas próprias avaliações" 
ON avaliacoes_temporada FOR SELECT 
TO authenticated 
USING (auth.uid() = usuario_id);
