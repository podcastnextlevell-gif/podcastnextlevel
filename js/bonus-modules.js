// Módulos Bônus - Dados dos 28 módulos práticos
// Códigos alinhados com o Banco de Dados (SQL)

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
        codigo: 'EP00B_META',
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
        codigo: 'EP01_NPS',
        nome: 'Simulador de NPS Avançado',
        descricao: 'Simule pesquisas de NPS, analise feedbacks e categorizar detratores e promotores.',
        temporada: 1,
        episodio_prerequisito: 'EP01',
        tecnologias: ['HTML', 'CSS', 'JavaScript'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 4,
        codigo: 'EP02_JORNADA',
        nome: 'Mapeador de Jornada do Cliente',
        descricao: 'Identifique pontos de fricção na jornada do cliente e proponha melhorias.',
        temporada: 1,
        episodio_prerequisito: 'EP02',
        tecnologias: ['HTML', 'CSS', 'JavaScript'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 5,
        codigo: 'EP03_VOC',
        nome: 'Análise de Voz do Cliente (VOC)',
        descricao: 'Analise feedbacks de diversos canais e identifique padrões.',
        temporada: 1,
        episodio_prerequisito: 'EP03',
        tecnologias: ['HTML', 'CSS', 'JavaScript'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 6,
        codigo: 'EP04_CES',
        nome: 'Calculadora de Customer Effort Score',
        descricao: 'Calcule e interprete o CES para otimizar processos.',
        temporada: 1,
        episodio_prerequisito: 'EP04',
        tecnologias: ['HTML', 'CSS', 'JavaScript'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 7,
        codigo: 'EP05_CHURN',
        nome: 'Preditor de Churn Básico',
        descricao: 'Identifique sinais de risco de cancelamento em clientes.',
        temporada: 1,
        episodio_prerequisito: 'EP05',
        tecnologias: ['HTML', 'CSS', 'JavaScript'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },

    // TEMPORADA 2: IA Aplicada
    {
        id: 8,
        codigo: 'EP06_SENTIMENTO',
        nome: 'Análise de Sentimento com IA',
        descricao: 'Use IA para classificar sentimentos em textos de suporte.',
        temporada: 2,
        episodio_prerequisito: 'EP06',
        tecnologias: ['Python', 'NLP', 'AI'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 9,
        codigo: 'EP07_CHATBOT',
        nome: 'Construtor de Chatbot Simples',
        descricao: 'Crie um fluxo de conversa automatizado para atendimento.',
        temporada: 2,
        episodio_prerequisito: 'EP07',
        tecnologias: ['JavaScript', 'Logic Flow'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 10,
        codigo: 'EP08_ML_CHURN',
        nome: 'Modelo ML para Churn',
        descricao: 'Treine um modelo simples para prever churn.',
        temporada: 2,
        episodio_prerequisito: 'EP08',
        tecnologias: ['Python', 'Scikit-learn'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 11,
        codigo: 'EP09_RECOMENDADOR',
        nome: 'Sistema de Recomendação',
        descricao: 'Crie recomendações personalizadas baseadas em histórico.',
        temporada: 2,
        episodio_prerequisito: 'EP09',
        tecnologias: ['Python', 'Pandas'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },

    // TEMPORADA 3: Data-Driven
    {
        id: 12,
        codigo: 'EP10_SQL',
        nome: 'SQL Interativo para Dados',
        descricao: 'Execute queries SQL reais para extrair insights.',
        temporada: 3,
        episodio_prerequisito: 'EP10',
        tecnologias: ['SQL', 'Database'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 13,
        codigo: 'EP11_ESTATISTICA',
        nome: 'Simulador de Teste A/B',
        descricao: 'Planeje e analise resultados de testes A/B.',
        temporada: 3,
        episodio_prerequisito: 'EP11',
        tecnologias: ['Statistics', 'Math'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 14,
        codigo: 'EP12_DASHBOARD',
        nome: 'Dashboard Builder',
        descricao: 'Construa dashboards interativos com dados reais.',
        temporada: 3,
        episodio_prerequisito: 'EP12',
        tecnologias: ['Data Viz', 'Charts'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },

    // TEMPORADA 4: Python
    {
        id: 15,
        codigo: 'EP13_RELATORIOS',
        nome: 'Automação de Relatórios',
        descricao: 'Script Python para gerar relatórios PDF automáticos.',
        temporada: 4,
        episodio_prerequisito: 'EP13',
        tecnologias: ['Python', 'Pandas', 'PDF'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 16,
        codigo: 'EP14_SCRAPING',
        nome: 'Web Scraping de Dados',
        descricao: 'Extraia dados de concorrentes da web.',
        temporada: 4,
        episodio_prerequisito: 'EP14',
        tecnologias: ['Python', 'BeautifulSoup'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 17,
        codigo: 'EP15_NLP',
        nome: 'Processamento de Texto (NLP)',
        descricao: 'Limpeza e análise de textos massivos.',
        temporada: 4,
        episodio_prerequisito: 'EP15',
        tecnologias: ['Python', 'Regex', 'NLP'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },

    // TEMPORADA 5: Soft Skills
    {
        id: 18,
        codigo: 'EP16_COMUNICACAO',
        nome: 'Comunicação Assertiva',
        descricao: 'Simulador de conversas difíceis e feedback.',
        temporada: 5,
        episodio_prerequisito: 'EP16',
        tecnologias: ['Roleplay', 'Interactive'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 19,
        codigo: 'EP17_LIDERANCA',
        nome: 'Cenários de Liderança',
        descricao: 'Tome decisões de gestão em cenários simulados.',
        temporada: 5,
        episodio_prerequisito: 'EP17',
        tecnologias: ['Decision Making'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 20,
        codigo: 'EP18_NEGOCIACAO',
        nome: 'Simulador de Negociação',
        descricao: 'Negocie prazos e recursos em um ambiente controlado.',
        temporada: 5,
        episodio_prerequisito: 'EP18',
        tecnologias: ['Strategy'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },

    // TEMPORADA 6: Ferramentas
    {
        id: 21,
        codigo: 'EP19_POWERBI',
        nome: 'Power BI Essencial',
        descricao: 'Crie seu primeiro relatório no Power BI.',
        temporada: 6,
        episodio_prerequisito: 'EP19',
        tecnologias: ['Power BI', 'DAX'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 22,
        codigo: 'EP20_NOCODE',
        nome: 'Automação No-Code',
        descricao: 'Integre ferramentas sem escrever código.',
        temporada: 6,
        episodio_prerequisito: 'EP20',
        tecnologias: ['Zapier', 'Integration'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 23,
        codigo: 'EP21_API',
        nome: 'Consumo de APIs',
        descricao: 'Entenda como conectar sistemas via API.',
        temporada: 6,
        episodio_prerequisito: 'EP21',
        tecnologias: ['API', 'JSON', 'Postman'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },

    // TEMPORADA 7: Projetos Reais
    {
        id: 24,
        codigo: 'EP22_PROJETO_CHURN',
        nome: 'Projeto: Redução de Churn',
        descricao: 'Projeto capstone: desenvolva uma estratégia completa.',
        temporada: 7,
        episodio_prerequisito: 'EP22',
        tecnologias: ['Strategy', 'Analytics'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 25,
        codigo: 'EP23_PROJETO_DASHBOARD',
        nome: 'Projeto: Dashboard Executivo',
        descricao: 'Crie um dashboard final para diretoria.',
        temporada: 7,
        episodio_prerequisito: 'EP23',
        tecnologias: ['Data Viz', 'Presentation'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 26,
        codigo: 'EP24_PROJETO_FEEDBACK',
        nome: 'Projeto: Sistema de Feedback',
        descricao: 'Implemente um loop de feedback completo.',
        temporada: 7,
        episodio_prerequisito: 'EP24',
        tecnologias: ['System Design', 'CX'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },

    // TEMPORADA 8: Futuro
    {
        id: 27,
        codigo: 'EP25_METAVERSO',
        nome: 'CX no Metaverso e IA',
        descricao: 'Explore cenários futuros de atendimento.',
        temporada: 8,
        episodio_prerequisito: 'EP25',
        tecnologias: ['Metaverse', 'AI Generative'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    },
    {
        id: 28,
        codigo: 'EP26_RA',
        nome: 'Realidade Aumentada no Suporte',
        descricao: 'Simule suporte técnico com RA.',
        temporada: 8,
        episodio_prerequisito: 'EP26',
        tecnologias: ['AR', 'Mobile'],
        pontos: { facil: 5, intermediario: 10, dificil: 20 }
    }
];
