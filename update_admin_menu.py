import os
import re

# Arquivos admin para atualizar
arquivos = [
    'admin/usuarios.html',
    'admin/temporadas.html',
    'admin/provas.html',
    'admin/episodios.html',
    'admin/certificados.html'
]

# Link para adicionar
link_bonus = '''                <a href="/admin-bonus.html" class="sidebar-link">
                    <span class="material-symbols-outlined text-[20px]">emoji_events</span>
                    Módulos Bônus
                </a>'''

for arquivo in arquivos:
    if not os.path.exists(arquivo):
        print(f'❌ Não encontrado: {arquivo}')
        continue
    
    with open(arquivo, 'r', encoding='utf-8') as f:
        conteudo = f.read()
    
    # Procurar padrão: Provas + fechamento de nav
    # Adicionar link antes de </nav>
    if 'Módulos Bônus' not in conteudo and 'Provas' in conteudo:
        # Encontrar o padrão: Provas</a> seguido por </nav>
        pattern = r'(Provas\s*</a>)\s*(</nav>)'
        replacement = r'\1\n' + link_bonus + r'\n                \2'
        
        novo_conteudo = re.sub(pattern, replacement, conteudo)
        
        if novo_conteudo != conteudo:
            with open(arquivo, 'w', encoding='utf-8') as f:
                f.write(novo_conteudo)
            print(f'✅ Atualizado: {arquivo}')
        else:
            print(f'⚠️  Padrão não encontrado em: {arquivo}')
    else:
        print(f'ℹ️  Já tem ou não precisa: {arquivo}')

print('\n🎉 Concluído!')
