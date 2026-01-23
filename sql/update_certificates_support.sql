-- Add Support Material columns to episodes
ALTER TABLE episodios 
ADD COLUMN IF NOT EXISTS material_apoio_url TEXT,
ADD COLUMN IF NOT EXISTS material_apoio_nome TEXT;

-- Add Professional Certificate details
ALTER TABLE certificados 
ADD COLUMN IF NOT EXISTS carga_horaria INTEGER DEFAULT 10, -- Default 10 hours if not calculated
ADD COLUMN IF NOT EXISTS nome_aluno TEXT;

-- Optional: Create bucket for materials if it doesn't exist (This is usually done in UI, but good to note)
-- insert into storage.buckets (id, name, public) values ('materiais', 'materiais', true);
