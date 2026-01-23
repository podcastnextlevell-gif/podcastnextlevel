// ============================================
// 🎙️ NEXT LEVEL PODCAST - Supabase Configuration
// ============================================
// NUNCA coloque a service_role key aqui!
// Apenas a anon key é segura para uso no frontend.

const SUPABASE_URL = 'https://dnmeeirmjljmvbwcsdpx.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRubWVlaXJtamxqbXZid2NzZHB4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njg4NzE0MjgsImV4cCI6MjA4NDQ0NzQyOH0.byVDQ9a1RtqI4WdyC89tDerYBjXaWCRU1jyLVrX8Q3Y';

// Inicializar cliente Supabase (usando nome diferente para evitar conflito com CDN)
const supabaseClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

// ============================================
// Funções Utilitárias
// ============================================

/**
 * Verifica se há um usuário logado
 * @returns {Promise<Object|null>} Dados do usuário ou null
 */
async function getUser() {
    const { data: { user } } = await supabaseClient.auth.getUser();
    return user;
}

/**
 * Obtém o perfil completo do usuário logado
 * @returns {Promise<Object|null>} Perfil do usuário ou null
 */
async function getUserProfile() {
    const user = await getUser();
    if (!user) return null;

    const { data, error } = await supabaseClient
        .from('usuarios')
        .select('*')
        .eq('auth_id', user.id)
        .single();

    if (error) {
        console.error('Erro ao buscar perfil:', error);
        return null;
    }
    return data;
}

/**
 * Verifica se o usuário atual é administrador
 * @returns {Promise<boolean>}
 */
async function isAdmin() {
    const profile = await getUserProfile();
    return profile?.is_admin === true;
}

/**
 * Verifica se o usuário está aprovado
 * @returns {Promise<boolean>}
 */
async function isAprovado() {
    const profile = await getUserProfile();
    return profile?.status === 'aprovado';
}

/**
 * Redireciona usuário baseado em seu perfil
 */
async function redirectByRole() {
    const profile = await getUserProfile();

    if (!profile) {
        window.location.href = 'login.html';
        return;
    }

    if (profile.status === 'pendente') {
        window.location.href = 'pendente.html';
        return;
    }

    if (profile.status === 'reprovado') {
        window.location.href = 'reprovado.html';
        return;
    }

    if (profile.is_admin) {
        window.location.href = 'admin/index.html';
    } else {
        window.location.href = 'dashboard.html';
    }
}

/**
 * Protege página - redireciona se não autenticado
 */
async function protectPage() {
    const user = await getUser();
    if (!user) {
        window.location.href = 'login.html';
        return false;
    }
    return true;
}

/**
 * Protege página admin - redireciona se não for admin
 */
async function protectAdminPage() {
    const user = await getUser();
    if (!user) {
        window.location.href = '../login.html';
        return false;
    }

    const admin = await isAdmin();
    if (!admin) {
        window.location.href = '../dashboard.html';
        return false;
    }
    return true;
}

/**
 * Formata data para exibição
 * @param {string} dateString 
 * @returns {string}
 */
function formatDate(dateString) {
    if (!dateString) return '-';
    return new Date(dateString).toLocaleDateString('pt-BR');
}

/**
 * Formata data e hora para exibição
 * @param {string} dateString 
 * @returns {string}
 */
function formatDateTime(dateString) {
    if (!dateString) return '-';
    return new Date(dateString).toLocaleString('pt-BR');
}

/**
 * Gera código único para certificados
 * @returns {string}
 */
function generateCertificateCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    let code = 'NLP-';
    for (let i = 0; i < 8; i++) {
        code += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return code;
}

/**
 * Mostra notificação toast
 * @param {string} message 
 * @param {string} type - 'success', 'error', 'warning', 'info'
 */
function showToast(message, type = 'info') {
    // Remove toast anterior se existir
    const existingToast = document.querySelector('.toast-notification');
    if (existingToast) existingToast.remove();

    const colors = {
        success: 'bg-green-500',
        error: 'bg-red-500',
        warning: 'bg-yellow-500',
        info: 'bg-blue-500'
    };

    const icons = {
        success: 'check_circle',
        error: 'error',
        warning: 'warning',
        info: 'info'
    };

    const toast = document.createElement('div');
    toast.className = `toast-notification fixed top-4 right-4 z-50 ${colors[type]} text-white px-6 py-4 rounded-xl shadow-2xl flex items-center gap-3 transform translate-x-full transition-transform duration-300`;
    toast.innerHTML = `
        <span class="material-symbols-outlined">${icons[type]}</span>
        <span>${message}</span>
    `;

    document.body.appendChild(toast);

    // Animar entrada
    setTimeout(() => toast.classList.remove('translate-x-full'), 10);

    // Remover após 4 segundos
    setTimeout(() => {
        toast.classList.add('translate-x-full');
        setTimeout(() => toast.remove(), 300);
    }, 4000);
}

/**
 * Mostra loading overlay
 * @param {boolean} show 
 */
function showLoading(show = true) {
    let overlay = document.getElementById('loading-overlay');

    if (show && !overlay) {
        overlay = document.createElement('div');
        overlay.id = 'loading-overlay';
        overlay.className = 'fixed inset-0 bg-black/80 z-50 flex items-center justify-center';
        overlay.innerHTML = `
            <div class="flex flex-col items-center gap-4">
                <div class="w-12 h-12 border-4 border-aec-pink border-t-transparent rounded-full animate-spin"></div>
                <p class="text-white text-sm">Carregando...</p>
            </div>
        `;
        document.body.appendChild(overlay);
    } else if (!show && overlay) {
        overlay.remove();
    }
}

console.log('🎙️ Next Level Podcast - Supabase configurado com sucesso!');
