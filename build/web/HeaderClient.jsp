<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Voyage Agences Django Transs</title>
  <link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="style/fontawesome-free-7.2.0-web/css/all.min.css">
  <link rel="stylesheet" href="css/darck.css">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Island+Moments&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>

<body>
  <!-- ===== HEADER MODERNISÉ ===== -->
  <header style="position: sticky; top: 0; z-index: 1050; background: var(--bg); border-bottom: 1px solid var(--border-color); backdrop-filter: blur(10px); -webkit-backdrop-filter: blur(10px); transition: background 0.3s ease, border-color 0.3s ease;">
    <div class="container-fluid px-3 px-lg-4">
      <nav class="navbar navbar-expand-lg py-2">
        <div class="container-fluid px-0">

          <!-- ===== LOGO ===== -->
          <a class="navbar-brand d-flex align-items-center gap-2 text-decoration-none" href="home.php?id=accueil" style="font-family: 'Island Moments', cursive; font-size: 32px; font-weight: 400; letter-spacing: 0.5px;">
            <span class="d-inline-flex align-items:center justify-content:center" style="background: linear-gradient(135deg, #8e44ad, #3498db); color: #fff; width: 40px; height: 40px; border-radius: 12px; font-size: 18px; box-shadow: 0 4px 12px rgba(142, 68, 173, 0.25);">
              <i class="fa fa-shop"></i>
            </span>
            <span style="background: linear-gradient(135deg, #8e44ad, #3498db); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Django Transs</span>
          </a>

          <!-- ===== BOUTON TOGGLE MOBILE ===== -->
          <button class="navbar-toggler border-0 shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar" aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation" style="padding: 6px 10px; color: var(--text);">
            <i class="bi bi-list fs-2"></i>
          </button>

          <!-- ===== MENU NAVIGATION ===== -->
          <div class="collapse navbar-collapse" id="mainNavbar">
            <ul class="navbar-nav ms-auto align-items-lg-center gap-2 mt-3 mt-lg-0">

              <!-- Lien Retour -->
              <li class="nav-item">
                <a class="nav-link" href="RetourServlet">
                  <i class="bi bi-arrow-left-circle-fill fs-5 text-purple" style="color: #8e44ad;"></i>
                  <span>Retour</span>
                </a>
              </li>

              <!-- ===== TOGGLE DARK MODE ===== -->
              <li class="nav-item my-1 my-lg-0">
                <button id="theme-toggle" class="theme-btn w-100 w-lg-auto" aria-pressed="false">
                  <i class="fa-solid fa-moon" id="theme-icon"></i>
                  <span id="theme-label">Sombre</span>
                </button>
              </li>

              <!-- ===== AVATAR / PROFIL ===== -->
              <li class="nav-item ms-lg-2">
                <a class="nav-link p-0" href="#profil">
                  <div class="avatar-circle" style="width: 38px; height: 38px; border-radius: 50%; background: linear-gradient(135deg, #8e44ad, #3498db); display: flex; align-items: center; justify-content: center; color: #fff; font-weight: 600; font-size: 0.9rem; transition: transform 0.2s ease, box-shadow 0.2s ease; box-shadow: 0 2px 10px rgba(142, 68, 173, 0.25);">
                    <i class="fa-solid fa-user"></i>
                  </div>
                </a>
              </li>

            </ul>
          </div>
        </div>
      </nav>
    </div>
  </header>

  <!-- ===== SCRIPT DARK MODE ===== -->
  <script>
    (function() {
      const toggleBtn = document.getElementById('theme-toggle');
      const themeIcon = document.getElementById('theme-icon');
      const themeLabel = document.getElementById('theme-label');
      const rootEl = document.documentElement;
      const STORAGE_KEY = 'site-theme';

      function applyTheme(theme) {
        if (theme === 'dark') {
          rootEl.classList.add('dark');
          themeIcon.className = 'fa-solid fa-sun';
          themeLabel.textContent = 'Clair';
          toggleBtn.setAttribute('aria-pressed', 'true');
        } else {
          rootEl.classList.remove('dark');
          themeIcon.className = 'fa-solid fa-moon';
          themeLabel.textContent = 'Sombre';
          toggleBtn.setAttribute('aria-pressed', 'false');
        }
      }

      function loadTheme() {
        const saved = localStorage.getItem(STORAGE_KEY);
        if (saved) return saved;
        const prefersDark = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;
        return prefersDark ? 'dark' : 'light';
      }

      function saveTheme(theme) {
        localStorage.setItem(STORAGE_KEY, theme);
      }

      // Initialisation immédiate
      const initialTheme = loadTheme();
      applyTheme(initialTheme);

      // Événement click
      toggleBtn.addEventListener('click', () => {
        const newTheme = rootEl.classList.contains('dark') ? 'light' : 'dark';
        applyTheme(newTheme);
        saveTheme(newTheme);
      });

      // Écouter les changements système
      if (window.matchMedia) {
        window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', (e) => {
          if (!localStorage.getItem(STORAGE_KEY)) {
            applyTheme(e.matches ? 'dark' : 'light');
          }
        });
      }
    })();
  </script>

  <!-- ===== STYLES PERSONNALISÉS ===== -->
  <style>
    :root {
      --bg: #ffffff;
      --card: #ffffff;
      --text: #1a1a2e;
      --text-secondary: #555555;
      --border-color: #e8e8e8;
      --shadow: 0 2px 12px rgba(0, 0, 0, 0.06);
    }

    .dark {
      --bg: #0d0d1a;
      --card: #1a1a2e;
      --text: #e8e8f0;
      --text-secondary: #aaaaaa;
      --border-color: #2a2a4a;
      --shadow: 0 2px 12px rgba(0, 0, 0, 0.3);
    }

    body {
      background: var(--bg);
      color: var(--text);
      transition: background-color 0.3s ease, color 0.3s ease;
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
      margin: 0;
      padding: 0;
      min-height: 100vh;
    }

    /* Navigation Links */
    .nav-link {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      font-size: 0.9rem;
      font-weight: 500;
      color: var(--text-secondary);
      padding: 8px 14px;
      border-radius: 30px;
      transition: all 0.25s ease;
      text-decoration: none;
    }

    .nav-link:hover {
      color: var(--text);
      background: rgba(142, 68, 173, 0.08);
    }

    .nav-link.active {
      color: #8e44ad;
      background: rgba(142, 68, 173, 0.12);
    }

    /* Theme Button */
    .theme-btn {
      background: var(--card);
      border: 1px solid var(--border-color);
      border-radius: 30px;
      padding: 8px 16px;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      font-size: 0.85rem;
      font-weight: 500;
      color: var(--text);
      transition: all 0.3s ease;
      cursor: pointer;
      box-shadow: var(--shadow);
    }

    .theme-btn:hover {
      transform: translateY(-1px);
      border-color: #8e44ad;
      box-shadow: 0 4px 15px rgba(142, 68, 173, 0.15);
    }

    /* Avatar Hover */
    .avatar-circle:hover {
      transform: scale(1.05);
      box-shadow: 0 4px 20px rgba(142, 68, 173, 0.35) !important;
    }

    /* Responsive Mobile Adjustments */
    @media (max-width: 991.98px) {
      .navbar-collapse {
        background: var(--card);
        padding: 16px;
        border-radius: 16px;
        margin-top: 12px;
        box-shadow: var(--shadow);
        border: 1px solid var(--border-color);
      }
      .nav-link {
        width: 100%;
        padding: 10px 14px;
        border-radius: 10px;
      }
    }
  </style>

  <!-- Scripts Bootstrap requis pour le toggle mobile -->
  <script src="style/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>