// Módulos Bônus - Dados dos 28 módulos práticos
// Baseado no guia de módulos práticos T0-T8

window.BONUS_MODULES = [
    // TEMPORADA 0: Episódios Introdutórios
    {
        id: 1,
        codigo: 'EP00A_ROI',
        nome: 'Calculadora de ROI de Carreira',
        descricao: 'Ferramenta interativa para calcular o retorno sobre investimento da mudança de carreira de atendente para analista de qualidade. Inclui gráficos dinâmicos e projeção de ganhos.',
        temporada: 0,
        episodio_prerequisito: 'EP00A',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Chart.js'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 2,
        codigo: 'EP00B_ROADMAP',
        nome: 'Construtor de Roadmap de Estudos',
        descricao: 'Monte seu próprio plano de estudos personalizado arrastando competências (SQL, Python, Power BI) em uma linha do tempo de 6 meses. Sistema oferece feedback sobre carga de estudos.',
        temporada: 0,
        episodio_prerequisito: 'EP00B',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'SortableJS'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },

    // TEMPORADA 1: CX Avançado
    {
        id: 3,
        codigo: 'EP01_JORNADA',
        nome: 'Simulador de Mapeamento de Jornada',
        descricao: 'Simule a jornada de um cliente em e-commerce. Clique em touchpoints e veja métricas de CES e NPS mudarem dinamicamente. Entenda o impacto de cada ponto de contato.',
        temporada: 1,
        episodio_prerequisito: 'EP01',
        tecnologias: ['HTML', 'CSS', 'JavaScript'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 4,
        codigo: 'EP02_VOC',
        nome: 'Analisador de Sentimento de Feedback',
        descricao: 'Cole feedbacks de clientes e veja a análise de sentimento em tempo real. Modelo de NLP classifica como positivo, negativo ou neutro e destaca palavras-chave.',
        temporada: 1,
        episodio_prerequisito: 'EP02',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Python', 'NLTK'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 5,
        codigo: 'EP03_METRICAS',
        nome: 'Dashboard de Correlação de Métricas',
        descricao: 'Dashboard interativo onde você ajusta sliders de métricas operacionais (TMA, FCR) e vê o impacto em métricas financeiras (LTV, Churn). Visualização gráfica de correlações.',
        temporada: 1,
        episodio_prerequisito: 'EP03',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Plotly.js'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 6,
        codigo: 'EP04_OMNI',
        nome: 'Simulador de Handoff de Atendimento',
        descricao: 'Simulação de CRM onde cliente inicia no chat e é transferido para telefone. Veja a diferença entre experiência quebrada e integrada com histórico completo.',
        temporada: 1,
        episodio_prerequisito: 'EP04',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Python', 'SQLite'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 7,
        codigo: 'EP05_EMOCAO',
        nome: 'Construtor de Script com Pico-Fim',
        descricao: 'Monte um script de atendimento arrastando blocos de diálogo. Sistema avalia com base no princípio de Pico-Fim e gera curva emocional da conversa.',
        temporada: 1,
        episodio_prerequisito: 'EP05',
        tecnologias: ['HTML', 'CSS', 'JavaScript'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 8,
        codigo: 'EP06_PREDITIVO',
        nome: 'Simulador de Alerta de Churn',
        descricao: 'Visualize lista de clientes com comportamentos recentes. Modelo preditivo atribui probabilidade de churn. Decida qual cliente contatar proativamente.',
        temporada: 1,
        episodio_prerequisito: 'EP06',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Python', 'Scikit-learn'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },

    // TEMPORADA 2: IA Aplicada
    {
        id: 9,
        codigo: 'EP07_CHATBOT',
        nome: 'Robô de Atendimento Virtual (Chatbot)',
        descricao: 'Chatbot que responde perguntas frequentes sobre produtos. Em casos complexos, sugere transferência para agente humano. Processamento de linguagem natural.',
        temporada: 2,
        episodio_prerequisito: 'EP07',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Python', 'NLTK'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 10,
        codigo: 'EP08_ML_CHURN',
        nome: 'Previsor de Churn Interativo',
        descricao: 'Insira dados de um cliente (idade, tempo de contrato, NPS) e receba a probabilidade de churn calculada por modelo de Machine Learning treinado.',
        temporada: 2,
        episodio_prerequisito: 'EP08',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Python', 'TensorFlow'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 11,
        codigo: 'EP09_RECOMENDADOR',
        nome: 'Recomendador de Produtos/Serviços',
        descricao: 'E-commerce simulado onde IA recomenda produtos personalizados baseado em suas interações (cliques, visualizações). Sistema de filtragem colaborativa.',
        temporada: 2,
        episodio_prerequisito: 'EP09',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Python', 'LightFM'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },

    // TEMPORADA 3: Fundamentos Data-Driven
    {
        id: 12,
        codigo: 'EP10_SQL',
        nome: 'Editor SQL Interativo para Call Center',
        descricao: 'Editor SQL web com banco de dados simulado de call center. Escreva queries e veja resultados em tempo real. Aprenda SELECT, JOIN, GROUP BY na prática.',
        temporada: 3,
        episodio_prerequisito: 'EP10',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Python', 'SQLite'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 13,
        codigo: 'EP11_ESTATISTICA',
        nome: 'Calculadora Estatística de Teste A/B',
        descricao: 'Insira resultados de Teste A/B e calcule significância estatística. Sistema mostra se a diferença é relevante, intervalo de confiança e poder estatístico.',
        temporada: 3,
        episodio_prerequisito: 'EP11',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Python', 'SciPy'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 14,
        codigo: 'EP12_DASHBOARD',
        nome: 'Construtor de Dashboard Interativo',
        descricao: 'Carregue CSV e arraste tipos de gráficos (barras, linhas, pizza) para construir dashboard. Visualização dinâmica com filtros e exportação em PDF.',
        temporada: 3,
        episodio_prerequisito: 'EP12',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Chart.js'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },

    // TEMPORADA 4: Python para Qualidade
    {
        id: 15,
        codigo: 'EP13_RELATORIOS',
        nome: 'Gerador de Relatórios Automatizado',
        descricao: 'Configure parâmetros de relatório (período, métricas). Script Python gera PDF ou Excel automaticamente e disponibiliza para download.',
        temporada: 4,
        episodio_prerequisito: 'EP13',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Python', 'ReportLab'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 16,
        codigo: 'EP14_SCRAPING',
        nome: 'Coletor de Reviews de Clientes',
        descricao: 'Insira URL de produto e faça web scraping para coletar reviews. Sistema exibe lista de avaliações com análise de sentimento agregada.',
        temporada: 4,
        episodio_prerequisito: 'EP14',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Python', 'BeautifulSoup'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 17,
        codigo: 'EP15_NLP',
        nome: 'Analisador de Transcrições de Chamadas',
        descricao: 'Cole transcrição de chamada e NLP identifica entidades (nomes, produtos), extrai tópicos principais e calcula sentimento da conversa.',
        temporada: 4,
        episodio_prerequisito: 'EP15',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Python', 'spaCy'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },

    // TEMPORADA 5: Soft Skills do Futuro
    {
        id: 18,
        codigo: 'EP16_COMUNICACAO',
        nome: 'Simulador de Diálogo com Feedback',
        descricao: 'Interaja com cliente virtual em cenário de atendimento. Receba feedback sobre comunicação (tom, clareza, empatia) e sugestões de melhoria.',
        temporada: 5,
        episodio_prerequisito: 'EP16',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Python', 'NLTK'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 19,
        codigo: 'EP17_LIDERANCA',
        nome: 'Dashboard de Performance de Equipe',
        descricao: 'Dashboard simulado de equipe de qualidade. Ajuste variáveis (treinamento, motivação, ferramentas) e veja impacto em FCR, NPS e TMA.',
        temporada: 5,
        episodio_prerequisito: 'EP17',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Chart.js'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 20,
        codigo: 'EP18_NEGOCIACAO',
        nome: 'Simulador de Negociação com Cliente Irritado',
        descricao: 'Role-playing onde você resolve conflito com cliente virtual irritado. Escolhas de diálogo afetam desfecho da negociação e satisfação do cliente.',
        temporada: 5,
        episodio_prerequisito: 'EP18',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Python'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },

    // TEMPORADA 6: Ferramentas Avançadas
    {
        id: 21,
        codigo: 'EP19_POWERBI',
        nome: 'Visualizador de Dados de CX Interativo',
        descricao: 'Simule dashboard de Power BI/Tableau. Carregue CSV de CX e explore visualizações (barras, linhas, mapas de calor) com filtros dinâmicos.',
        temporada: 6,
        episodio_prerequisito: 'EP19',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Plotly.js'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 22,
        codigo: 'EP20_NOCODE',
        nome: 'Construtor de Fluxo de Automação Visual',
        descricao: 'Arraste e solte blocos para construir fluxo de automação (ex: "se NPS < 7, enviar email"). Sistema simula execução e mostra resultados.',
        temporada: 6,
        episodio_prerequisito: 'EP20',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'React Flow'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 23,
        codigo: 'EP21_API',
        nome: 'Simulador de Integração de Sistemas',
        descricao: 'Simule integração de CRM, telefonia e chat via APIs. Envie requisições e veja como dados são trocados entre sistemas.',
        temporada: 6,
        episodio_prerequisito: 'EP21',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Python', 'Flask'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },

    // TEMPORADA 7: Projetos Práticos
    {
        id: 24,
        codigo: 'EP22_PROJETO_CHURN',
        nome: 'Projeto: Sistema de Alerta de Churn',
        descricao: 'Projeto completo de sistema de alerta de churn. Frontend para visualização de clientes em risco e backend Python com modelo de ML.',
        temporada: 7,
        episodio_prerequisito: 'EP22',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Python', 'Flask', 'Scikit-learn'],
        pontos: { facil: 10, intermediario: 20, dificil: 30 }
    },
    {
        id: 25,
        codigo: 'EP23_PROJETO_DASHBOARD',
        nome: 'Projeto: Dashboard Executivo 360º',
        descricao: 'Desenvolva dashboard executivo completo para CX. Integre métricas de múltiplas fontes (NPS, FCR, LTV) com visão holística de performance.',
        temporada: 7,
        episodio_prerequisito: 'EP23',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Python', 'D3.js'],
        pontos: { facil: 10, intermediario: 20, dificil: 30 }
    },
    {
        id: 26,
        codigo: 'EP24_PROJETO_FEEDBACK',
        nome: 'Projeto: Automação de Feedback com IA',
        descricao: 'Sistema completo que coleta feedback via web, processa com IA (sentimento, categorização) e dispara ações automatizadas.',
        temporada: 7,
        episodio_prerequisito: 'EP24',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Python', 'spaCy'],
        pontos: { facil: 10, intermediario: 20, dificil: 30 }
    },

    // TEMPORADA 8: Futuro da Qualidade
    {
        id: 27,
        codigo: 'EP25_METAVERSO',
        nome: 'Explorador de Loja Virtual no Metaverso',
        descricao: 'Interface web 3D simulando loja virtual no metaverso. Navegue pelo ambiente e interaja com avatares de atendimento. CX imersivo.',
        temporada: 8,
        episodio_prerequisito: 'EP25',
        tecnologias: ['HTML', 'CSS', 'JavaScript', 'Three.js'],
        pontos: { facil: 10, intermediario: 20, dificil: 30 }
    },
    {
        id: 28,
        codigo: 'EP26_RA',
        nome: 'Assistente de RA para Suporte Técnico',
        descricao: 'Aplicação web que simula assistente de Realidade Aumentada. Aponte câmera para objeto e veja informações úteis e guias de solução sobrepostos.',
        temporada: 8,
        episodio_prerequisito: 'EP26',
        tecnologias: ['HTML', 'CSS', ' JavaScript', 'AR.js'],
        pontos: { facil: 10, intermediario: 20, dificil: 30 }
    }
];

// Função auxiliar para buscar módulo por código
function getBonusModule(codigo) {
    return window.BONUS_MODULES.find(m => m.codigo === codigo);
}

// Função auxiliar para buscar módulos por temporada
function getModulesByTemporada(temporada) {
    return window.BONUS_MODULES.filter(m => m.temporada === temporada);
}

console.log(`✅ ${window.BONUS_MODULES.length} módulos bônus carregados`);
