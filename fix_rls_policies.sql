-- =====================================================
-- CORREÇÃO DE POLÍTICAS RLS PARA ACESSO ADMIN
-- Execute este script no SQL Editor do Supabase
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

-- Política para admin inserir episódios
-- Verifica se o usuário autenticado é admin pela tabela usuarios
CREATE POLICY "Allow admin insert on episodios" ON episodios
FOR INSERT WITH CHECK (
    EXISTS (
        SELECT 1 FROM usuarios 
        WHERE usuarios.id = auth.uid() 
        AND usuarios.role = 'admin'
    )
);

-- Política para admin atualizar episódios
CREATE POLICY "Allow admin update on episodios" ON episodios
FOR UPDATE USING (
    EXISTS (
        SELECT 1 FROM usuarios 
        WHERE usuarios.id = auth.uid() 
        AND usuarios.role = 'admin'
    )
);

-- Política para admin deletar episódios
CREATE POLICY "Allow admin delete on episodios" ON episodios
FOR DELETE USING (
    EXISTS (
        SELECT 1 FROM usuarios 
        WHERE usuarios.id = auth.uid() 
        AND usuarios.role = 'admin'
    )
);

-- =====================================================
-- CORREÇÃO PARA TABELA TEMPORADAS (se necessário)
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
    EXISTS (
        SELECT 1 FROM usuarios 
        WHERE usuarios.id = auth.uid() 
        AND usuarios.role = 'admin'
    )
);

CREATE POLICY "Allow admin update on temporadas" ON temporadas
FOR UPDATE USING (
    EXISTS (
        SELECT 1 FROM usuarios 
        WHERE usuarios.id = auth.uid() 
        AND usuarios.role = 'admin'
    )
);

CREATE POLICY "Allow admin delete on temporadas" ON temporadas
FOR DELETE USING (
    EXISTS (
        SELECT 1 FROM usuarios 
        WHERE usuarios.id = auth.uid() 
        AND usuarios.role = 'admin'
    )
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
    EXISTS (
        SELECT 1 FROM usuarios 
        WHERE usuarios.id = auth.uid() 
        AND usuarios.role = 'admin'
    )
);

CREATE POLICY "Allow admin update on provas" ON provas
FOR UPDATE USING (
    EXISTS (
        SELECT 1 FROM usuarios 
        WHERE usuarios.id = auth.uid() 
        AND usuarios.role = 'admin'
    )
);

CREATE POLICY "Allow admin delete on provas" ON provas
FOR DELETE USING (
    EXISTS (
        SELECT 1 FROM usuarios 
        WHERE usuarios.id = auth.uid() 
        AND usuarios.role = 'admin'
    )
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
    EXISTS (
        SELECT 1 FROM usuarios 
        WHERE usuarios.id = auth.uid() 
        AND usuarios.role = 'admin'
    )
);

CREATE POLICY "Allow admin update on questoes" ON questoes
FOR UPDATE USING (
    EXISTS (
        SELECT 1 FROM usuarios 
        WHERE usuarios.id = auth.uid() 
        AND usuarios.role = 'admin'
    )
);

CREATE POLICY "Allow admin delete on questoes" ON questoes
FOR DELETE USING (
    EXISTS (
        SELECT 1 FROM usuarios 
        WHERE usuarios.id = auth.uid() 
        AND usuarios.role = 'admin'
    )
);

-- =====================================================
-- CORREÇÃO PARA TABELA CERTIFICADOS (inserção pelo usuário)
-- =====================================================
DROP POLICY IF EXISTS "Allow user insert on certificados" ON certificados;
DROP POLICY IF EXISTS "Allow user read own certificados" ON certificados;
DROP POLICY IF EXISTS "Allow admin read all certificados" ON certificados;

ALTER TABLE certificados ENABLE ROW LEVEL SECURITY;

-- Usuários podem inserir seus próprios certificados
CREATE POLICY "Allow user insert on certificados" ON certificados
FOR INSERT WITH CHECK (auth.uid() = usuario_id);

-- Usuários podem ler seus próprios certificados
CREATE POLICY "Allow user read own certificados" ON certificados
FOR SELECT USING (auth.uid() = usuario_id);

-- Admins podem ler todos os certificados
CREATE POLICY "Allow admin read all certificados" ON certificados
FOR SELECT USING (
    EXISTS (
        SELECT 1 FROM usuarios 
        WHERE usuarios.id = auth.uid() 
        AND usuarios.role = 'admin'
    )
);

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
FOR SELECT USING (auth.uid() = usuario_id);

-- Admins podem ler todas as tentativas
CREATE POLICY "Allow admin read all tentativas" ON tentativas_prova
FOR SELECT USING (
    EXISTS (
        SELECT 1 FROM usuarios 
        WHERE usuarios.id = auth.uid() 
        AND usuarios.role = 'admin'
    )
);

-- =====================================================
-- CORREÇÃO PARA TABELA USUARIOS
-- =====================================================
DROP POLICY IF EXISTS "Allow update own user" ON usuarios;

-- Permitir que usuários atualizem seus próprios dados (incluindo pontuação)
CREATE POLICY "Allow update own user" ON usuarios
FOR UPDATE USING (auth.uid() = id);

-- =====================================================
-- FUNÇÃO RPC PARA INCREMENTAR PONTUAÇÃO (caso não exista)
-- =====================================================
CREATE OR REPLACE FUNCTION increment_pontuacao(user_id UUID, pontos INTEGER)
RETURNS VOID AS $$
BEGIN
    UPDATE usuarios 
    SET pontuacao_total = COALESCE(pontuacao_total, 0) + pontos
    WHERE id = user_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
