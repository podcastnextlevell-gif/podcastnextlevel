// ============================================
// TEMPLATE PARA MÓDULOS BÔNUS
// Copie este código e adapte para seu módulo
// ============================================

/*
INSTRUÇÕES:
1. Inclua os scripts necessários no HTML:
   <script src="../js/supabase-config.js"></script>
   <script src="../js/auth.js"></script>
   <script src="../js/bonus-service.js"></script>

2. Defina as constantes do módulo:
*/

const MODULO_CODIGO = 'EP00A_ROI'; // ⚠️ ALTERE PARA O CÓDIGO DO SEU MÓDULO
const NIVEL_ATUAL = 'facil'; // Ou capture do URL param

/*
3. Função para completar módulo (substitua os TODOs):
*/

async function completarModulo() {
    // Validação se módulo foi realmente concluído
    // ⚠️ ADICIONE SUA LÓGICA DE VALIDAÇÃO AQUI
    if (!validarConclusao()) {
        alert('⚠️ Complete todos os requisitos antes de finalizar!');
        return;
    }

    // Desabilita botão para evitar duplo clique
    const btn = event.target;
    btn.disabled = true;
    btn.textContent = '⏳ Salvando...';

    try {
        // Chama service para salvar progresso
        const resultado = await BonusService.completarModulo(MODULO_CODIGO, NIVEL_ATUAL);

        if (resultado.success) {
            // Sucesso!
            alert(resultado.message);
            window.location.href = '../bonus.html';
        } else {
            // Erro ou já completado
            alert(resultado.message);
            btn.disabled = false;
            btn.textContent = '✅ CONCLUIR MÓDULO';
        }
    } catch (error) {
        console.error('Erro ao completar módulo:', error);
        alert('❌ Erro ao salvar progresso. Tente novamente.');
        btn.disabled = false;
        btn.textContent = '✅ CONCLUIR MÓDULO';
    }
}

/*
4. Função de validação (PERSONALIZE PARA SEU MÓDULO)
*/
function validarConclusao() {
    // Exemplos de validação:
    // - Verificar se usuário preencheu todos os campos
    // - Verificar se completou todos os passos
    // - Verificar pontuação mínima em quiz
    // etc.

    return true; // ⚠️ ALTERE PARA SUA LÓGICA
}

/*
5. No HTML, botão deve chamar a função:
   <button onclick="completarModulo()">
       ✅ CONCLUIR MÓDULO (+5 PONTOS)
   </button>

6. Para capturar nível do URL (OPCIONAL):
   const urlParams = new URLSearchParams(window.location.search);
   const NIVEL_ATUAL = urlParams.get('nivel') || 'facil';
*/
