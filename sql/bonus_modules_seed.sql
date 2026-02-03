-- ============================================
-- 📚 SEED: Popular modulos_bonus com os 28 módulos
-- Execute DEPOIS do bonus_modules_schema.sql
-- ============================================

INSERT INTO modulos_bonus (codigo, nome, descricao, temporada, episodio_prerequisito, tecnologias, pontos_facil, pontos_intermediario, pontos_dificil, publicado) VALUES

-- T0: INTRO
('EP00A_ROI', 'Calculadora de ROI de Carreira', 'Ferramenta interativa para calcular o retorno sobre investimento da mudança de carreira de atendente para analista de qualidade. Inclui gráficos dinâmicos e projeção de ganhos.', 0, 'EP00A', ARRAY['HTML', 'CSS', 'JavaScript', 'Chart.js'], 5, 10, 20, TRUE),
('EP00B_ROADMAP', 'Construtor de Roadmap de Estudos', 'Monte seu próprio plano de estudos personalizado arrastando competências (SQL, Python, Power BI) em uma linha do tempo de 6 meses. Sistema oferece feedback sobre carga de estudos.', 0, 'EP00B', ARRAY['HTML', 'CSS', 'JavaScript', 'SortableJS'], 5, 10, 20, TRUE),

-- T1: CX AVANÇADO
('EP01_JORNADA', 'Simulador de Mapeamento de Jornada', 'Simule a jornada de um cliente em e-commerce. Clique em touchpoints e veja métricas de CES e NPS mudarem dinamicamente. Entenda o impacto de cada ponto de contato.', 1, 'EP01', ARRAY['HTML', 'CSS', 'JavaScript'], 5, 10, 20, TRUE),
('EP02_VOC', 'Analisador de Sentimento de Feedback', 'Cole feedbacks de clientes e veja a análise de sentimento em tempo real. Modelo de NLP classifica como positivo, negativo ou neutro e destaca palavras-chave.', 1, 'EP02', ARRAY['HTML', 'CSS', 'JavaScript', 'Python', 'NLTK'], 5, 10, 20, TRUE),
('EP03_METRICAS', 'Dashboard de Métricas de CX', 'Dashboard interativo de métricas de CX. Selecione métricas para otimizar e veja impacto visual. Sistema simula troca entre diferentes KPIs do call center.', 1, 'EP03', ARRAY['HTML', 'CSS', 'JavaScript', 'Chart.js'], 5, 10, 20, TRUE),
('EP04_OMNI', 'Simulador de Handoff Omnichannel', 'Experimente transferir cliente entre canais (chat, voz, email). Veja como preservar contexto e evitar re-explicação. Simulação de CES em tempo real após handoff.', 1, 'EP04', ARRAY['HTML', 'CSS', 'JavaScript'], 5, 10, 20, TRUE),
('EP05_EMOCAO', 'Construtor de Script com Pico-Fim', 'Monte script de atendimento seguindo teoria Pico-Fim. Arraste blocos de diálogo e veja feedback sobre sequenciamento emocional. Sistema sugere melhores práticas.', 1, 'EP05', ARRAY['HTML', 'CSS', 'JavaScript', 'SortableJS'], 5, 10, 20, TRUE),
('EP06_PREDITIVO', 'Dashboard de Alerta de Churn', 'Identifique clientes em risco de churn. Lista de clientes com score preditivo. Clique para ações recomendadas (desconto, ligação, email). Treino básico do conceito.', 1, 'EP06', ARRAY['HTML', 'CSS', 'JavaScript', 'Python'], 5, 10, 20, TRUE),

-- T2: IA APLICADA
('EP07_CHATBOT', 'Simulador de Chatbot com Intents', 'Interaja com chatbot baseado em intents (dúvida, reclamação, agradecimento). Sistema mostra qual intent foi detectado e como IA respondeu. Quiz de melhores práticas.', 2, 'EP07', ARRAY['HTML', 'CSS', 'JavaScript', 'Python'], 5, 10, 20, TRUE),
('EP08_ML_CHURN', 'Previsor de Churn com ML', 'Insira dados de cliente (última compra, tickets, NPS). Modelo de ML prevê probabilidade de churn. Interface mostra features mais importantes para previsão.', 2, 'EP08', ARRAY['HTML', 'CSS', 'JavaScript', 'Python', 'Scikit-learn'], 5, 10, 20, TRUE),
('EP09_RECOMENDADOR', 'Sistema de Recomendação de Produtos', 'Like/dislike em produtos simulados. Sistema aprende suas preferências e recomenda novos produtos usando algoritmo colaborativo. UX tipo Tinder.', 2, 'EP09', ARRAY['HTML', 'CSS', 'JavaScript', 'Python'], 5, 10, 20, TRUE),

-- T3: DATA-DRIVEN
('EP10_SQL', 'Editor SQL Interativo para Call Center', 'Editor SQL web com banco de dados simulado de call center. Escreva queries e veja resultados em tempo real. Aprenda SELECT, JOIN, GROUP BY na prática.', 3, 'EP10', ARRAY['HTML', 'CSS', 'JavaScript', 'Python', 'SQLite'], 5, 10, 20, TRUE),
('EP11_ESTATISTICA', 'Calculadora Estatística de Teste A/B', 'Insira resultados de Teste A/B e calcule significância estatística. Sistema mostra se a diferença é relevante, intervalo de confiança e poder estatístico.', 3, 'EP11', ARRAY['HTML', 'CSS', 'JavaScript', 'Python', 'SciPy'], 5, 10, 20, TRUE),
('EP12_DASHBOARD', 'Construtor de Dashboard Interativo', 'Carregue CSV e arraste tipos de gráficos (barras, linhas, pizza) para construir dashboard. Visualização dinâmica com filtros e exportação em PDF.', 3, 'EP12', ARRAY['HTML', 'CSS', 'JavaScript', 'Chart.js'], 5, 10, 20, TRUE),

-- T4: PYTHON
('EP13_RELATORIOS', 'Gerador de Relatórios Automatizado', 'Configure parâmetros de relatório (período, métricas). Script Python gera PDF ou Excel automaticamente e disponibiliza para download.', 4, 'EP13', ARRAY['HTML', 'CSS', 'JavaScript', 'Python', 'ReportLab'], 5, 10, 20, TRUE),
('EP14_SCRAPING', 'Coletor de Reviews de Clientes', 'Insira URL de produto e faça web scraping para coletar reviews. Sistema exibe lista de avaliações com análise de sentimento agregada.', 4, 'EP14', ARRAY['HTML', 'CSS', 'JavaScript', 'Python', 'BeautifulSoup'], 5, 10, 20, TRUE),
('EP15_NLP', 'Analisador de Transcrições de Chamadas', 'Cole transcrição de chamada e NLP identifica entidades (nomes, produtos), extrai tópicos principais e calcula sentimento da conversa.', 4, 'EP15', ARRAY['HTML', 'CSS', 'JavaScript', 'Python', 'spaCy'], 5, 10, 20, TRUE),

-- T5: SOFT SKILLS
('EP16_COMUNICACAO', 'Simulador de Diálogo com Feedback', 'Interaja com cliente virtual em cenário de atendimento. Receba feedback sobre comunicação (tom, clareza, empatia) e sugestões de melhoria.', 5, 'EP16', ARRAY['HTML', 'CSS', 'JavaScript', 'Python', 'NLTK'], 5, 10, 20, TRUE),
('EP17_LIDERANCA', 'Dashboard de Performance de Equipe', 'Dashboard simulado de equipe de qualidade. Ajuste variáveis (treinamento, motivação, ferramentas) e veja impacto em FCR, NPS e TMA.', 5, 'EP17', ARRAY['HTML', 'CSS', 'JavaScript', 'Chart.js'], 5, 10, 20, TRUE),
('EP18_NEGOCIACAO', 'Simulador de Negociação com Cliente Irritado', 'Role-playing onde você resolve conflito com cliente virtual irritado. Escolhas de diálogo afetam desfecho da negociação e satisfação do cliente.', 5, 'EP18', ARRAY['HTML', 'CSS', 'JavaScript', 'Python'], 5, 10, 20, TRUE),

-- T6: FERRAMENTAS
('EP19_POWERBI', 'Visualizador de Dados de CX Interativo', 'Simule dashboard de Power BI/Tableau. Carregue CSV de CX e explore visualizações (barras, linhas, mapas de calor) com filtros dinâmicos.', 6, 'EP19', ARRAY['HTML', 'CSS', 'JavaScript', 'Plotly.js'], 5, 10, 20, TRUE),
('EP20_NOCODE', 'Construtor de Fluxo de Automação Visual', 'Arraste e solte blocos para construir fluxo de automação (ex: "se NPS < 7, enviar email"). Sistema simula execução e mostra resultados.', 6, 'EP20', ARRAY['HTML', 'CSS', 'JavaScript', 'React Flow'], 5, 10, 20, TRUE),
('EP21_API', 'Simulador de Integração de Sistemas', 'Simule integração de CRM, telefonia e chat via APIs. Envie requisições e veja como dados são trocados entre sistemas.', 6, 'EP21', ARRAY['HTML', 'CSS', 'JavaScript', 'Python', 'Flask'], 5, 10, 20, TRUE),

-- T7: PROJETOS
('EP22_PROJETO_CHURN', 'Projeto: Sistema de Alerta de Churn', 'Projeto completo de sistema de alerta de churn. Frontend para visualização de clientes em risco e backend Python com modelo de ML.', 7, 'EP22', ARRAY['HTML', 'CSS', 'JavaScript', 'Python', 'Flask', 'Scikit-learn'], 5, 10, 20, TRUE),
('EP23_PROJETO_DASHBOARD', 'Projeto: Dashboard Executivo 360º', 'Desenvolva dashboard executivo completo para CX. Integre métricas de múltiplas fontes (NPS, FCR, LTV) com visão holística de performance.', 7, 'EP23', ARRAY['HTML', 'CSS', 'JavaScript', 'Python', 'D3.js'], 5, 10, 20, TRUE),
('EP24_PROJETO_FEEDBACK', 'Projeto: Automação de Feedback com IA', 'Sistema completo que coleta feedback via web, processa com IA (sentimento, categorização) e dispara ações automatizadas.', 7, 'EP24', ARRAY['HTML', 'CSS', 'JavaScript', 'Python', 'spaCy'], 5, 10, 20, TRUE),

-- T8: FUTURO
('EP25_METAVERSO', 'Explorador de Loja Virtual no Metaverso', 'Interface web 3D simulando loja virtual no metaverso. Navegue pelo ambiente e interaja com avatares de atendimento. CX imersivo.', 8, 'EP25', ARRAY['HTML', 'CSS', 'JavaScript', 'Three.js'], 5, 10, 20, TRUE),
('EP26_RA', 'Assistente de RA para Suporte Técnico', 'Aplicação web que simula assistente de Realidade Aumentada. Aponte câmera para objeto e veja informações úteis e guias de solução sobrepostos.', 8, 'EP26', ARRAY['HTML', 'CSS', 'JavaScript', 'AR.js'], 5, 10, 20, TRUE)

ON CONFLICT (codigo) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = EXCLUDED.descricao,
    temporada = EXCLUDED.temporada,
    episodio_prerequisito = EXCLUDED.episodio_prerequisito,
    tecnologias = EXCLUDED.tecnologias,
    pontos_facil = EXCLUDED.pontos_facil,
    pontos_intermediario = EXCLUDED.pontos_intermediario,
    pontos_dificil = EXCLUDED.pontos_dificil,
    updated_at = NOW();

-- ============================================
-- ✅ PRONTO! 28 módulos inseridos/atualizados
-- ============================================
