{% extends 'layouts/template.volt' %}
{% block manometer %}
  <tbody>
    {% for location in locations %}
      <tr>
        <td>{{location.tooltip}}</td>
        <td>{{ location.pressure/10 }}</td>
        <td><a href="javascript:void(0);" class="search-location" lat="{{location.lat}}" long="{{location.lng}}"><i class="fa fa-search"></i></a></td>
      </tr>
    {% endfor %}
  </tbody>
{% endblock %}
{% block content %}
<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
<style>
  #map {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    z-index: 0;

  }
  .tooltip-hijau {
    background: #004d00;
    color: #ffffff;
    border-color: #ffffff00;
    text-align: center;
  }

  .tooltip-kuning {
    background: #c2b502;
    color: #ffffff;
    border-color: #ffffff00;
    text-align: center;
  }
  .pressure-tip {
    
  }
  .leaflet-tile {
    filter: hue-rotate(90deg) saturate(105%) contrast(98%) invert(90%);
    -webkit-filter: hue-rotate(90deg) saturate(105%) contrast(98%) invert(90%);
    -moz-filter: hue-rotate(90deg) saturate(105%) contrast(98%) invert(90%);
  }

</style>
<main class="main-content">
  <h1>Test Template</h1>
  <div id="map"></div>
  <div class="right-overlay">
    <div class="popup-overlay" id="popupOverlay">
      <div class="popup">
        <div class="popup-header">
          <h2 class="popup-title" id="val-title">Logger 1</h2>
          <button class="popup-close" onclick="closePopup()">×</button>
        </div>
        <div class="popup-body">
          <div class="pressure-meter">
            <canvas data-type="radial-gauge" data-width="200" data-height="200" data-units="bar" data-min-value="0"
              data-max-value="12" data-value="7" data-major-ticks="0,2,4,6,8,10,12" data-minor-ticks="2"
              data-stroke-ticks="true" data-highlights='[
          {"from": 0, "to": 4, "color": "rgba(0,255,0,.3)"},
          {"from": 4, "to": 8, "color": "rgba(255,255,0,.3)"},
          {"from": 8, "to": 12, "color": "rgba(255,30,0,.3)"}
        ]' data-color-plate="#fff" data-needle="true" data-needle-end="99" data-animation-duration="1500"
              data-animation-rule="linear" id="pressure-meter">
            </canvas>
          </div>
          <div class="detail-data">
            <div class="data-row">
              <span class="row-title">Tekanan</span>
              <span class="row-separator">:</span>
              <span class="row-value" id="val-tekanan">0.7</span>
            </div>
            <div class="data-row">
              <span class="row-title">Wilayah</span>
              <span class="row-separator">:</span>
              <span class="row-value" id="val-wilayah">Majalaya</span>
            </div>
            <div class="data-row">
              <span class="row-title">Minimun</span>
              <span class="row-separator">:</span>
              <span class="row-value" id="val-minimum">0.1</span>
            </div>
            <div class="data-row">
              <span class="row-title">Maximum</span>
              <span class="row-separator">:</span>
              <span class="row-value" id="val-maximum">10</span>
            </div>
            <div class="data-row">
              <span class="row-title">Ketinggian</span>
              <span class="row-separator">:</span>
              <span class="row-value" id="val-ketinggian">0</span>
            </div>
            <div class="data-row">
              <span class="row-title">Alamat</span>
              <span class="row-separator">:</span>
              <span class="row-value" id="val-alamat">Jembatan Perbatasan Cigadung</span>
            </div>
            <div class="data-row">
              <span class="row-title">Status</span>
              <span class="row-separator">:</span>
              <span class="row-value" id="val-status">Aktif</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/canvas-gauges/gauge.min.js"></script>
  <script>
    const map = L.map('map').setView([-6.9406679, 107.6156969], 17);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '© OpenStreetMap contributors'
    }).addTo(map);

    // const geojsonLayer = L.geoJSON([], {
    //   style: function (feature) {
    //     // style khusus untuk geometry bertipe "LineString" atau "Polygon"
    //     switch (feature.properties.category) {
    //       case 'park':
    //         return { color: '#2ecc71', fillColor: '#27ae60', weight: 2, fillOpacity: 0.6 }; // hijau
    //       case 'road':
    //         return { color: '#95a5a6', weight: 2, fillOpacity: 0.4 }; // abu-abu
    //       default:
    //         return { color: '#1abc9c', fillColor: '#16a085', weight: 2, fillOpacity: 0.5 }; // hijau kebiruan
    //     }
    //   },
    //   pointToLayer: function (feature, latlng) {
    //     // style khusus untuk Point (titik)
    //     return L.circleMarker(latlng, {
    //       radius: 8,
    //       fillColor: '#2ecc71', // hijau muda
    //       color: '#ffffff',
    //       weight: 1,
    //       opacity: 1,
    //       fillOpacity: 0.8
    //     });
    //   }
    // }).addTo(map);


    const customIcon = L.icon({
      iconUrl: "{{url('/images/')}}gauge.png", // URL gambar icon
      iconSize: [38, 38], // ukuran icon [width, height]
      iconAnchor: [19, 38], // posisi anchor (titik bawah icon)
      popupAnchor: [0, -38] // posisi popup relatif terhadap icon
    });

    const customIconRed = L.icon({
      iconUrl: "{{url('/images/')}}gauge_red.png", // URL gambar icon
      iconSize: [38, 38], // ukuran icon [width, height]
      iconAnchor: [19, 38], // posisi anchor (titik bawah icon)
      popupAnchor: [0, -38] // posisi popup relatif terhadap icon
    });

    const locations = [
    {
      lat: -6.939566,
      lng: 107.612779,
      title: "Unknown Places",
      tooltip: "Logger 1",
      pressure: 1,
      minimum: 1,
      maximum: 10,
      status: "Aktif",
      ketinggian: 1,
      description: "Jl. Sriwijaya No.24, Bandung"
    },
    {
      lat: -6.917464,
      lng: 107.619123,
      title: "Alun-Alun Bandung",
      tooltip: "Logger 2",
      pressure: 2,
      minimum: 1,
      maximum: 8,
      status: "Aktif",
      ketinggian: 2,
      description: "Jl. Asia Afrika, Balonggede, Bandung"
    },
    {
      lat: -6.884082,
      lng: 107.541977,
      title: "Universitas Pendidikan Indonesia",
      tooltip: "Logger 3",
      pressure: 3,
      minimum: 1,
      maximum: 9,
      status: "Tidak Aktif",
      ketinggian: 3,
      description: "Jl. Dr. Setiabudi No.229, Bandung"
    },
    {
      lat: -6.903489,
      lng: 107.618782,
      title: "Gedung Sate",
      tooltip: "Logger 4",
      pressure: 4,
      minimum: 1,
      maximum: 12,
      status: "Aktif",
      ketinggian: 4,
      description: "Jl. Diponegoro No.22, Bandung"
    },
    {
      lat: -6.937207,
      lng: 107.719971,
      title: "Trans Studio Bandung",
      tooltip: "Logger 5",
      pressure: 5,
      minimum: 2,
      maximum: 15,
      status: "Aktif",
      ketinggian: 5,
      description: "Jl. Gatot Subroto No.289, Bandung"
    },
    {
      lat: -6.870574,
      lng: 107.606323,
      title: "Bandung Trade Center (BTC)",
      tooltip: "Logger 6",
      pressure: 6,
      minimum: 3,
      maximum: 14,
      status: "Tidak Aktif",
      ketinggian: 6,
      description: "Jl. Dr. Djunjunan No.143-149, Bandung"
    },
    {
      lat: -6.857977,
      lng: 107.590796,
      title: "Bandara Husein Sastranegara",
      tooltip: "Logger 7",
      pressure: 7,
      minimum: 2,
      maximum: 11,
      status: "Aktif",
      ketinggian: 7,
      description: "Jl. Pajajaran No.156, Bandung"
    },
    {
      lat: -6.938211,
      lng: 107.599206,
      title: "Pasar Baru Trade Center",
      tooltip: "Logger 8",
      pressure: 8,
      minimum: 1,
      maximum: 10,
      status: "Aktif",
      ketinggian: 8,
      description: "Jl. Otto Iskandardinata No.70, Bandung"
    },
    {
      lat: -6.888789,
      lng: 107.610711,
      title: "Cihampelas Walk",
      tooltip: "Logger 9",
      pressure: 9,
      minimum: 4,
      maximum: 16,
      status: "Tidak Aktif",
      ketinggian: 9,
      description: "Jl. Cihampelas No.160, Bandung"
    },
    {
      lat: -6.900147,
      lng: 107.626823,
      title: "Saung Angklung Udjo",
      tooltip: "Logger 10",
      pressure: 10,
      minimum: 5,
      maximum: 20,
      status: "Aktif",
      ketinggian: 10,
      description: "Jl. Padasuka No.118, Bandung"
    }
  ];


    // METHOD 1: Manual satu per satu
    locations.forEach((location, index) => {
      const marker = L.marker([location.lat, location.lng], {
          icon: location.pressure > 7 ? customIcon : customIconRed,
          data: location, // simpan data lokasi
          index: index    // simpan index
      })
      .addTo(map)
      .bindPopup(`
          <b>${location.title}</b><br>
          ${location.description}<br>
          <small>Marker #${index + 1}</small>
      ` )
      .bindTooltip(location.tooltip +'<br/>' + (location.pressure/10) + ' bar</span>', { permanent: true, direction: "bottom", offset: [0, -5] , className : location.pressure < 5 ? 'tooltip-kuning' : 'tooltip-hijau'})
      .on('click', function (e) {
          // Ambil data dari marker yang diklik
          const data = e.target.options.data;
          const idx = e.target.options.index;
          console.log("Marker diklik:", data);
          console.log("Index marker:", idx);

          // Contoh: jalankan fungsi khusus
          openPopup(data);
          // openPopup();
      });
    });



    // Event click interaktif


    function openPopup(data) {
      let newPressure = data.pressure != 0 ? data.pressure / 10 : 0;
      newPressure = newPressure != 0 ? newPressure.toFixed(2) : 0;
      $('#pressure-meter').attr('data-value',data.pressure);
      document.getElementById('val-tekanan').innerHTML = newPressure;
      document.getElementById('val-wilayah').innerHTML = data.title;
      document.getElementById('val-minimum').innerHTML = data.minimum;
      document.getElementById('val-maximum').innerHTML = data.maximum;
      document.getElementById('val-ketinggian').innerHTML = data.ketinggian;
      document.getElementById('val-alamat').innerHTML = data.description;
      document.getElementById('val-status').innerHTML = data.status;
      document.getElementById('val-title').innerHTML = data.tooltip;
      document.getElementById('popupOverlay').classList.remove('active');
      document.getElementById('popupOverlay').classList.add('active');
      document.body.style.overflow = 'hidden';
    }
    $('.search-location').on('click', function (){
      let lat = parseFloat($(this).attr('lat'));
      let long = parseFloat($(this).attr('long'));
      map.setView([lat, long], 13)
    });

    function closePopup() {
      document.getElementById('popupOverlay').classList.remove('active');
      document.body.style.overflow = '';
    }

    function confirm() {
      alert('Action confirmed!');
      closePopup();
    }

    // Close on overlay click
    document.getElementById('popupOverlay').addEventListener('click', function (e) {
      if (e.target === this) {
        closePopup();
      }
    });

    // Close on ESC key
    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape') {
        closePopup();
      }
    });
  </script>
</main>
{% endblock %}