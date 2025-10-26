<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Simple MUI-like Sidebar</title>
    <link rel="stylesheet" href="{{ url('/css/style.css') }}" />
</head>

<body>
    <div class="container">
        <aside class="sidebar">
            <div class="sidebar-header">
                <h2>MyApp</h2>
                <button id="toggleSidebar">☰</button>
            </div>
            <nav class="menu">
                <a href="#" class="menu-item active">
                    <span>🏠</span> Home
                </a>
                <a href="#" class="menu-item">
                    <span>📁</span> Files
                </a>
                <a href="#" class="menu-item">
                    <span>⚙️</span> Settings
                </a>
            </nav>
            <div class="theme-toggle">
                <label>
                    <input type="checkbox" id="darkModeToggle" />
                    🌙 Dark Mode
                </label>
            </div>
        </aside>
        {% block content %}
            <main class="content">
                
            </main>
        {% endblock %}
    </div>
    <script src="script.js"></script>
</body>

</html>