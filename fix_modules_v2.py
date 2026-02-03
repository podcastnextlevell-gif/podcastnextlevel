"""
Script para adicionar integração de pontuação em TODOS os módulos bônus.
Versão segura e cuidadosa.
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
    Adiciona integração ao módulo
    """
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Verificar se já tem integração completa
    if f"salvarPontuacaoModulo('{module_code}'" in content:
        print(f"✅ {os.path.basename(filepath)} - JÁ OK")
        return "ok"
    
    if "BonusService.completarModulo" in content:
        print(f"✅ {os.path.basename(filepath)} - JÁ TEM BONUS SERVICE")
        return "ok"
    
    modified = False
    new_content = content
    
    # 1. Adicionar script bonus-save.js se não existir
    if 'bonus-save.js' not in new_content:
        # Adicionar depois de bonus-service.js
        new_content = new_content.replace(
            '<script src="../js/bonus-service.js"></script>',
            '<script src="../js/bonus-service.js"></script>\n    <script src="../js/bonus-save.js"></script>'
        )
        modified = True
    
    # 2. Verificar se tem currentLevel
    has_level = 'currentLevel' in new_content
    nivel_param = "currentLevel" if has_level else "'facil'"
    
    # 3. Procurar por pontos e redirect
    # Padrão: alert com pontos conquistados seguido de setTimeout/redirect
    
    # Encontrar linhas com "pontos conquistados" ou similares
    pattern_success = r"(alert\([`'\"][^`'\"]*(?:pontos|pts|Parabéns|Excelente|concluído)[^`'\"]*[`'\"].*?);?\s*\n\s*(setTimeout\([^)]*bonus\.html[^)]*\)|window\.location\.href\s*=\s*['\"]\.\.\/bonus\.html['\"])"
    
    def replacer(match):
        return f"salvarPontuacaoModulo('{module_code}', {nivel_param});"
    
    new_content_fixed = re.sub(pattern_success, replacer, new_content, flags=re.IGNORECASE | re.DOTALL)
    
    if new_content_fixed != new_content:
        new_content = new_content_fixed
        modified = True
    
    if modified:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"🔧 {os.path.basename(filepath)} - CORRIGIDO")
        return "fixed"
    else:
        print(f"⚠️ {os.path.basename(filepath)} - VERIFICAR MANUAL")
        return "manual"

def main():
    print("=" * 60)
    print("🔧 CORREÇÃO DOS MÓDULOS BÔNUS - VERSÃO SEGURA")
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
            print(f"❌ {filename} - NÃO ENCONTRADO")
            stats["error"] += 1
    
    print()
    print("=" * 60)
    print("📊 RESULTADO:")
    print(f"   ✅ OK: {stats.get('ok', 0)}")
    print(f"   🔧 Corrigidos: {stats.get('fixed', 0)}")
    print(f"   ⚠️ Manual: {stats.get('manual', 0)}")
    print(f"   ❌ Erros: {stats.get('error', 0)}")
    print("=" * 60)

if __name__ == "__main__":
    main()
