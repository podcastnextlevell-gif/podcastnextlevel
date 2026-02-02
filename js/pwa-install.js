// PWA Installation Manager - Next Level Podcast
let deferredPrompt = null;
let isInstalled = false;

// Detecta se já está instalado
if (window.matchMedia('(display-mode: standalone)').matches || window.navigator.standalone === true) {
    isInstalled = true;
    console.log('[PWA] App já está instalado');
}

// Registra Service Worker
if ('serviceWorker' in navigator) {
    window.addEventListener('load', async () => {
        try {
            const registration = await navigator.serviceWorker.register('/service-worker.js', {
                scope: '/'
            });

            console.log('[PWA] Service Worker registrado com sucesso:', registration.scope);

            // Verifica atualizações periodicamente
            setInterval(() => {
                registration.update();
            }, 60000); // A cada 1 minuto

            // Detecta nova versão disponível
            registration.addEventListener('updatefound', () => {
                const newWorker = registration.installing;

                newWorker.addEventListener('statechange', () => {
                    if (newWorker.state === 'installed' && navigator.serviceWorker.controller) {
                        // Nova versão disponível
                        showUpdateNotification();
                    }
                });
            });

            // Controller mudou (nova versão ativada)
            navigator.serviceWorker.addEventListener('controllerchange', () => {
                if (!isRefreshing) {
                    isRefreshing = true;
                    console.log('[PWA] Recarregando app com nova versão...');
                    window.location.reload();
                }
            });

        } catch (error) {
            console.error('[PWA] Erro ao registrar Service Worker:', error);
        }
    });
}

let isRefreshing = false;

// Captura evento de instalação
window.addEventListener('beforeinstallprompt', (e) => {
    console.log('[PWA] Prompt de instalação disponível');

    // Previne o prompt automático
    e.preventDefault();

    // Armazena o evento para usar depois
    deferredPrompt = e;

    // Mostra o banner de instalação
    showInstallBanner();
});

// Detecta quando app foi instalado
window.addEventListener('appinstalled', (e) => {
    console.log('[PWA] App instalado com sucesso!');
    isInstalled = true;

    // Esconde banner
    hideInstallBanner();

    // Mostra mensagem de sucesso
    if (typeof showToast === 'function') {
        showToast('📱 App instalado com sucesso! Agora você pode acessar offline.', 'success');
    }

    // Reset prompt
    deferredPrompt = null;

    // Analytics (futuro)
    trackInstallation();
});

// Função para mostrar banner de instalação
function showInstallBanner() {
    // Verifica se já está instalado
    if (isInstalled) return;

    // Verifica se já foi dispensado hoje
    const dismissedDate = localStorage.getItem('pwa-install-dismissed');
    if (dismissedDate && new Date().toDateString() === new Date(dismissedDate).toDateString()) {
        return;
    }

    const banner = document.getElementById('install-banner');
    if (banner) {
        banner.classList.remove('hidden');

        // Adiciona evento ao botão de instalação
        const installBtn = document.getElementById('install-button');
        if (installBtn) {
            installBtn.onclick = promptInstall;
        }
    }
}

// Função para esconder banner
function hideInstallBanner() {
    const banner = document.getElementById('install-banner');
    if (banner) {
        banner.classList.add('hidden');
    }
}

// Fecha banner temporariamente
function closeInstallBanner() {
    hideInstallBanner();
    localStorage.setItem('pwa-install-dismissed', new Date().toISOString());
}

// Dispara prompt de instalação
async function promptInstall() {
    if (!deferredPrompt) {
        console.log('[PWA] Prompt de instalação não disponível');
        return;
    }

    // Mostra o prompt
    deferredPrompt.prompt();

    // Aguarda resposta do usuário
    const { outcome } = await deferredPrompt.userChoice;
    console.log('[PWA] Usuário escolheu:', outcome);

    if (outcome === 'accepted') {
        console.log('[PWA] Usuário aceitou instalação');
    } else {
        console.log('[PWA] Usuário recusou instalação');
        closeInstallBanner();
    }

    // Limpa o prompt
    deferredPrompt = null;
}

// Mostra notificação de update
function showUpdateNotification() {
    if (typeof showToast === 'function') {
        const message = '✨ Nova versão disponível! Clique para atualizar.';
        showToast(message, 'info');

        // Adiciona listener para recarregar
        setTimeout(() => {
            if (confirm('Nova versão do app disponível. Atualizar agora?')) {
                window.location.reload();
            }
        }, 2000);
    }
}

// Analytics de instalação
function trackInstallation() {
    // Salva evento localmente
    const installData = {
        timestamp: new Date().toISOString(),
        userAgent: navigator.userAgent,
        platform: navigator.platform
    };

    localStorage.setItem('pwa-install-data', JSON.stringify(installData));

    // Pode enviar para analytics (futuro)
    console.log('[PWA] Instalação registrada:', installData);
}

// Verifica se está online
function updateOnlineStatus() {
    const isOnline = navigator.onLine;
    console.log('[PWA] Status de conexão:', isOnline ? 'Online' : 'Offline');

    // Mostra indicador visual (se existir)
    const indicator = document.getElementById('online-indicator');
    if (indicator) {
        if (isOnline) {
            indicator.classList.remove('offline');
            indicator.classList.add('online');
        } else {
            indicator.classList.remove('online');
            indicator.classList.add('offline');
        }
    }
}

// Monitora mudanças de conexão
window.addEventListener('online', () => {
    updateOnlineStatus();
    if (typeof showToast === 'function') {
        showToast('✅ Você está online novamente!', 'success');
    }
});

window.addEventListener('offline', () => {
    updateOnlineStatus();
    if (typeof showToast === 'function') {
        showToast('⚠️ Você está offline. Funcionalidades limitadas.', 'warning');
    }
});

// Exporta funções globais
window.PWA = {
    install: promptInstall,
    isInstalled: () => isInstalled,
    hideInstallBanner: hideInstallBanner,
    closeInstallBanner: closeInstallBanner
};

console.log('[PWA] Install manager carregado');
