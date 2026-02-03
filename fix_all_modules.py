"""
Script DEFINITIVO para corrigir TODOS os módulos bônus.
Adiciona chamada ao BonusService.completarModulo() onde necessário.
"""

import os
import re

MODULOS_DIR = r"c:\Users\Fernando\.gemini\antigravity\scratch\podcast IA\modulos-bonus"

# Mapeamento de arquivo -> código do módulo no banco de dados
MODULO_CODES = {
    "EP00A_calculadora_roi.html": "EP00A_ROI",
    "EP00B_roadmap.html": "EP00B_META",
    "EP01_jornada.html": "EP01_NPS",
    "EP02_sentimento.html": "EP02_JORNADA",
    "EP03_metricas.html": "EP03_VOC",
    "EP04_handoff.html": "EP04_CES",
    "EP05_script.html": "EP05_CHURN",
    "EP06_churn.html": "EP06_SENTIMENTO",
    "EP07_chatbot.html": "EP07_CHATBOT",
    "EP08_ml_churn.html": "EP08_ML_CHURN",
    "EP09_recomendador.html": "EP09_RECOMENDADOR",
    "EP10_sql.html": "EP10_SQL",
    "EP11_teste_ab.html": "EP11_ESTATISTICA",
    "EP12_dashboard.html": "EP12_DASHBOARD",
    "EP13_relatorios.html": "EP13_RELATORIOS",
    "EP14_validador.html": "EP14_SCRAPING",
    "EP15_scraping.html": "EP15_NLP",
    "EP16_comunicacao.html": "EP16_COMUNICACAO",
    "EP17_negociacao.html": "EP17_LIDERANCA",
    "EP18_conflitos.html": "EP18_NEGOCIACAO",
    "EP19_zendesk.html": "EP19_POWERBI",
    "EP20_powerbi.html": "EP20_NOCODE",
    "EP21_excel.html": "EP21_API",
    "EP22_piloto.html": "EP22_PROJETO_CHURN",
    "EP23_kaizen.html": "EP23_PROJETO_DASHBOARD",
    "EP24_business_case.html": "EP24_PROJETO_FEEDBACK",
    "EP25_ia_generativa.html": "EP25_METAVERSO",
    "EP26_futuro.html": "EP26_RA"
}

def fix_module(filepath, module_code):
    """
    Corrige um módulo para usar BonusService.completarModulo()
    """
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Verificar se já tem a integração correta
    if f"BonusService.completarModulo('{module_code}'" in content:
        print(f"✅ {os.path.basename(filepath)} - JÁ INTEGRADO")
        return "ok"
    
    # Se tem BonusService mas com código errado, corrigir
    if "BonusService.completarModulo" in content:
        # Corrigir código do módulo
        pattern = r"BonusService\.completarModulo\(['\"][^'\"]+['\"]"
        new_content = re.sub(pattern, f"BonusService.completarModulo('{module_code}'", content)
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"🔧 {os.path.basename(filepath)} - CÓDIGO CORRIGIDO")
        return "fixed"
    
    # Não tem integração - precisa adicionar
    # Procurar padrões comuns de conclusão
    
    # Verificar se tem currentLevel (módulos com seleção de nível)
    has_level = 'currentLevel' in content
    
    # Padrão 1: alert(...pontos...) seguido de window.location ou setTimeout
    # Vamos procurar onde salvar os pontos
    
    # Encontrar a função que tem o redirect para bonus.html
    pattern_redirect = r"window\.location\.href\s*=\s*['\"]\.\.\/bonus\.html['\"]"
    matches = list(re.finditer(pattern_redirect, content))
    
    if not matches:
        print(f"⚠️ {os.path.basename(filepath)} - SEM REDIRECT (verificar manualmente)")
        return "manual"
    
    # Para cada match, verificar se está dentro de um if/success
    # Vamos pegar o primeiro e adicionar a chamada do BonusService
    
    # Adicionar função helper antes do </script>
    nivel_param = "currentLevel" if has_level else "'facil'"
    
    helper_function = f'''
        // Integração com sistema de pontuação
        async function salvarPontuacaoBonus(nivel) {{
            const resultado = await BonusService.completarModulo('{module_code}', nivel);
            alert(resultado.message);
            if (resultado.success) {{
                window.location.href = '../bonus.html';
            }}
        }}
'''
    
    # Inserir a função helper antes do </script>
    new_content = content.replace('</script>', helper_function + '\n    </script>')
    
    # Agora substituir os redirects por chamadas à função
    # Precisamos ser cuidadosos para não quebrar o código
    
    # Primeiro, remover os alerts que vêm antes dos redirects
    # e substituir tudo pela chamada da função
    
    # Padrão: alert(...); ... window.location.href = '../bonus.html';
    # ou: setTimeout(() => window.location.href = '../bonus.html', ...);
    
    # Simplificar: substituir apenas o redirect por chamada da função
    replacement = f"salvarPontuacaoBonus({nivel_param}); return;"
    new_content = re.sub(
        r"(alert\([^)]+\);\s*\n?\s*)?(setTimeout\(\(\)\s*=>\s*)?window\.location\.href\s*=\s*['\"]\.\.\/bonus\.html['\"]\s*,?\s*\d*\s*\)?;?",
        replacement,
        new_content
    )
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_content)
    
    print(f"🔧 {os.path.basename(filepath)} - INTEGRAÇÃO ADICIONADA")
    return "fixed"

def main():
    print("=" * 60)
    print("🔧 CORREÇÃO DEFINITIVA DE TODOS OS MÓDULOS BÔNUS")
    print("=" * 60)
    print()
    
    stats = {"ok": 0, "fixed": 0, "manual": 0, "error": 0}
    
    for filename, module_code in MODULO_CODES.items():
        filepath = os.path.join(MODULOS_DIR, filename)
        if os.path.exists(filepath):
            try:
                result = fix_module(filepath, module_code)
                stats[result] = stats.get(result, 0) + 1
            except Exception as e:
                print(f"❌ {filename} - ERRO: {e}")
                stats["error"] += 1
        else:
            print(f"❌ {filename} - ARQUIVO NÃO ENCONTRADO")
            stats["error"] += 1
    
    print()
    print("=" * 60)
    print("📊 RESULTADO FINAL:")
    print(f"   ✅ Já integrados: {stats.get('ok', 0)}")
    print(f"   🔧 Corrigidos: {stats.get('fixed', 0)}")
    print(f"   ⚠️ Manuais: {stats.get('manual', 0)}")
    print(f"   ❌ Erros: {stats.get('error', 0)}")
    print("=" * 60)

if __name__ == "__main__":
    main()
