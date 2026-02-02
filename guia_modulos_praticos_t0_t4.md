# Guia de Módulos Práticos - NEXT LEVEL 2025 (Temporadas 0 a 4)

Este documento detalha ideias de módulos práticos interativos para cada episódio das Temporadas 0 a 4 do programa NEXT LEVEL 2025. Cada módulo é projetado para reforçar o aprendizado com exemplos aplicáveis, utilizando uma combinação de HTML, CSS, JavaScript para a interface e Python/Java para a lógica de backend ou processamento de dados. Os módulos são categorizados por nível de dificuldade e possuem regras de liberação específicas.

## Temporada 0: Episódios Introdutórios

### EP00A: Como se Tornar Analista de Qualidade
*   **Ideia de Aplicação:** **
Calculadora de ROI de Carreira**
*   **Descrição:** Uma ferramenta interativa onde o usuário pode inserir seu salário atual como atendente, o salário desejado como analista, e o tempo estimado para a transição. A aplicação calcula o retorno sobre o investimento (ROI) da mudança de carreira.
*   **Tecnologias:** HTML, CSS, JavaScript.
*   **Níveis de Dificuldade:**
    *   **Fácil:** Calculadora simples com campos de entrada e exibição do resultado.
    *   **Intermediário:** Adicionar gráficos dinâmicos (usando Chart.js) que mostram a projeção de ganhos ao longo do tempo.
    *   **Difícil:** Integrar com uma API de mercado de trabalho (simulada) para buscar salários médios e exibir uma análise comparativa.
*   **Regra de Liberação:** Liberado após a conclusão do EP00A.

### EP00B: Roadmap de Estudos para Qualidade
*   **Ideia de Aplicação:** **Construtor de Roadmap de Estudos Interativo**
*   **Descrição:** Uma aplicação onde o usuário pode arrastar e soltar competências (SQL, Python, Power BI) em uma linha do tempo de 6 meses, montando seu próprio plano de estudos personalizado. O sistema oferece feedback sobre a carga de estudos e sugere recursos.
*   **Tecnologias:** HTML, CSS, JavaScript (com bibliotecas de arrastar e soltar como SortableJS).
*   **Níveis de Dificuldade:**
    *   **Fácil:** Funcionalidade básica de arrastar e soltar para organizar as competências.
    *   **Intermediário:** Salvar o roadmap do usuário no `localStorage` do navegador e permitir a exportação em PDF.
    *   **Difícil:** Criar um sistema de "créditos" de horas de estudo, onde cada competência tem um peso, e o sistema valida se o plano é realista.
*   **Regra de Liberação:** Liberado após a conclusão do EP00B.

## Temporada 1: CX Avançado

### EP01: Jornada do Cliente Data-Driven
*   **Ideia de Aplicação:** **Simulador de Mapeamento de Jornada**
*   **Descrição:** Uma interface que simula a jornada de um cliente em um e-commerce. O usuário pode clicar em diferentes touchpoints (visita ao site, adição ao carrinho, contato com o suporte) e ver as métricas de CES e NPS mudarem dinamicamente.
*   **Tecnologias:** HTML, CSS, JavaScript.
*   **Níveis de Dificuldade:**
    *   **Fácil:** Jornada linear com métricas pré-definidas para cada etapa.
    *   **Intermediário:** Permitir que o usuário altere a "qualidade" de cada touchpoint (ex: chat rápido vs. lento) e veja o impacto nas métricas finais.
    *   **Difícil:** Conectar a interface a um backend simples (Python com Flask ou Java com Spring Boot) que processa a lógica da jornada e retorna os resultados via API.
*   **Regra de Liberação:** Liberado após a conclusão do EP01.

### EP02: Voice of Customer com Tecnologia
*   **Ideia de Aplicação:** **Analisador de Sentimento de Feedback**
*   **Descrição:** Uma caixa de texto onde o usuário pode colar um feedback de cliente. A aplicação, usando um modelo de NLP, classifica o sentimento (positivo, negativo, neutro) e destaca as palavras-chave.
*   **Tecnologias:** HTML, CSS, JavaScript (para o frontend) e Python com NLTK/spaCy ou Java com OpenNLP (para o backend).
*   **Níveis de Dificuldade:**
    *   **Fácil:** Usar uma biblioteca de análise de sentimento do lado do cliente (JavaScript).
    *   **Intermediário:** Criar uma API em Python/Java que recebe o texto e retorna a análise de sentimento.
    *   **Difícil:** Treinar um modelo de classificação de sentimento customizado com um dataset de feedbacks de call center e implantá-lo no Google Colab, com a interface fazendo chamadas para a API do Colab.
*   **Regra de Liberação:** Liberado após a conclusão do EP02.

### EP03: Métricas Avançadas de CX
*   **Ideia de Aplicação:** **Dashboard de Correlação de Métricas**
*   **Descrição:** Um dashboard interativo que permite ao usuário ajustar "sliders" de métricas operacionais (TMA, FCR) e ver o impacto em métricas financeiras (LTV, Churn). A aplicação mostra graficamente a correlação.
*   **Tecnologias:** HTML, CSS, JavaScript (com Plotly.js ou D3.js).
*   **Níveis de Dificuldade:**
    *   **Fácil:** Gráficos com dados simulados e correlações fixas.
    *   **Intermediário:** Permitir o upload de um arquivo CSV com dados reais (ou simulados) e gerar os gráficos de correlação dinamicamente.
    *   **Difícil:** Implementar um cálculo de regressão linear em JavaScript ou em um backend Python/Java para mostrar a força da correlação e a equação da reta.
*   **Regra de Liberação:** Liberado após a conclusão do EP03.

### EP04: Omnicanalidade e Experiência Integrada
*   **Ideia de Aplicação:** **Simulador de Handoff de Atendimento**
*   **Descrição:** Uma simulação de tela de CRM. O usuário atende um cliente que iniciou o contato no chat e foi transferido para o telefone. A aplicação mostra (ou não) o histórico do chat para o agente, ilustrando a diferença entre uma experiência quebrada e uma integrada.
*   **Tecnologias:** HTML, CSS, JavaScript.
*   **Níveis de Dificuldade:**
    *   **Fácil:** Simulação com dados e fluxos fixos.
    *   **Intermediário:** Criar múltiplos cenários de handoff (chat -> telefone, e-mail -> app) que o usuário pode escolher.
    *   **Difícil:** Desenvolver um mini-CRM com um backend (Python/Java) que armazena o histórico de interações em um banco de dados simples (SQLite) e o serve para a interface.
*   **Regra de Liberação:** Liberado após a conclusão do EP04.

### EP05: Experiência Emocional e Neurociência
*   **Ideia de Aplicação:** **Construtor de Script com Pico-Fim**
*   **Descrição:** Uma ferramenta onde o usuário pode montar um script de atendimento arrastando blocos de diálogo (saudação, validação de emoção, solução, finalização). A aplicação avalia o script com base no princípio de Pico-Fim e dá uma nota.
*   **Tecnologias:** HTML, CSS, JavaScript.
*   **Níveis de Dificuldade:**
    *   **Fácil:** Avaliação baseada em regras simples (ex: o bloco "solução surpreendente" deve vir antes da "finalização").
    *   **Intermediário:** Gerar um gráfico da "curva emocional" do script montado pelo usuário.
    *   **Difícil:** Usar análise de texto para avaliar a qualidade das frases inseridas pelo usuário em cada bloco.
*   **Regra de Liberação:** Liberado após a conclusão do EP05.

### EP06: CX Preditivo e Proativo
*   **Ideia de Aplicação:** **Simulador de Alerta de Churn**
*   **Descrição:** A aplicação exibe uma lista de clientes com seus comportamentos recentes (ex: múltiplas chamadas, notas baixas de NPS). Um modelo preditivo (simulado) atribui uma "probabilidade de churn" a cada um. O usuário deve decidir qual cliente contatar proativamente.
*   **Tecnologias:** HTML, CSS, JavaScript e Python/Java para o backend.
*   **Níveis de Dificuldade:**
    *   **Fácil:** Modelo de churn baseado em regras simples (ex: se `rechamadas > 3`, `churn_chance = 80%`).
    *   **Intermediário:** Criar uma API em Python/Java que usa um modelo de regressão logística (treinado no Colab com Scikit-learn) para calcular a probabilidade de churn.
    *   **Difícil:** Permitir que o usuário "treine" o modelo na própria interface, ajustando os pesos das variáveis e vendo o impacto na precisão do modelo.
*   **Regra de Liberação:** Liberado após a conclusão do EP06.

## Temporada 2: IA Aplicada

*... (Conteúdo a ser desenvolvido na próxima fase)*

## Temporada 3: Fundamentos Data-Driven

*... (Conteúdo a ser desenvolvido na próxima fase)*

## Temporada 4: Python para Qualidade

*... (Conteúdo a ser desenvolvido na próxima fase)*
### EP07: Automação de Processos com IA
*   **Ideia de Aplicação:** **Robô de Atendimento Virtual (Chatbot)**
*   **Descrição:** Um chatbot simples que pode responder a perguntas frequentes sobre um produto ou serviço. O usuário interage com o chatbot e, em casos de perguntas não respondidas, o chatbot sugere a transferência para um agente humano.
*   **Tecnologias:** HTML, CSS, JavaScript (para o frontend do chatbot) e Python com bibliotecas como `NLTK` ou `spaCy` para processamento de linguagem natural e lógica de diálogo no backend.
*   **Níveis de Dificuldade:**
    *   **Fácil:** Chatbot baseado em regras fixas (palavras-chave e respostas pré-definidas).
    *   **Intermediário:** Chatbot com reconhecimento de intenção básica usando um modelo de ML simples (ex: `scikit-learn` para classificação de texto) treinado no Google Colab.
    *   **Difícil:** Integrar o chatbot com uma API de um serviço de IA conversacional (ex: Dialogflow, Rasa) para um processamento de linguagem natural mais avançado e gerenciamento de contexto.
*   **Regra de Liberação:** Liberado após a conclusão do EP07.

### EP08: Análise Preditiva e Machine Learning
*   **Ideia de Aplicação:** **Previsor de Churn Interativo**
*   **Descrição:** Uma interface onde o usuário pode inserir dados de um cliente (idade, tempo de contrato, número de interações, NPS) e a aplicação retorna a probabilidade de churn do cliente, baseada em um modelo de Machine Learning.
*   **Tecnologias:** HTML, CSS, JavaScript (para o frontend) e Python com `scikit-learn` ou `TensorFlow` para o modelo de ML no backend.
*   **Níveis de Dificuldade:**
    *   **Fácil:** Modelo de previsão de churn simulado com regras simples no JavaScript.
    *   **Intermediário:** Implementar um modelo de regressão logística ou árvore de decisão em Python (usando `scikit-learn`) e expor via API (Flask ou FastAPI) para o frontend.
    *   **Difícil:** Desenvolver um modelo de rede neural (usando `TensorFlow` ou `Keras`) para prever o churn, treinar no Google Colab e integrar com a aplicação via API.
*   **Regra de Liberação:** Liberado após a conclusão do EP08.

### EP09: IA na Personalização da Experiência
*   **Ideia de Aplicação:** **Recomendador de Produtos/Serviços**
*   **Descrição:** Uma aplicação que simula um e-commerce. Com base nas interações do usuário (cliques, visualizações), a IA (simulada) recomenda produtos ou serviços personalizados.
*   **Tecnologias:** HTML, CSS, JavaScript (para o frontend) e Python com `surprise` ou `LightFM` para sistemas de recomendação no backend.
*   **Níveis de Dificuldade:**
    *   **Fácil:** Recomendações baseadas em popularidade ou regras simples (ex: "quem viu X também viu Y").
    *   **Intermediário:** Implementar um sistema de recomendação baseado em filtragem colaborativa (usuário-usuário ou item-item) em Python e expor via API.
    *   **Difícil:** Desenvolver um sistema de recomendação híbrido que combine filtragem colaborativa com conteúdo, utilizando técnicas de Machine Learning mais avançadas e treinado no Google Colab.
*   **Regra de Liberação:** Liberado após a conclusão do EP09.

## Temporada 3: Fundamentos Data-Driven

### EP10: SQL para Análise de Qualidade
*   **Ideia de Aplicação:** **Editor SQL Interativo para Call Center**
*   **Descrição:** Uma interface web com um editor de texto onde o usuário pode escrever consultas SQL. A aplicação simula um banco de dados de call center (com tabelas de chamadas, agentes, clientes) e executa as consultas, exibindo os resultados.
*   **Tecnologias:** HTML, CSS, JavaScript (para o editor e exibição) e Python com `sqlite3` ou Java com `H2 Database` para o banco de dados em memória e execução das consultas.
*   **Níveis de Dificuldade:**
    *   **Fácil:** Editor SQL básico com um conjunto limitado de tabelas e consultas pré-definidas.
    *   **Intermediário:** Permitir que o usuário crie suas próprias consultas `SELECT`, `WHERE`, `GROUP BY` e `JOIN` em um banco de dados mais robusto.
    *   **Difícil:** Adicionar funcionalidades de otimização de consulta e visualização do plano de execução, além de permitir a criação de `VIEWS` e `FUNCTIONS` simples.
*   **Regra de Liberação:** Liberado após a conclusão do EP10.

### EP11: Estatística Aplicada ao CX
*   **Ideia de Aplicação:** **Calculadora Estatística de Teste A/B**
*   **Descrição:** Uma ferramenta onde o usuário pode inserir os resultados de um Teste A/B (número de amostras, conversões para A e B) e a aplicação calcula a significância estatística, mostrando se a diferença é relevante.
*   **Tecnologias:** HTML, CSS, JavaScript (para o frontend) e Python com `scipy.stats` ou Java com `Apache Commons Math` para os cálculos estatísticos no backend.
*   **Níveis de Dificuldade:**
    *   **Fácil:** Calculadora de teste de hipótese simples (ex: teste Z para proporções) com resultados diretos.
    *   **Intermediário:** Adicionar cálculo de intervalo de confiança e poder estatístico do teste.
    *   **Difícil:** Permitir a simulação de múltiplos testes A/B e a visualização da distribuição dos resultados, além de incorporar diferentes tipos de testes estatísticos (t-test, ANOVA).
*   **Regra de Liberação:** Liberado após a conclusão do EP11.

### EP12: Visualização de Dados para Insights
*   **Ideia de Aplicação:** **Construtor de Dashboard Interativo**
*   **Descrição:** Uma interface onde o usuário pode carregar um arquivo CSV (simulado ou real) e arrastar e soltar diferentes tipos de gráficos (barras, linhas, pizza) para construir um dashboard simples. A aplicação exibe os gráficos dinamicamente.
*   **Tecnologias:** HTML, CSS, JavaScript (com bibliotecas como `Chart.js`, `Plotly.js` ou `D3.js`).
*   **Níveis de Dificuldade:**
    *   **Fácil:** Carregar um CSV pré-definido e gerar gráficos básicos.
    *   **Intermediário:** Permitir o upload de qualquer CSV e a seleção de colunas para os eixos X e Y dos gráficos.
    *   **Difícil:** Adicionar funcionalidades de filtragem de dados, segmentação e exportação do dashboard em PDF ou imagem. Integrar com um backend Python/Java para processamento de dados mais complexo.
*   **Regra de Liberação:** Liberado após a conclusão do EP12.

## Temporada 4: Python para Qualidade

### EP13: Automação de Relatórios com Python
*   **Ideia de Aplicação:** **Gerador de Relatórios Automatizado**
*   **Descrição:** Uma aplicação web onde o usuário pode configurar parâmetros para um relatório (ex: período, tipo de métrica). Um script Python (simulado) gera um relatório em PDF ou Excel e o disponibiliza para download.
*   **Tecnologias:** HTML, CSS, JavaScript (para o frontend) e Python com `pandas`, `openpyxl` ou `ReportLab` para geração de relatórios no backend.
*   **Níveis de Dificuldade:**
    *   **Fácil:** Gerar um relatório simples com dados fixos.
    *   **Intermediário:** Permitir a seleção de métricas e filtros, e gerar um relatório personalizado a partir de um CSV.
    *   **Difícil:** Integrar com um banco de dados (SQLite) para extrair dados, gerar relatórios complexos com gráficos e tabelas, e enviar por e-mail (usando `smtplib`).
*   **Regra de Liberação:** Liberado após a conclusão do EP13.

### EP14: Web Scraping para Coleta de Dados
*   **Ideia de Aplicação:** **Coletor de Reviews de Clientes**
*   **Descrição:** Uma interface onde o usuário pode inserir a URL de uma página de produto (simulada) e a aplicação faz web scraping para coletar reviews de clientes, exibindo-os em uma lista.
*   **Tecnologias:** HTML, CSS, JavaScript (para o frontend) e Python com `BeautifulSoup` ou `Scrapy` para web scraping no backend.
*   **Níveis de Dificuldade:**
    *   **Fácil:** Coletar reviews de uma página pré-definida com estrutura simples.
    *   **Intermediário:** Permitir a inserção de qualquer URL (de um conjunto de sites permitidos) e extrair reviews com diferentes estruturas HTML.
    *   **Difícil:** Adicionar análise de sentimento aos reviews coletados e exportar os dados para CSV ou Excel.
*   **Regra de Liberação:** Liberado após a conclusão do EP14.

### EP15: Análise de Texto com NLP em Python
*   **Ideia de Aplicação:** **Analisador de Transcrições de Chamadas**
*   **Descrição:** Uma caixa de texto onde o usuário pode colar uma transcrição de chamada. A aplicação, usando NLP em Python, identifica entidades (nomes, produtos), extrai tópicos principais e calcula o sentimento geral da conversa.
*   **Tecnologias:** HTML, CSS, JavaScript (para o frontend) e Python com `NLTK`, `spaCy` ou `transformers` para NLP no backend.
*   **Níveis de Dificuldade:**
    *   **Fácil:** Identificação de palavras-chave e sentimento básico usando regras ou dicionários.
    *   **Intermediário:** Extração de entidades nomeadas (NER) e sumarização de texto simples.
    *   **Difícil:** Implementar um modelo de classificação de tópicos (topic modeling) e análise de sentimento mais avançada, com visualização interativa dos resultados.
*   **Regra de Liberação:** Liberado após a conclusão do EP15.

## Temporada 5: Soft Skills do Futuro

### EP16: Comunicação Eficaz e Feedback Construtivo
*   **Ideia de Aplicação:** **Simulador de Diálogo com Feedback**
*   **Descrição:** Uma interface onde o usuário interage com um cliente virtual em um cenário de atendimento. Após a interação, a aplicação fornece feedback sobre a comunicação utilizada (tom, clareza, empatia) e sugere melhorias.
*   **Tecnologias:** HTML, CSS, JavaScript (para a interface de diálogo) e Python com processamento de linguagem natural (NLTK/spaCy) para análise de texto e feedback no backend.
*   **Níveis de Dificuldade:**
    *   **Fácil:** Cenários de diálogo pré-definidos com feedback baseado em palavras-chave.
    *   **Intermediário:** Implementar um sistema de pontuação para a interação, considerando a escolha de frases e a resolução do problema do cliente.
    *   **Difícil:** Integrar com um modelo de IA que avalia o sentimento e a intenção das respostas do usuário, oferecendo feedback mais granular e adaptativo.
*   **Regra de Liberação:** Liberado após a conclusão do EP16.

### EP17: Liderança e Gestão de Equipes de Qualidade
*   **Ideia de Aplicação:** **Dashboard de Performance de Equipe (Simulado)**
*   **Descrição:** Um dashboard interativo que simula a performance de uma equipe de qualidade. O usuário pode ajustar variáveis como treinamento, motivação e ferramentas, e ver o impacto nas métricas da equipe (FCR, NPS, TMA).
*   **Tecnologias:** HTML, CSS, JavaScript (com Chart.js ou Plotly.js para visualização).
*   **Níveis de Dificuldade:**
    *   **Fácil:** Dashboard com dados e correlações fixas.
    *   **Intermediário:** Permitir que o usuário defina metas para a equipe e veja a projeção de resultados com base nas variáveis ajustadas.
    *   **Difícil:** Implementar um modelo de simulação em Python/Java que calcula o impacto das decisões do usuário na performance da equipe, considerando interdependências entre as variáveis.
*   **Regra de Liberação:** Liberado após a conclusão do EP17.

### EP18: Resolução de Conflitos e Negociação
*   **Ideia de Aplicação:** **Simulador de Negociação com Cliente Irritado**
*   **Descrição:** Um jogo de role-playing onde o usuário assume o papel de um agente de qualidade e precisa resolver um conflito com um cliente virtual irritado. As escolhas de diálogo do usuário afetam o desfecho da negociação.
*   **Tecnologias:** HTML, CSS, JavaScript (para a interface do jogo) e Python/Java para a lógica de diálogo e avaliação do desfecho.
*   **Níveis de Dificuldade:**
    *   **Fácil:** Cenários de conflito simples com opções de diálogo limitadas.
    *   **Intermediário:** Múltiplos caminhos de diálogo e desfechos, com pontuação baseada na satisfação do cliente e na resolução do problema.
    *   **Difícil:** Integrar com um modelo de IA que analisa a linguagem do usuário e do cliente virtual para tornar a interação mais dinâmica e imprevisível.
*   **Regra de Liberação:** Liberado após a conclusão do EP18.

## Temporada 6: Ferramentas Avançadas

### EP19: Power BI e Tableau para CX
*   **Ideia de Aplicação:** **Visualizador de Dados de CX Interativo**
*   **Descrição:** Uma aplicação web que simula um dashboard de Power BI/Tableau. O usuário pode carregar um arquivo CSV de dados de CX (simulado) e explorar diferentes visualizações (gráficos de barras, linhas, mapas de calor) e filtros.
*   **Tecnologias:** HTML, CSS, JavaScript (com bibliotecas como Plotly.js, D3.js ou Apache ECharts).
*   **Níveis de Dificuldade:**
    *   **Fácil:** Dashboard pré-configurado com dados fixos e filtros básicos.
    *   **Intermediário:** Permitir o upload de CSVs e a criação de visualizações personalizadas, com a capacidade de salvar e compartilhar o dashboard.
    *   **Difícil:** Integrar com um backend Python/Java que processa grandes volumes de dados e serve as visualizações otimizadas para o frontend, simulando a performance de ferramentas de BI reais.
*   **Regra de Liberação:** Liberado após a conclusão do EP19.

### EP20: Automação No-Code/Low-Code para Qualidade
*   **Ideia de Aplicação:** **Construtor de Fluxo de Automação Visual**
*   **Descrição:** Uma interface de arrastar e soltar onde o usuário pode construir um fluxo de automação (ex: "se NPS < 7, enviar e-mail de follow-up"). A aplicação simula a execução do fluxo e mostra os resultados.
*   **Tecnologias:** HTML, CSS, JavaScript (com bibliotecas de arrastar e soltar e visualização de nós/fluxos como React Flow ou GoJS).
*   **Níveis de Dificuldade:**
    *   **Fácil:** Fluxos simples com blocos pré-definidos (condições, ações).
    *   **Intermediário:** Permitir a criação de fluxos mais complexos com múltiplas condições e ações, e a integração com APIs simuladas (ex: envio de e-mail).
    *   **Difícil:** Implementar um motor de execução de fluxo em Python/Java que interpreta o fluxo visualmente construído e o executa em tempo real, com monitoramento e logs.
*   **Regra de Liberação:** Liberado após a conclusão do EP20.

### EP21: Integração de APIs para CX
*   **Ideia de Aplicação:** **Simulador de Integração de Sistemas**
*   **Descrição:** Uma aplicação que simula a integração de diferentes sistemas (CRM, sistema de telefonia, chat) via APIs. O usuário pode enviar requisições (simuladas) para uma API e ver como os dados são trocados entre os sistemas.
*   **Tecnologias:** HTML, CSS, JavaScript (para o frontend) e Python com Flask/FastAPI ou Java com Spring Boot para o backend que simula as APIs.
*   **Níveis de Dificuldade:**
    *   **Fácil:** Integração de duas APIs simples com requisições GET e POST básicas.
    *   **Intermediário:** Simular a orquestração de múltiplas APIs, tratamento de erros e autenticação (tokens JWT simulados).
    *   **Difícil:** Construir um gateway de API simples que roteia requisições para diferentes microsserviços (simulados) e agrega as respostas, ilustrando a complexidade de sistemas distribuídos.
*   **Regra de Liberação:** Liberado após a conclusão do EP21.

## Temporada 7: Projetos Práticos

### EP22: Projeto: Alerta de Churn Proativo
*   **Ideia de Aplicação:** **Desenvolvimento de um Sistema de Alerta de Churn**
*   **Descrição:** Um projeto prático onde o usuário constrói um sistema completo de alerta de churn. Inclui um frontend web para visualização de clientes em risco e um backend Python que executa um modelo de ML para calcular a probabilidade de churn.
*   **Tecnologias:** HTML, CSS, JavaScript (frontend), Python com Flask/FastAPI e scikit-learn (backend), SQLite (banco de dados).
*   **Níveis de Dificuldade:**
    *   **Fácil:** Focar apenas na integração do frontend com um modelo de churn pré-treinado.
    *   **Intermediário:** Desenvolver o modelo de churn do zero, integrar com o frontend e adicionar funcionalidades de visualização de dados.
    *   **Difícil:** Implementar um sistema de notificação (e-mail/SMS simulado) para clientes em risco e um dashboard de acompanhamento para o time de retenção.
*   **Regra de Liberação:** Liberado após a conclusão do EP22.

### EP23: Projeto: Dashboard Executivo 360º
*   **Ideia de Aplicação:** **Construção de um Dashboard Executivo Completo**
*   **Descrição:** Um projeto prático onde o usuário desenvolve um dashboard executivo 360º para CX. O dashboard deve integrar métricas de diferentes fontes (NPS, FCR, LTV, dados de canais) e oferecer uma visão holística da performance.
*   **Tecnologias:** HTML, CSS, JavaScript (com Power BI Embedded, Tableau Public ou bibliotecas de visualização como Plotly.js/D3.js), Python (para ETL e processamento de dados).
*   **Níveis de Dificuldade:**
    *   **Fácil:** Focar na criação de um dashboard estático com dados pré-carregados.
    *   **Intermediário:** Permitir a conexão com diferentes fontes de dados (CSV, API simulada) e a criação de filtros e interações dinâmicas.
    *   **Difícil:** Implementar um pipeline de ETL em Python para coletar, limpar e transformar dados de múltiplas fontes, e integrar com o dashboard para atualizações em tempo real.
*   **Regra de Liberação:** Liberado após a conclusão do EP23.

### EP24: Projeto: Automação de Feedback com IA
*   **Ideia de Aplicação:** **Desenvolvimento de um Sistema de Automação de Feedback**
*   **Descrição:** Um projeto prático onde o usuário constrói um sistema que coleta feedback de clientes (via formulário web), processa-o com IA (análise de sentimento, categorização de tópicos) e dispara ações automatizadas (ex: encaminhar para o setor responsável).
*   **Tecnologias:** HTML, CSS, JavaScript (frontend), Python com Flask/FastAPI e NLTK/spaCy (backend), SQLite (banco de dados).
*   **Níveis de Dificuldade:**
    *   **Fácil:** Focar na coleta de feedback e análise de sentimento básica.
    *   **Intermediário:** Adicionar categorização de tópicos e um sistema de regras para disparar ações automatizadas.
    *   **Difícil:** Implementar um sistema de aprendizado ativo onde o modelo de IA melhora com o feedback humano, e integrar com um sistema de tickets (simulado).
*   **Regra de Liberação:** Liberado após a conclusão do EP24.

## Temporada 8: Futuro da Qualidade

### EP25: Metaverso e CX Imersivo
*   **Ideia de Aplicação:** **Explorador de Loja Virtual no Metaverso (Simulado)**
*   **Descrição:** Uma interface web 3D simples (usando Three.js ou A-Frame) que simula uma loja virtual no metaverso. O usuário pode navegar pelo ambiente e interagir com avatares de atendimento, explorando como o CX pode ser imersivo.
*   **Tecnologias:** HTML, CSS, JavaScript (com bibliotecas 3D).
*   **Níveis de Dificuldade:**
    *   **Fácil:** Ambiente 3D estático com interações básicas (clicar em objetos).
    *   **Intermediário:** Adicionar um avatar de atendimento com diálogo pré-definido e a capacidade de personalizar o ambiente.
    *   **Difícil:** Implementar um sistema de navegação mais complexo, interação com outros avatares (simulados) e a integração com APIs de produtos virtuais.
*   **Regra de Liberação:** Liberado após a conclusão do EP25.

### EP26: Realidade Aumentada e Suporte Inteligente
*   **Ideia de Aplicação:** **Assistente de RA para Suporte Técnico (Simulado)**
*   **Descrição:** Uma aplicação web que simula um assistente de Realidade Aumentada. O usuário aponta a câmera do celular (simulada) para um objeto (ex: um roteador) e a aplicação sobrepõe informações úteis, guias de solução de problemas ou um agente virtual.
*   **Tecnologias:** HTML, CSS, JavaScript (com bibliotecas de RA web como AR.js ou A-Frame).
*   **Níveis de Dificuldade:**
    *   **Fácil:** Sobrepor informações estáticas em um marcador de RA pré-definido.
    *   **Intermediário:** Adicionar um guia passo a passo interativo que o usuário pode seguir para resolver um problema.
    *   **Difícil:** Integrar com um modelo de visão computacional (treinado no Google Colab) que reconhece o objeto e fornece suporte contextualizado, além de permitir a comunicação com um agente virtual.
*   **Regra de Liberação:** Liberado após a conclusão do EP26.

### EP27: Web3, Blockchain e a Confiança do Cliente
*   **Ideia de Aplicação:** **Explorador de Transações em Blockchain (Simulado)**
*   **Descrição:** Uma interface web que simula um explorador de blockchain. O usuário pode visualizar transações (simuladas) de clientes, como histórico de compras ou interações de suporte, e verificar a imutabilidade e transparência dos registros.
*   **Tecnologias:** HTML, CSS, JavaScript (para o frontend) e Python com `web3.py` ou Java com `web3j` para simular a interação com uma blockchain local (ex: Ganache).
*   **Níveis de Dificuldade:**
    *   **Fácil:** Visualizar um conjunto fixo de transações em um bloco simulado.
    *   **Intermediário:** Permitir que o usuário crie novas transações (simuladas) e as adicione à blockchain, vendo a atualização em tempo real.
    *   **Difícil:** Implementar um contrato inteligente simples (em Solidity, executado em um ambiente de desenvolvimento como Remix) que gerencia a reputação do cliente ou a resolução de disputas, e interagir com ele via interface.
*   **Regra de Liberação:** Liberado após a conclusão do EP27.

### EP28: Sustentabilidade e CX Responsável
*   **Ideia de Aplicação:** **Calculadora de Impacto Ambiental do CX**
*   **Descrição:** Uma ferramenta onde o usuário pode inserir dados sobre as operações de CX (número de chamadas, e-mails, uso de energia) e a aplicação calcula o impacto ambiental (em emissões de CO2, por exemplo) e sugere melhorias para um CX mais sustentável.
*   **Tecnologias:** HTML, CSS, JavaScript (para o frontend) e Python/Java para os cálculos e sugestões no backend.
*   **Níveis de Dificuldade:**
    *   **Fácil:** Calculadora com fatores de conversão fixos e sugestões genéricas.
    *   **Intermediário:** Permitir a personalização dos fatores de conversão e a comparação do impacto entre diferentes cenários de operação.
    *   **Difícil:** Integrar com dados reais (ou simulados) de consumo de energia e emissões de carbono, e oferecer um dashboard de acompanhamento do impacto ambiental do CX ao longo do tempo.
*   **Regra de Liberação:** Liberado após a conclusão do EP28.
