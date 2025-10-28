<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dark Sidebar</title>
    <link rel="stylesheet" href="{{ url('/css') }}/simple-material-ui.css"> 
    <link rel="stylesheet" href="{{ url('/css') }}/right-overlay.css"> 
    <link rel="stylesheet" href="{{ url('/css') }}/font-awesome/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8=" crossorigin="anonymous"></script>
    
</head>
<body>
    <button class="hamburger" id="hamburger">
        <span></span>
        <span></span>
        <span></span>
    </button>

    <div class="overlay" id="overlay"></div>

    <aside class="sidebar" id="sidebar">
        <div class="logo"><img src="{{url('images/')}}tirtatarum-logo-big.png">DIGITAL WATER</div>
        <div class="sidebar-container">
            <div class="input-group">
                <label>Cabang</label>
                <select name="cabang">
                    <option value="">Pilih Cabang</option>
                </select>
            </div>
            <div class="input-group">
                <label>Status</label>
                <div class="radio-input">
                    <label class="radio-option">
                        <input type="radio" name="pilihan" value="1" checked>
                        <span>Aktif</span>
                    </label>

                    <label class="radio-option">
                        <input type="radio" name="pilihan" value="2">
                        <span>Tidak Aktif</span>
                    </label>
                </div>
            </div>
            <div class="input-group">
                <label>Keterangan</label>
                <select name="cabang">
                    <option value="">Normal</option>
                </select>
            </div>
            <div class="input-group">
                <div class="button-container">
                    <button class="main-button">
                        Reset
                    </button>
                    <button class="main-button transparent-button">
                        <i class="fa fa-search"></i>
                        Cari
                    </button>
                </div>
            </div>
        </div>
        <div class="sidebar-container">
            <b style="margin-bottom:2px;">Daftar Manometer</b>
            <table class="sidebar-table">
                <thead>
                    <tr>
                        <th>Nama</th>
                        <th>Tekanan</th>
                        <th></th>
                    </tr>
                </thead>
                {% block manometer %}
                <tbody>
                    <tr>
                        <td>Logger 1</td>
                        <td>0.75 Bar</td>
                        <td><i class="fa fa-search"></i></td>
                    </tr>
                    <tr>
                        <td>Logger 2</td>
                        <td>0.85 Bar</td>
                        <td><i class="fa fa-search"></i></td>
                    </tr>
                    <tr>
                        <td>Logger 3</td>
                        <td>0.90 Bar</td>
                        <td><i class="fa fa-search"></i></td>
                    </tr>
                    <tr>
                        <td>Logger 4</td>
                        <td>1.00 Bar</td>
                        <td><i class="fa fa-search"></i></td>
                    </tr>
                    <tr>
                        <td>Logger 5</td>
                        <td>1.10 Bar</td>
                        <td><i class="fa fa-search"></i></td>
                    </tr>
                    <tr>
                        <td>Logger 6</td>
                        <td>1.25 Bar</td>
                        <td><i class="fa fa-search"></i></td>
                    </tr>
                    <tr>
                        <td>Logger 7</td>
                        <td>1.30 Bar</td>
                        <td><i class="fa fa-search"></i></td>
                    </tr>
                    <tr>
                        <td>Logger 8</td>
                        <td>1.40 Bar</td>
                        <td><i class="fa fa-search"></i></td>
                    </tr>
                    <tr>
                        <td>Logger 9</td>
                        <td>1.50 Bar</td>
                        <td><i class="fa fa-search"></i></td>
                    </tr>
                </tbody>
                {% endblock %}
            </table>
        </div>
        <!-- <ul class="menu">
            <li class="menu-item">
                <a href="#" class="menu-link ">
                    <svg class="icon" viewBox="0 0 24 24">
                        <path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"/>
                    </svg>
                </a>
            </li>
        </ul> -->
    </aside>
    {% block content %}
    <main class="main-content">
        <h1>Welcome to Dashboard</h1>
        <p>This is a clean, dark mode flat material design sidebar. Click on any menu item to navigate.</p>
    </main>
    {% endblock %}

    <script>
        const hamburger = document.getElementById('hamburger');
        const sidebar = document.getElementById('sidebar');
        const overlay = document.getElementById('overlay');

        hamburger.addEventListener('click', () => {
            sidebar.classList.toggle('active');
            overlay.classList.toggle('active');
        });

        overlay.addEventListener('click', () => {
            sidebar.classList.remove('active');
            overlay.classList.remove('active');
        });
    </script>
</body>
</html>