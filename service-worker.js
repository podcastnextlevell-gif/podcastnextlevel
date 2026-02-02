// Service Worker - Next Level Podcast PWA
const CACHE_VERSION = 'v1.0.0';
const CACHE_NAME = `next-level-podcast-${CACHE_VERSION}`;

// Arquivos para cache (offline-first)
const STATIC_CACHE_URLS = [
  '/',
  '/index.html',
  '/login.html',
  '/cadastro.html',
  '/dashboard.html',
  '/player.html',
  '/prova.html',
  '/certificado.html',
  '/ranking.html',
  '/pendente.html',
  '/js/supabase-config.js',
  '/js/auth.js',
  '/js/pwa-install.js',
  '/manifest.json',
  '/assets/icons/icon-192x192.png',
  '/assets/icons/icon-512x512.png'
];

// Install Event - Cache static assets
self.addEventListener('install', (event) => {
  console.log('[SW] Installing Service Worker...', CACHE_VERSION);
  
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      console.log('[SW] Caching static assets');
      return cache.addAll(STATIC_CACHE_URLS);
    }).then(() => {
      return self.skipWaiting(); // Ativa imediatamente
    })
  );
});

// Activate Event - Clean old caches
self.addEventListener('activate', (event) => {
  console.log('[SW] Activating Service Worker...', CACHE_VERSION);
  
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames
          .filter((name) => name !== CACHE_NAME)
          .map((name) => {
            console.log('[SW] Deleting old cache:', name);
            return caches.delete(name);
          })
      );
    }).then(() => {
      return self.clients.claim(); // Assume controle imediatamente
    })
  );
});

// Fetch Event - Network First with Cache Fallback
self.addEventListener('fetch', (event) => {
  const { request } = event;
  const url = new URL(request.url);

  // Ignora requisições não-HTTP
  if (!url.protocol.startsWith('http')) {
    return;
  }

  // Ignora requisições do Supabase (sempre online)
  if (url.hostname.includes('supabase.co')) {
    return event.respondWith(fetch(request));
  }

  // Ignora requisições de CDN externo
  if (url.hostname.includes('cdn.tailwindcss.com') || 
      url.hostname.includes('fonts.googleapis.com') ||
      url.hostname.includes('unpkg.com')) {
    return event.respondWith(fetch(request));
  }

  // Strategy: Network First, Cache Fallback
  event.respondWith(
    fetch(request)
      .then((response) => {
        // Clone da resposta para cache
        const responseClone = response.clone();
        
        // Atualiza cache apenas para métodos GET
        if (request.method === 'GET' && response.status === 200) {
          caches.open(CACHE_NAME).then((cache) => {
            cache.put(request, responseClone);
          });
        }
        
        return response;
      })
      .catch(() => {
        // Fallback: tenta buscar do cache
        return caches.match(request).then((cachedResponse) => {
          if (cachedResponse) {
            console.log('[SW] Serving from cache:', request.url);
            return cachedResponse;
          }
          
          // Offline fallback page
          if (request.mode === 'navigate') {
            return caches.match('/index.html');
          }
          
          return new Response('Offline - conteúdo não disponível', {
            status: 503,
            statusText: 'Service Unavailable',
            headers: new Headers({
              'Content-Type': 'text/plain'
            })
          });
        });
      })
  );
});

// Push Notification Event
self.addEventListener('push', (event) => {
  console.log('[SW] Push notification received', event);
  
  let notificationData = {
    title: 'Next Level Podcast',
    body: 'Nova atualização disponível!',
    icon: '/assets/icons/icon-192x192.png',
    badge: '/assets/icons/icon-maskable-192.png',
    tag: 'default',
    data: { url: '/dashboard.html' }
  };

  if (event.data) {
    try {
      const payload = event.data.json();
      notificationData = { ...notificationData, ...payload };
    } catch (e) {
      notificationData.body = event.data.text();
    }
  }

  event.waitUntil(
    self.registration.showNotification(notificationData.title, {
      body: notificationData.body,
      icon: notificationData.icon,
      badge: notificationData.badge,
      tag: notificationData.tag,
      data: notificationData.data,
      vibrate: [200, 100, 200],
      requireInteraction: false,
      actions: [
        { action: 'open', title: 'Abrir' },
        { action: 'close', title: 'Fechar' }
      ]
    })
  );
});

// Notification Click Event
self.addEventListener('notificationclick', (event) => {
  console.log('[SW] Notification clicked', event);
  
  event.notification.close();

  if (event.action === 'close') {
    return;
  }

  const urlToOpen = event.notification.data?.url || '/dashboard.html';

  event.waitUntil(
    clients.matchAll({ type: 'window', includeUncontrolled: true })
      .then((clientList) => {
        // Se já tem uma janela aberta, foca nela
        for (let client of clientList) {
          if (client.url.includes(self.location.origin) && 'focus' in client) {
            client.navigate(urlToOpen);
            return client.focus();
          }
        }
        // Senão, abre nova janela
        if (clients.openWindow) {
          return clients.openWindow(urlToOpen);
        }
      })
  );
});

// Background Sync (futuro)
self.addEventListener('sync', (event) => {
  console.log('[SW] Background sync:', event.tag);
  
  if (event.tag === 'sync-progress') {
    event.waitUntil(
      // Sincronizar progresso offline quando voltar online
      syncOfflineProgress()
    );
  }
});

async function syncOfflineProgress() {
  // Implementação futura: sincronizar dados offline
  console.log('[SW] Syncing offline progress...');
  return Promise.resolve();
}

console.log('[SW] Service Worker loaded successfully');
