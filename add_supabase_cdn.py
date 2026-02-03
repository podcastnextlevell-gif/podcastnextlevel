import os
import re

# Adicionar CDN do Supabase em todos os módulos
pasta = 'modulos-bonus'
cdn_script = '<script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>\n    '
contador = 0

for arquivo in os.listdir(pasta):
    if not arquivo.endswith('.html') or arquivo == 'TEMPLATE_INTEGRACAO.js':
        continue
    
    caminho = os.path.join(pasta, arquivo)
    
    with open(caminho, 'r', encoding='utf-8') as f:
        conteudo = f.read()
    
    # Verificar se já tem o CDN
    if '@supabase/supabase-js' in conteudo:
        print(f'✅ Já tem CDN: {arquivo}')
        continue
    
    # Adicionar antes do primeiro <script src="../js
    if '<script src="../js/supabase-config.js">' in conteudo:
        novo_conteudo = conteudo.replace(
            '<script src="../js/supabase-config.js">',
            cdn_script + '<script src="../js/supabase-config.js">'
        )
        
        with open(caminho, 'w', encoding='utf-8') as f:
            f.write(novo_conteudo)
        
        contador += 1
        print(f'✅ Atualizado: {arquivo}')
    else:
        print(f'⚠️  Padrão não encontrado: {arquivo}')

print(f'\n🎉 {contador} arquivos atualizados!')
