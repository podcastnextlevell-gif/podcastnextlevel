// ============================================
// 🎙️ NEXT LEVEL PODCAST - Authentication Module
// ============================================
// Requer: supabase-config.js carregado antes

const ADMIN_EMAIL = 'podcastnextlevell@gmail.com';

// ============================================
// Funções de Autenticação
// ============================================

/**
 * Login do usuário
 * @param {string} email 
 * @param {string} password 
 * @returns {Promise<{success: boolean, error?: string}>}
 */
async function login(email, password) {
    try {
        showLoading(true);

        const { data, error } = await supabaseClient.auth.signInWithPassword({
            email: email.trim().toLowerCase(),
            password: password
        });

        if (error) {
            showLoading(false);
            return { success: false, error: traduzirErro(error.message) };
        }

        // Buscar perfil do usuário
        const profile = await getUserProfile();

        if (!profile) {
            showLoading(false);
            return { success: false, error: 'Perfil não encontrado. Entre em contato com o suporte.' };
        }

        showLoading(false);

        // Redirecionar baseado no perfil
        await redirectByRole();

        return { success: true };

    } catch (err) {
        showLoading(false);
        console.error('Erro no login:', err);
        return { success: false, error: 'Erro inesperado. Tente novamente.' };
    }
}

/**
 * Cadastro de novo usuário
 * @param {Object} dados 
 * @returns {Promise<{success: boolean, error?: string}>}
 */
async function cadastrar(dados) {
    try {
        showLoading(true);

        const { nome_completo, nickname, email, password, matricula, cargo, area_atuacao } = dados;

        // Validações
        if (!nome_completo || !nickname || !email || !password) {
            showLoading(false);
            return { success: false, error: 'Preencha todos os campos obrigatórios.' };
        }

        if (password.length < 6) {
            showLoading(false);
            return { success: false, error: 'A senha deve ter no mínimo 6 caracteres.' };
        }

        // Criar usuário no Supabase Auth
        const { data: authData, error: authError } = await supabaseClient.auth.signUp({
            email: email.trim().toLowerCase(),
            password: password,
            options: {
                data: {
                    nome_completo: nome_completo,
                    nickname: nickname
                }
            }
        });

        if (authError) {
            showLoading(false);
            return { success: false, error: traduzirErro(authError.message) };
        }

        // Determinar se é admin
        const isAdminUser = email.trim().toLowerCase() === ADMIN_EMAIL;

        // Criar perfil na tabela usuarios
        const { error: profileError } = await supabaseClient
            .from('usuarios')
            .insert({
                auth_id: authData.user.id,
                nome_completo: nome_completo.trim(),
                nickname: nickname.trim(),
                email: email.trim().toLowerCase(),
                matricula: matricula?.trim() || null,
                cargo: cargo || null,
                area_atuacao: area_atuacao || null,
                is_admin: isAdminUser,
                status: isAdminUser ? 'aprovado' : 'pendente',
                pontuacao_total: 0
            });

        if (profileError) {
            showLoading(false);
            console.error('Erro ao criar perfil:', profileError);
            return { success: false, error: 'Erro ao criar perfil. Tente novamente.' };
        }

        showLoading(false);

        return {
            success: true,
            message: isAdminUser
                ? 'Conta admin criada com sucesso!'
                : 'Cadastro realizado! Aguarde aprovação do administrador.'
        };

    } catch (err) {
        showLoading(false);
        console.error('Erro no cadastro:', err);
        return { success: false, error: 'Erro inesperado. Tente novamente.' };
    }
}

/**
 * Logout do usuário
 */
async function logout() {
    showLoading(true);
    await supabaseClient.auth.signOut();
    showLoading(false);
    window.location.href = 'index.html';
}

/**
 * Solicitar recuperação de senha
 * @param {string} email 
 * @returns {Promise<{success: boolean, error?: string}>}
 */
async function recuperarSenha(email) {
    try {
        showLoading(true);

        const { error } = await supabaseClient.auth.resetPasswordForEmail(email.trim().toLowerCase(), {
            redirectTo: window.location.origin + '/redefinir-senha.html'
        });

        showLoading(false);

        if (error) {
            return { success: false, error: traduzirErro(error.message) };
        }

        return {
            success: true,
            message: 'Email de recuperação enviado! Verifique sua caixa de entrada.'
        };

    } catch (err) {
        showLoading(false);
        console.error('Erro na recuperação:', err);
        return { success: false, error: 'Erro ao enviar email. Tente novamente.' };
    }
}

/**
 * Redefinir senha com token
 * @param {string} newPassword 
 * @returns {Promise<{success: boolean, error?: string}>}
 */
async function redefinirSenha(newPassword) {
    try {
        showLoading(true);

        if (newPassword.length < 6) {
            showLoading(false);
            return { success: false, error: 'A senha deve ter no mínimo 6 caracteres.' };
        }

        const { error } = await supabaseClient.auth.updateUser({
            password: newPassword
        });

        showLoading(false);

        if (error) {
            return { success: false, error: traduzirErro(error.message) };
        }

        return {
            success: true,
            message: 'Senha alterada com sucesso!'
        };

    } catch (err) {
        showLoading(false);
        console.error('Erro ao redefinir senha:', err);
        return { success: false, error: 'Erro ao alterar senha. Tente novamente.' };
    }
}

/**
 * Traduz mensagens de erro do Supabase para português
 * @param {string} message 
 * @returns {string}
 */
function traduzirErro(message) {
    const traducoes = {
        'Invalid login credentials': 'Email ou senha incorretos.',
        'Email not confirmed': 'Confirme seu email antes de fazer login.',
        'User already registered': 'Este email já está cadastrado.',
        'Password should be at least 6 characters': 'A senha deve ter no mínimo 6 caracteres.',
        'Unable to validate email address: invalid format': 'Formato de email inválido.',
        'Email rate limit exceeded': 'Muitas tentativas. Aguarde alguns minutos.',
        'For security purposes, you can only request this once every 60 seconds': 'Aguarde 60 segundos antes de tentar novamente.'
    };

    return traducoes[message] || message;
}

/**
 * Listener para mudanças de autenticação
 */
supabaseClient.auth.onAuthStateChange((event, session) => {
    console.log('Auth event:', event);

    if (event === 'SIGNED_OUT') {
        // Limpar dados locais se necessário
        localStorage.removeItem('userProfile');
    }

    if (event === 'PASSWORD_RECOVERY') {
        // Usuário está no fluxo de recuperação de senha
        if (!window.location.pathname.includes('redefinir-senha')) {
            window.location.href = 'redefinir-senha.html';
        }
    }
});

console.log('🔐 Módulo de autenticação carregado!');
