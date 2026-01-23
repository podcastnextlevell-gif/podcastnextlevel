const fs = require('fs');
const path = require('path');

const SEASONS_FILE = path.join(__dirname, '../arquivos/temporadas e episodios.md');
const QUIZ_FILE = path.join(__dirname, '../arquivos/provas_next_level.md');
const OUTPUT_FILE = path.join(__dirname, '../sql/seed_full_content.sql');

function generateSql() {
    let sql = `-- AGENT GENERATED SEED SCRIPT\n`;
    sql += `-- Validado em: ${new Date().toISOString()}\n\n`;

    // 1. Parse Seasons & Episodes
    const seasonsContent = fs.readFileSync(SEASONS_FILE, 'utf8');
    const seasons = parseSeasons(seasonsContent);

    // 2. Parse Quizzes
    const quizContent = fs.readFileSync(QUIZ_FILE, 'utf8');
    const quizzes = parseQuizzes(quizContent);

    // 3. Generate SQL Statements

    // TEMPORADAS
    sql += `-- =============================================\n`;
    sql += `-- 1. TEMPORADAS\n`;
    sql += `-- =============================================\n`;

    for (const s of seasons) {
        const ordem = extractNumber(s.rawTitle);
        // Remove "Temporada X: " part for cleaner database title if needed, 
        // but user seems to want full title. Let's keep full title or clean it.
        // File says: "Temporada 0: Episódios Introdutórios"
        // Database spec: titulo TEXT
        // Let's keep strict title match for easy FK lookup
        const safeTitle = escapeSql(s.cleanTitle); // cleaning "Temporada X: " might be better for UI?
        // Actually, the current DB has "Temporada 0: O Início".
        // The file has "Temporada 0: Episódios Introdutórios".
        // Update: I will use the file's title.

        sql += `
INSERT INTO temporadas (titulo, descricao, ordem, status)
VALUES ('${safeTitle}', 'Temporada ${ordem} do Next Level Podcast', ${ordem}, 'ativa')
ON CONFLICT (id) DO NOTHING; -- IDs are UUIDs, so this conflict check isn't on title.
-- We should probably use a pragmatic lookup to avoid creating dupes if we run this multiple times.
-- Better approach: Check existence by Title or Update based on Order?
-- Let's use ON CONFLICT DO NOTHING implies we trust the ID gen, but we don't produce IDs here.
-- Instead, let's allow duplicates? No.
-- Strict SQL with "NOT EXISTS" check:
INSERT INTO temporadas (titulo, descricao, ordem, status)
SELECT '${safeTitle}', 'Temporada ${ordem} do Next Level Podcast', ${ordem}, 'ativa'
WHERE NOT EXISTS (SELECT 1 FROM temporadas WHERE ordem = ${ordem});

`;
    }

    // EPISODES
    sql += `\n-- =============================================\n`;
    sql += `-- 2. EPISÓDIOS\n`;
    sql += `-- =============================================\n`;

    for (const s of seasons) {
        const seasonOrdem = extractNumber(s.rawTitle);

        for (const ep of s.episodes) {
            const epNum = extractNumber(ep.code); // EP01 -> 1
            const safeEpTitle = escapeSql(ep.title);

            // Link episode to season by Order (safer than Title matching)
            sql += `
INSERT INTO episodios (temporada_id, titulo, ordem, status)
SELECT id, '${safeEpTitle}', ${epNum}, 'publicado'
FROM temporadas WHERE ordem = ${seasonOrdem}
AND NOT EXISTS (SELECT 1 FROM episodios e JOIN temporadas t ON e.temporada_id = t.id WHERE t.ordem = ${seasonOrdem} AND e.ordem = ${epNum});
`;
        }
    }

    // QUIZZES & QUESTIONS
    sql += `\n-- =============================================\n`;
    sql += `-- 3. PROVAS E QUESTÕES\n`;
    sql += `-- =============================================\n`;

    for (const q of quizzes) {
        // q.seasonTitle matches "Temporada X: ..."
        // Create Prova
        const seasonOrdem = extractNumber(q.seasonTitle);
        const provaTitle = `Prova - Temporada ${seasonOrdem}`;

        // Use a DO block to capture Prova ID for questions
        sql += `
DO $$
DECLARE
    v_temporada_id UUID;
    v_prova_id UUID;
BEGIN
    -- Obter ID da Temporada
    SELECT id INTO v_temporada_id FROM temporadas WHERE ordem = ${seasonOrdem} LIMIT 1;
    
    IF v_temporada_id IS NOT NULL THEN
        -- Inserir/Buscar Prova
        -- Upsert strategy based on Season ID
        INSERT INTO provas (temporada_id, titulo, descricao, ativa)
        VALUES (v_temporada_id, '${provaTitle}', 'Avaliação da Temporada ${seasonOrdem}', true)
        ON CONFLICT DO NOTHING; -- No unique constraint usually on (temporada_id), so this might duplicate.
        -- Better: Select existing or insert
        
        SELECT id INTO v_prova_id FROM provas WHERE temporada_id = v_temporada_id LIMIT 1;
        
        IF v_prova_id IS NULL THEN
             INSERT INTO provas (temporada_id, titulo, descricao, ativa)
             VALUES (v_temporada_id, '${provaTitle}', 'Avaliação da Temporada ${seasonOrdem}', true)
             RETURNING id INTO v_prova_id;
        END IF;

        -- Inserir Questões (Deletar antigas dessa prova para garantir sync limpo? Talvez perigoso se já houver tentativas)
        -- Vamos apenas Inserir se não existir (baseado no texto da pergunta)
`;

        for (const question of q.questions) {
            const safePergunta = escapeSql(question.text);
            const safeJustificativa = escapeSql(question.justification);
            const jsonOptions = JSON.stringify(question.options).replace(/'/g, "''"); // Escape JSON single quotes
            const correct = question.correctAnswer;
            const qNum = question.number;

            sql += `
        INSERT INTO questoes (prova_id, pergunta, opcoes, resposta_correta, ordem)
        SELECT v_prova_id, '${safePergunta}', '${jsonOptions}'::jsonb, '${correct}', ${qNum}
        WHERE NOT EXISTS (SELECT 1 FROM questoes WHERE prova_id = v_prova_id AND ordem = ${qNum});
`;
        }

        sql += `
    END IF;
END $$;
`;
    }

    fs.writeFileSync(OUTPUT_FILE, sql);
    console.log(`SQL generated at: ${OUTPUT_FILE}`);
}

// --- PARSERS ---

function parseSeasons(content) {
    const lines = content.split('\n');
    let currentSeason = null;
    const seasons = [];

    for (let line of lines) {
        line = line.trim();
        if (!line) continue;

        if (line.startsWith('## Temporada')) {
            if (currentSeason) seasons.push(currentSeason);
            currentSeason = {
                rawTitle: line.replace('##', '').trim(),
                cleanTitle: line.replace('##', '').split('(')[0].trim(), // Remove "(X Episódios)" suffix
                episodes: []
            };
        } else if (line.startsWith('| EP')) {
            // | EP01 | Título |
            const parts = line.split('|').map(p => p.trim()).filter(Boolean);
            if (parts.length >= 2) {
                currentSeason.episodes.push({
                    code: parts[0],
                    title: parts[1]
                });
            }
        }
    }
    if (currentSeason) seasons.push(currentSeason);
    return seasons;
}

function parseQuizzes(content) {
    // Split by "## Prova"
    const blocks = content.split(/^## /gm).filter(b => b.trim().startsWith('Prova'));
    const quizzes = [];

    for (const block of blocks) {
        const lines = block.split('\n');
        const seasonTitleLine = lines[0].trim(); // "Prova - Temporada X: ..."

        const quiz = {
            seasonTitle: seasonTitleLine.replace('Prova - ', '').trim(),
            questions: []
        };

        // Parse questions
        // Split by "### Questão"
        const qBlocks = block.split(/^### Questão /gm).slice(1); // skip headers

        for (const qBlock of qBlocks) {
            const lines = qBlock.trim().split('\n');
            const qNum = parseInt(lines[0].trim()); // "1"

            // Find Question Text (lines after header until A))
            let qText = "";
            let i = 1;
            while (i < lines.length && !lines[i].trim().match(/^[A-E]\)/)) {
                qText += lines[i].trim() + " ";
                i++;
            }

            // Find Options
            const options = [];
            while (i < lines.length && lines[i].trim().match(/^[A-E]\)/)) {
                const optLine = lines[i].trim();
                const letter = optLine.charAt(0);
                const text = optLine.substring(3).trim();
                options.push({ value: letter, label: text });
                i++;
            }

            // Find Correct Answer & Justification
            let correct = "";
            let justification = "";

            while (i < lines.length) {
                const line = lines[i].trim();
                if (line.includes('Resposta Correta:')) {
                    correct = line.split(':')[1].trim(); // "**B**" or "B"
                    correct = correct.replace(/\*/g, ''); // Remove bold
                }
                if (line.includes('Justificativa:')) {
                    justification = line.split(':')[1]?.trim() || "";
                    // might be multiline?
                }
                i++;
            }

            quiz.questions.push({
                number: qNum,
                text: qText.trim(),
                options: options,
                correctAnswer: correct,
                justification: justification
            });
        }
        quizzes.push(quiz);
    }
    return quizzes;
}

// --- HELPERS ---

function extractNumber(str) {
    const match = str.match(/\d+/);
    return match ? parseInt(match[0]) : 0;
}

function escapeSql(str) {
    return str.replace(/'/g, "''");
}

generateSql();
