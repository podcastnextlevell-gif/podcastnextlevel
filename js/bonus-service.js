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
            console.log('🎯 Iniciando completarModulo:', { moduloCodigo, nivel });

            // 1. Buscar módulo no banco
            const { data: modulo, error: moduloError } = await supabaseClient
                .from('modulos_bonus')
                .select('*')
                .eq('codigo', moduloCodigo)
                .single();

            console.log('📦 Módulo encontrado:', modulo, moduloError);

            if (moduloError || !modulo) {
                console.error('❌ Erro ao buscar módulo:', moduloError);
                return {
                    success: false,
                    pontos: 0,
                    message: '❌ Módulo não encontrado no banco de dados.\n\nERRO: ' + (moduloError?.message || 'Desconhecido')
                };
            }

            // 2. Pegar user atual
            const { data: { user } } = await supabaseClient.auth.getUser();
            console.log('👤 Usuário autenticado:', user?.id);

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
                .select('id, nome_completo, pontuacao_total')
                .eq('auth_id', user.id)
                .single();

            console.log('👥 Perfil do usuário:', usuario, usuarioError);

            if (usuarioError || !usuario) {
                console.error('❌ Erro ao buscar perfil:', usuarioError);
                return {
                    success: false,
                    pontos: 0,
                    message: '❌ Perfil de usuário não encontrado.\n\nERRO: ' + (usuarioError?.message || 'Desconhecido')
                };
            }

            // 4. VALIDAR SE JÁ COMPLETOU (prevenir duplicação)
            const { data: jaCompletou, error: validacaoError } = await supabaseClient
                .from('progresso_modulos_bonus')
                .select('id')
                .eq('usuario_id', usuario.id)
                .eq('modulo_id', modulo.id)
                .eq('nivel', nivel)
                .maybeSingle();

            console.log('🔍 Verificação de duplicação:', { jaCompletou, validacaoError });

            if (jaCompletou) {
                console.warn('⚠️ Módulo já completado anteriormente');
                return {
                    success: false,
                    pontos: 0,
                    message: '⚠️ Você já completou este módulo neste nível!\n\nNão é possível ganhar pontos novamente.'
                };
            }

            // 5. Definir pontos baseado no nível
            const pontosMap = {
                'facil': modulo.pontos_facil,
                'intermediario': modulo.pontos_intermediario,
                'dificil': modulo.pontos_dificil
            };
            const pontosGanhos = pontosMap[nivel] || 0;

            console.log('💰 Pontos a serem ganhos:', pontosGanhos);

            // 6. Inserir progresso (trigger automático atualiza pontuacao_total)
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

            console.log('💾 Resultado da inserção:', { progresso, progressoError });

            if (progressoError) {
                console.error('❌ Erro ao salvar progresso:', progressoError);

                // Se já completou antes, UNIQUE constraint vai falhar
                if (progressoError.code === '23505') {
                    return {
                        success: false,
                        pontos: 0,
                        message: '⚠️ Você já completou este módulo neste nível!'
                    };
                }

                return {
                    success: false,
                    pontos: 0,
                    message: '❌ Erro ao salvar seu progresso.\n\nCÓDIGO: ' + progressoError.code + '\nMENSAGEM: ' + progressoError.message
                };
            }

            console.log('✅ Progresso salvo com sucesso!');

            // 7. Verificar se pontos foram realmente atualizados
            const { data: usuarioAtualizado } = await supabaseClient
                .from('usuarios')
                .select('pontuacao_total')
                .eq('id', usuario.id)
                .single();

            console.log('📊 Pontuação atual do usuário:', {
                antes: usuario.pontuacao_total,
                depois: usuarioAtualizado?.pontuacao_total,
                diferenca: (usuarioAtualizado?.pontuacao_total || 0) - (usuario.pontuacao_total || 0)
            });

            // 8. Sucesso!
            return {
                success: true,
                pontos: pontosGanhos,
                message: `🎉 Parabéns! Módulo concluído!\n\n+${pontosGanhos} pontos adicionados!\n\nTotal agora: ${usuarioAtualizado?.pontuacao_total || '?'} pontos`
            };

        } catch (error) {
            console.error('💥 Erro no completarModulo:', error);
            return {
                success: false,
                pontos: 0,
                message: '❌ Erro inesperado: ' + error.message
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

