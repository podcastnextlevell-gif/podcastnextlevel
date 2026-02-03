import os
import re

# Mapeamento de códigos e níveis dos módulos
modulos = {
    'EP00A_calculadora_roi.html': ('EP00A_ROI', 'facil'),
    'EP00B_roadmap.html': ('EP00B_ROADMAP', 'facil'),
    'EP01_jornada.html': ('EP01_JORNADA', 'facil'),
    'EP02_sentimento.html': ('EP02_VOC', 'facil'),
    'EP03_metricas.html': ('EP03_METRICAS', 'facil'),
    'EP04_handoff.html': ('EP04_OMNI', 'facil'),
    'EP05_script.html': ('EP05_EMOCAO', 'facil'),
    'EP06_churn.html': ('EP06_PREDITIVO', 'facil'),
    'EP07_chatbot.html': ('EP07_CHATBOT', 'facil'),
    'EP08_ml_churn.html': ('EP08_ML_CHURN', 'facil'),
    'EP09_recomendador.html': ('EP09_RECOMENDADOR', 'facil'),
    'EP10_sql.html': ('EP10_SQL', 'facil'),
    'EP11_teste_ab.html': ('EP11_ESTATISTICA', 'facil'),
    'EP12_dashboard.html': ('EP12_DASHBOARD', 'facil'),
    'EP13_relatorios.html': ('EP13_RELATORIOS', 'facil'),
    'EP14_validador.html': ('EP14_SCRAPING', 'facil'),
    'EP15_scraping.html': ('EP15_NLP', 'facil'),
    'EP16_comunicacao.html': ('EP16_COMUNICACAO', 'facil'),
    'EP17_negociacao.html': ('EP17_LIDERANCA', 'facil'),
    'EP18_conflitos.html': ('EP18_NEGOCIACAO', 'facil'),
    'EP19_zendesk.html': ('EP19_POWERBI', 'facil'),
    'EP20_powerbi.html': ('EP20_NOCODE', 'facil'),
    'EP21_excel.html': ('EP21_API', 'facil'),
    'EP22_piloto.html': ('EP22_PROJETO_CHURN', 'facil'),
    'EP23_kaizen.html': ('EP23_PROJETO_DASHBOARD', 'facil'),
    'EP24_business_case.html': ('EP24_PROJETO_FEEDBACK', 'facil'),
    'EP25_ia_generativa.html': ('EP25_METAVERSO', 'facil'),
    'EP26_futuro.html': ('EP26_RA', 'facil'),
}

# Função completarModulo correta (template com placeholders)
def gerar_funcao(codigo, nivel, pontos):
    return f'''async function completarModulo() {{
            const btn = event.target;
            btn.disabled = true;
            btn.textContent = '⏳ Salvando...';

            try {{
                const resultado = await BonusService.completarModulo('{codigo}', '{nivel}');

                if (resultado.success) {{
                    alert(resultado.message);
                    window.location.href = '../bonus.html';
                }} else {{
                    alert(resultado.message);
                    btn.disabled = false;
                    btn.textContent = '✅ CONCLUIR MÓDULO (+{pontos} PONTOS)';
                }}
            }} catch (error) {{
                console.error('Erro:', error);
                alert('❌ Erro ao salvar progresso. Tente novamente.');
                btn.disabled = false;
                btn.textContent = '✅ CONCLUIR MÓDULO (+{pontos} PONTOS)';
            }}
        }}'''

# Scripts para adicionar no <head>
scripts_head = '''    <script src="../js/supabase-config.js"></script>
    <script src="../js/auth.js"></script>
    <script src="../js/bonus-service.js"></script>'''

pasta = 'modulos-bonus'
contador = 0

for arquivo, (codigo, nivel) in modulos.items():
    caminho = os.path.join(pasta, arquivo)
    
    if not os.path.exists(caminho):
        print(f'❌ Não encontrado: {arquivo}')
        continue
    
    with open(caminho, 'r', encoding='utf-8') as f:
        conteudo = f.read()
    
    alterado = False
    
    # 1. Adicionar scripts se não existirem
    if 'bonus-service.js' not in conteudo:
        # Procurar </head>
        if '</head>' in conteudo:
            conteudo = conteudo.replace('</head>', f'{scripts_head}\n</head>')
            alterado = True
    
    # 2. Substituir pontuação nos botões (50→5, 100→10, 200→20)
    conteudo = re.sub(r'\+50 PONTOS', '+5 PONTOS', conteudo)
    conteudo = re.sub(r'\+100 PONTOS', '+10 PONTOS', conteudo)
    conteudo = re.sub(r'\+200 PONTOS', '+20 PONTOS', conteudo)
    
    # 3. Substituir função completarModulo
    # Encontrar função existente
    pattern_funcao = r'function completarModulo\(\)\s*\{[^}]*\}'
    
    if re.search(pattern_funcao, conteudo):
        nova_funcao = gerar_funcao(codigo, nivel, '5')
        conteudo = re.sub(pattern_funcao, nova_funcao.strip(), conteudo, flags=re.DOTALL)
        alterado = True
    
    # 4. Salvar arquivo se houve mudanças
    if alterado or '50 PONTOS' in conteudo or '100 PONTOS' in conteudo:
        with open(caminho, 'w', encoding='utf-8') as f:
            f.write(conteudo)
        contador += 1
        print(f'✅ Atualizado: {arquivo}')

print(f'\n🎉 {contador} arquivos atualizados!')
