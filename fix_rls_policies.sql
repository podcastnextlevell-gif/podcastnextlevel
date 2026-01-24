-- =====================================================
-- CORREÇÃO DE POLÍTICAS RLS PARA ACESSO ADMIN
-- Execute este script no SQL Editor do Supabase
-- Admin identificado pelo email: podcastnextlevell@gmail.com
-- =====================================================

-- Drop políticas antigas se existirem
DROP POLICY IF EXISTS "Allow admin insert on episodios" ON episodios;
DROP POLICY IF EXISTS "Allow admin update on episodios" ON episodios;
DROP POLICY IF EXISTS "Allow admin delete on episodios" ON episodios;
DROP POLICY IF EXISTS "Allow public read on episodios" ON episodios;

-- Habilitar RLS na tabela episodios (caso não esteja)
ALTER TABLE episodios ENABLE ROW LEVEL SECURITY;

-- Política para leitura pública de episodios
CREATE POLICY "Allow public read on episodios" ON episodios
FOR SELECT USING (true);

-- Política para admin inserir episódios (usando email)
CREATE POLICY "Allow admin insert on episodios" ON episodios
FOR INSERT WITH CHECK (
    auth.jwt() ->> 'email' = 'podcastnextlevell@gmail.com'
);

-- Política para admin atualizar episódios
CREATE POLICY "Allow admin update on episodios" ON episodios
FOR UPDATE USING (
    auth.jwt() ->> 'email' = 'podcastnextlevell@gmail.com'
);

-- Política para admin deletar episódios
CREATE POLICY "Allow admin delete on episodios" ON episodios
FOR DELETE USING (
    auth.jwt() ->> 'email' = 'podcastnextlevell@gmail.com'
);

-- =====================================================
-- CORREÇÃO PARA TABELA TEMPORADAS
-- =====================================================
DROP POLICY IF EXISTS "Allow admin insert on temporadas" ON temporadas;
DROP POLICY IF EXISTS "Allow admin update on temporadas" ON temporadas;
DROP POLICY IF EXISTS "Allow admin delete on temporadas" ON temporadas;
DROP POLICY IF EXISTS "Allow public read on temporadas" ON temporadas;

ALTER TABLE temporadas ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public read on temporadas" ON temporadas
FOR SELECT USING (true);

CREATE POLICY "Allow admin insert on temporadas" ON temporadas
FOR INSERT WITH CHECK (
    auth.jwt() ->> 'email' = 'podcastnextlevell@gmail.com'
);

CREATE POLICY "Allow admin update on temporadas" ON temporadas
FOR UPDATE USING (
    auth.jwt() ->> 'email' = 'podcastnextlevell@gmail.com'
);

CREATE POLICY "Allow admin delete on temporadas" ON temporadas
FOR DELETE USING (
    auth.jwt() ->> 'email' = 'podcastnextlevell@gmail.com'
);

-- =====================================================
-- CORREÇÃO PARA TABELA PROVAS
-- =====================================================
DROP POLICY IF EXISTS "Allow admin insert on provas" ON provas;
DROP POLICY IF EXISTS "Allow admin update on provas" ON provas;
DROP POLICY IF EXISTS "Allow admin delete on provas" ON provas;
DROP POLICY IF EXISTS "Allow public read on provas" ON provas;

ALTER TABLE provas ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public read on provas" ON provas
FOR SELECT USING (true);

CREATE POLICY "Allow admin insert on provas" ON provas
FOR INSERT WITH CHECK (
    auth.jwt() ->> 'email' = 'podcastnextlevell@gmail.com'
);

CREATE POLICY "Allow admin update on provas" ON provas
FOR UPDATE USING (
    auth.jwt() ->> 'email' = 'podcastnextlevell@gmail.com'
);

CREATE POLICY "Allow admin delete on provas" ON provas
FOR DELETE USING (
    auth.jwt() ->> 'email' = 'podcastnextlevell@gmail.com'
);

-- =====================================================
-- CORREÇÃO PARA TABELA QUESTOES
-- =====================================================
DROP POLICY IF EXISTS "Allow admin insert on questoes" ON questoes;
DROP POLICY IF EXISTS "Allow admin update on questoes" ON questoes;
DROP POLICY IF EXISTS "Allow admin delete on questoes" ON questoes;
DROP POLICY IF EXISTS "Allow public read on questoes" ON questoes;

ALTER TABLE questoes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public read on questoes" ON questoes
FOR SELECT USING (true);

CREATE POLICY "Allow admin insert on questoes" ON questoes
FOR INSERT WITH CHECK (
    auth.jwt() ->> 'email' = 'podcastnextlevell@gmail.com'
);

CREATE POLICY "Allow admin update on questoes" ON questoes
FOR UPDATE USING (
    auth.jwt() ->> 'email' = 'podcastnextlevell@gmail.com'
);

CREATE POLICY "Allow admin delete on questoes" ON questoes
FOR DELETE USING (
    auth.jwt() ->> 'email' = 'podcastnextlevell@gmail.com'
);

-- =====================================================
-- CORREÇÃO PARA TABELA CERTIFICADOS
-- =====================================================
DROP POLICY IF EXISTS "Allow user insert on certificados" ON certificados;
DROP POLICY IF EXISTS "Allow user read own certificados" ON certificados;
DROP POLICY IF EXISTS "Allow admin read all certificados" ON certificados;
DROP POLICY IF EXISTS "Allow public read certificados" ON certificados;

ALTER TABLE certificados ENABLE ROW LEVEL SECURITY;

-- Qualquer usuário autenticado pode inserir certificado (para si mesmo)
CREATE POLICY "Allow user insert on certificados" ON certificados
FOR INSERT WITH CHECK (auth.uid() = usuario_id);

-- Leitura pública para certificados (para validação)
CREATE POLICY "Allow public read certificados" ON certificados
FOR SELECT USING (true);

-- =====================================================
-- CORREÇÃO PARA TABELA TENTATIVAS_PROVA
-- =====================================================
DROP POLICY IF EXISTS "Allow user insert on tentativas_prova" ON tentativas_prova;
DROP POLICY IF EXISTS "Allow user read own tentativas" ON tentativas_prova;
DROP POLICY IF EXISTS "Allow admin read all tentativas" ON tentativas_prova;

ALTER TABLE tentativas_prova ENABLE ROW LEVEL SECURITY;

-- Usuários podem inserir suas próprias tentativas
CREATE POLICY "Allow user insert on tentativas_prova" ON tentativas_prova
FOR INSERT WITH CHECK (auth.uid() = usuario_id);

-- Usuários podem ler suas próprias tentativas
CREATE POLICY "Allow user read own tentativas" ON tentativas_prova
FOR SELECT USING (auth.uid() = usuario_id OR auth.jwt() ->> 'email' = 'podcastnextlevell@gmail.com');

-- =====================================================
-- CORREÇÃO PARA TABELA USUARIOS
-- =====================================================
DROP POLICY IF EXISTS "Allow update own user" ON usuarios;
DROP POLICY IF EXISTS "Allow read usuarios" ON usuarios;

ALTER TABLE usuarios ENABLE ROW LEVEL SECURITY;

-- Leitura pública (para ranking e perfis)
CREATE POLICY "Allow read usuarios" ON usuarios
FOR SELECT USING (true);

-- Permitir que usuários atualizem seus próprios dados (incluindo pontuação)
CREATE POLICY "Allow update own user" ON usuarios
FOR UPDATE USING (auth.uid() = id);

-- =====================================================
-- CORREÇÃO PARA TABELA PROGRESSO_USUARIO
-- =====================================================
DROP POLICY IF EXISTS "Allow user manage progresso" ON progresso_usuario;
DROP POLICY IF EXISTS "Allow user read progresso" ON progresso_usuario;

ALTER TABLE progresso_usuario ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow user manage progresso" ON progresso_usuario
FOR INSERT WITH CHECK (auth.uid() = usuario_id);

CREATE POLICY "Allow user read progresso" ON progresso_usuario
FOR SELECT USING (auth.uid() = usuario_id OR auth.jwt() ->> 'email' = 'podcastnextlevell@gmail.com');

-- =====================================================
-- CORREÇÃO PARA TABELA AVALIACOES_TEMPORADA
-- =====================================================
DROP POLICY IF EXISTS "Allow user insert avaliacao" ON avaliacoes_temporada;
DROP POLICY IF EXISTS "Allow admin read avaliacoes" ON avaliacoes_temporada;

ALTER TABLE avaliacoes_temporada ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow user insert avaliacao" ON avaliacoes_temporada
FOR INSERT WITH CHECK (auth.uid() = usuario_id);

CREATE POLICY "Allow admin read avaliacoes" ON avaliacoes_temporada
FOR SELECT USING (auth.jwt() ->> 'email' = 'podcastnextlevell@gmail.com');

-- =====================================================
-- FUNÇÃO RPC PARA INCREMENTAR PONTUAÇÃO
-- =====================================================
CREATE OR REPLACE FUNCTION increment_pontuacao(user_id UUID, pontos INTEGER)
RETURNS VOID AS $$
BEGIN
    UPDATE usuarios 
    SET pontuacao_total = COALESCE(pontuacao_total, 0) + pontos
    WHERE id = user_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
