-- ============================================
-- 🔗 POPULAR template_id nos episódios
-- ============================================
-- Este script popula o campo template_id dos episódios
-- com os códigos de pré-requisito usados pelos módulos bônus.
--
-- COMO FUNCIONA:
-- Os episódios são identificados pela sua ORDEM dentro de cada temporada.
-- Temporada 0 tem episódios EP00A (ordem 0) e EP00B (ordem 1).
-- Temporadas 1-8 usam formato EP01, EP02, ..., EP26.
--
-- EXECUTE NO SQL EDITOR DO SUPABASE:
-- https://supabase.com/dashboard/project/dnmeeirmjljmvbwcsdpx/sql
-- ============================================

-- Temporada 0 — dois episódios introdutórios
-- EP00A = primeiro episódio da T0 (ordem 0)
UPDATE episodios SET template_id = 'EP00A'
WHERE temporada_id = (SELECT id FROM temporadas WHERE ordem = 0 LIMIT 1)
AND ordem = 0;

-- EP00B = segundo episódio da T0 (ordem 1)
UPDATE episodios SET template_id = 'EP00B'
WHERE temporada_id = (SELECT id FROM temporadas WHERE ordem = 0 LIMIT 1)
AND ordem = 1;

-- ============================================
-- Temporadas 1-8: numeração sequencial EP01 a EP26
-- ============================================
-- T1: EP01 a EP03 (3 episódios, índice base = 1)
-- T2: EP04 a EP06 (3 episódios, índice base = 4)
-- T3: EP07 a EP09 (3 episódios, índice base = 7)
-- T4: EP10 a EP12 (3 episódios, índice base = 10)
-- T5: EP13 a EP15 (3 episódios, índice base = 13)
-- T6: EP16 a EP18 (3 episódios, índice base = 16)
-- T7: EP19 a EP21 (3 episódios, índice base = 19)
-- T8: EP22 a EP26 (5 episódios, índice base = 22)

-- Cria função temporária para popular template_ids
DO $$
DECLARE
    temp_rec RECORD;
    ep_rec RECORD;
    ep_counter INT;
    base_num INT;
    ep_code TEXT;
BEGIN
    -- Mapeamento: ordem da temporada → número base do episódio
    -- T1=1, T2=4, T3=7, T4=10, T5=13, T6=16, T7=19, T8=22
    
    FOR temp_rec IN 
        SELECT id, ordem FROM temporadas WHERE ordem >= 1 ORDER BY ordem
    LOOP
        -- Calcular número base: T1→1, T2→4, T3→7, etc.
        CASE temp_rec.ordem
            WHEN 1 THEN base_num := 1;
            WHEN 2 THEN base_num := 4;
            WHEN 3 THEN base_num := 7;
            WHEN 4 THEN base_num := 10;
            WHEN 5 THEN base_num := 13;
            WHEN 6 THEN base_num := 16;
            WHEN 7 THEN base_num := 19;
            WHEN 8 THEN base_num := 22;
            ELSE base_num := NULL;
        END CASE;
        
        IF base_num IS NOT NULL THEN
            ep_counter := 0;
            FOR ep_rec IN 
                SELECT id FROM episodios 
                WHERE temporada_id = temp_rec.id 
                ORDER BY ordem
            LOOP
                -- Formatar: EP01, EP02, ..., EP26
                ep_code := 'EP' || LPAD((base_num + ep_counter)::TEXT, 2, '0');
                
                UPDATE episodios SET template_id = ep_code WHERE id = ep_rec.id;
                
                RAISE NOTICE 'T% episódio % → %', temp_rec.ordem, ep_counter, ep_code;
                ep_counter := ep_counter + 1;
            END LOOP;
        END IF;
    END LOOP;
END $$;

-- ============================================
-- VERIFICAÇÃO: Listar todos os template_ids populados
-- ============================================
SELECT 
    e.template_id,
    e.titulo,
    e.ordem AS ep_ordem,
    t.titulo AS temporada,
    t.ordem AS temp_ordem
FROM episodios e
JOIN temporadas t ON e.temporada_id = t.id
WHERE e.template_id IS NOT NULL
ORDER BY t.ordem, e.ordem;

SELECT '✅ template_id populado com sucesso!' AS status;
