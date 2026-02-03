// ============================================
// 📚 BONUS SERVICE - Gerenciamento de Módulos Bônus
// ============================================

const BonusService = {
    /**
     *  Completa um módulo bônus e registra pontos
     * @param {string} moduloCodigo - Código do módulo (ex: 'EP00A_ROI')
     * @param {string} nivel - 'facil', 'intermediario' ou 'dificil'
     * @returns {Promise<{success: boolean, pontos: number, message: string}>}
     */
    async completarModulo(moduloCodigo, nivel) {
        try {
            // 1. Buscar módulo no banco
            const { data: modulo, error: moduloError } = await supabaseClient
                .from('modulos_bonus')
                .select('*')
                .eq('codigo', moduloCodigo)
                .single();

            if (moduloError || !modulo) {
                console.error('Erro ao buscar módulo:', moduloError);
                return {
                    success: false,
                    pontos: 0,
                    message: '❌ Módulo não encontrado no banco de dados.'
                };
            }

            // 2. Pegar user atual
            const { data: { user } } = await supabaseClient.auth.getUser();
            if (!user) {
                return {
                    success: false,
                    pontos: 0,
                    message: '❌ Usuário não autenticado.'
                };
            }

            // 3. Buscar ID do usuário na tabela usuarios
            const { data: usuario, error: usuarioError } = await supabaseClient
                .from('usuarios')
                .select('id')
                .eq('auth_id', user.id)
                .single();

            if (usuarioError || !usuario) {
                console.error('Erro ao buscar usuário:', usuarioError);
                return {
                    success: false,
                    pontos: 0,
                    message: '❌ Perfil de usuário não encontrado.'
                };
            }

            // 4. Definir pontos baseado no nível
            const pontosMap = {
                'facil': modulo.pontos_facil,
                'intermediario': modulo.pontos_intermediario,
                'dificil': modulo.pontos_dificil
            };
            const pontosGanhos = pontosMap[nivel] || 0;

            // 5. Inserir progresso (trigger automático atualiza pontuacao_total)
            const { data: progresso, error: progressoError } = await supabaseClient
                .from('progresso_modulos_bonus')
                .insert({
                    usuario_id: usuario.id,
                    modulo_id: modulo.id,
                    nivel: nivel,
                    pontos_ganhos: pontosGanhos
                })
                .select()
                .single();

            if (progressoError) {
                // Se já completou antes, UNIQUE constraint vai falhar
                if (progressoError.code === '23505') {
                    return {
                        success: false,
                        pontos: 0,
                        message: '⚠️ Você já completou este módulo neste nível!'
                    };
                }

                console.error('Erro ao salvar progresso:', progressoError);
                return {
                    success: false,
                    pontos: 0,
                    message: '❌ Erro ao salvar seu progresso.'
                };
            }

            // 6. Sucesso!
            return {
                success: true,
                pontos: pontosGanhos,
                message: `🎉 Parabéns! Módulo concluído!\n\n+${pontosGanhos} pontos adicionados ao seu perfil!`
            };

        } catch (error) {
            console.error('Erro no completarModulo:', error);
            return {
                success: false,
                pontos: 0,
                message: '❌ Erro inesperado. Tente novamente.'
            };
        }
    },

    /**
     * Busca progresso do usuário em todos os módulos
     * @returns {Promise<Array>}
     */
    async getProgressoUsuario() {
        try {
            const { data: { user } } = await supabaseClient.auth.getUser();
            if (!user) return [];

            const { data: usuario } = await supabaseClient
                .from('usuarios')
                .select('id')
                .eq('auth_id', user.id)
                .single();

            if (!usuario) return [];

            const { data, error } = await supabaseClient
                .from('progresso_modulos_bonus')
                .select(`
                    *,
                    modulos_bonus (codigo, nome, temporada)
                `)
                .eq('usuario_id', usuario.id);

            if (error) {
                console.error('Erro ao buscar progresso:', error);
                return [];
            }

            return data || [];
        } catch (error) {
            console.error('Erro no getProgressoUsuario:', error);
            return [];
        }
    },

    /**
     * Verifica se módulo já foi completado em determinado nível
     * @param {string} moduloCodigo
     * @param {string} nivel
     * @returns {Promise<boolean>}
     */
    async moduloCompletado(moduloCodigo, nivel) {
        try {
            const progresso = await this.getProgressoUsuario();
            return progresso.some(p =>
                p.modulos_bonus.codigo === moduloCodigo &&
                p.nivel === nivel
            );
        } catch (error) {
            console.error('Erro no moduloCompletado:', error);
            return false;
        }
    },

    /**
     * Calcula estatísticas do usuário nos módulos bônus
     * @returns {Promise<{completados: number, pontos: number, temporadas: Set, nivelMedio: string}>}
     */
    async getEstatisticas() {
        try {
            const progresso = await this.getProgressoUsuario();

            const completados = new Set(progresso.map(p => p.modulos_bonus.codigo)).size;
            const pontos = progresso.reduce((sum, p) => sum + p.pontos_ganhos, 0);
            const temporadas = new Set(progresso.map(p => p.modulos_bonus.temporada));

            // Calcular nível médio
            const niveis = progresso.map(p => p.nivel);
            const contagem = {
                facil: niveis.filter(n => n === 'facil').length,
                intermediario: niveis.filter(n => n === 'intermediario').length,
                dificil: niveis.filter(n => n === 'dificil').length
            };

            let nivelMedio = '-';
            if (contagem.dificil > contagem.intermediario && contagem.dificil > contagem.facil) {
                nivelMedio = 'Difícil';
            } else if (contagem.intermediario >= contagem.facil && contagem.intermediario >= contagem.dificil) {
                nivelMedio = 'Intermediário';
            } else if (contagem.facil > 0) {
                nivelMedio = 'Fácil';
            }

            return {
                completados,
                pontos,
                temporadas: temporadas.size,
                nivelMedio
            };
        } catch (error) {
            console.error('Erro no getEstatisticas:', error);
            return {
                completados: 0,
                pontos: 0,
                temporadas: 0,
                nivelMedio: '-'
            };
        }
    }
};

// Exportar globalmente
window.BonusService = BonusService;

