/**
 * Função compartilhada para salvar pontuação de módulos bônus
 * Inclua este arquivo em todos os módulos que precisam salvar pontos
 */

/**
 * Salva a pontuação do módulo completado
 * @param {string} moduloCodigo - Código do módulo (ex: 'EP01_NPS')
 * @param {string} nivel - Nível completado ('facil', 'intermediario', 'dificil')
 */
async function salvarPontuacaoModulo(moduloCodigo, nivel) {
    try {
        console.log('💾 Salvando pontuação:', { moduloCodigo, nivel });

        if (typeof BonusService === 'undefined') {
            console.error('❌ BonusService não encontrado!');
            alert('❌ Erro: Sistema de pontuação não carregado. Recarregue a página.');
            return;
        }

        const resultado = await BonusService.completarModulo(moduloCodigo, nivel);

        console.log('📊 Resultado:', resultado);
        alert(resultado.message);

        if (resultado.success) {
            window.location.href = '../bonus.html';
        }
    } catch (error) {
        console.error('❌ Erro ao salvar pontuação:', error);
        alert('❌ Erro ao salvar sua pontuação: ' + error.message);
    }
}

// Disponibilizar globalmente
window.salvarPontuacaoModulo = salvarPontuacaoModulo;
