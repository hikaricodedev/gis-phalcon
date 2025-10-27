<?php
declare(strict_types=1);

namespace Gis\Modules\Frontend\Controllers;

class DashboardController extends ControllerBase
{

    public function indexAction()
    {
        $locations = [
            [
                "lat" => -6.939566,
                "lng" => 107.612779,
                "title" => "Unknown Places",
                "tooltip" => "Logger 1",
                "pressure" => 1,
                "minimum" => 1,
                "maximum" => 10,
                "status" => "Aktif",
                "ketinggian" => 1,
                "description" => "Jl. Sriwijaya No.24, Bandung"
            ],
            [
                "lat" => -6.917464,
                "lng" => 107.619123,
                "title" => "Alun-Alun Bandung",
                "tooltip" => "Logger 2",
                "pressure" => 2,
                "minimum" => 1,
                "maximum" => 8,
                "status" => "Aktif",
                "ketinggian" => 2,
                "description" => "Jl. Asia Afrika, Balonggede, Bandung"
            ],
            [
                "lat" => -6.884082,
                "lng" => 107.541977,
                "title" => "Universitas Pendidikan Indonesia",
                "tooltip" => "Logger 3",
                "pressure" => 3,
                "minimum" => 1,
                "maximum" => 9,
                "status" => "Tidak Aktif",
                "ketinggian" => 3,
                "description" => "Jl. Dr. Setiabudi No.229, Bandung"
            ],
            [
                "lat" => -6.903489,
                "lng" => 107.618782,
                "title" => "Gedung Sate",
                "tooltip" => "Logger 4",
                "pressure" => 4,
                "minimum" => 1,
                "maximum" => 12,
                "status" => "Aktif",
                "ketinggian" => 4,
                "description" => "Jl. Diponegoro No.22, Bandung"
            ],
            [
                "lat" => -6.937207,
                "lng" => 107.719971,
                "title" => "Trans Studio Bandung",
                "tooltip" => "Logger 5",
                "pressure" => 5,
                "minimum" => 2,
                "maximum" => 15,
                "status" => "Aktif",
                "ketinggian" => 5,
                "description" => "Jl. Gatot Subroto No.289, Bandung"
            ],
            [
                "lat" => -6.870574,
                "lng" => 107.606323,
                "title" => "Bandung Trade Center (BTC)",
                "tooltip" => "Logger 6",
                "pressure" => 6,
                "minimum" => 3,
                "maximum" => 14,
                "status" => "Tidak Aktif",
                "ketinggian" => 6,
                "description" => "Jl. Dr. Djunjunan No.143-149, Bandung"
            ],
            [
                "lat" => -6.857977,
                "lng" => 107.590796,
                "title" => "Bandara Husein Sastranegara",
                "tooltip" => "Logger 7",
                "pressure" => 7,
                "minimum" => 2,
                "maximum" => 11,
                "status" => "Aktif",
                "ketinggian" => 7,
                "description" => "Jl. Pajajaran No.156, Bandung"
            ],
            [
                "lat" => -6.938211,
                "lng" => 107.599206,
                "title" => "Pasar Baru Trade Center",
                "tooltip" => "Logger 8",
                "pressure" => 8,
                "minimum" => 1,
                "maximum" => 10,
                "status" => "Aktif",
                "ketinggian" => 8,
                "description" => "Jl. Otto Iskandardinata No.70, Bandung"
            ],
            [
                "lat" => -6.888789,
                "lng" => 107.610711,
                "title" => "Cihampelas Walk",
                "tooltip" => "Logger 9",
                "pressure" => 9,
                "minimum" => 4,
                "maximum" => 16,
                "status" => "Tidak Aktif",
                "ketinggian" => 9,
                "description" => "Jl. Cihampelas No.160, Bandung"
            ],
            [
                "lat" => -6.900147,
                "lng" => 107.626823,
                "title" => "Saung Angklung Udjo",
                "tooltip" => "Logger 10",
                "pressure" => 10,
                "minimum" => 5,
                "maximum" => 20,
                "status" => "Aktif",
                "ketinggian" => 10,
                "description" => "Jl. Padasuka No.118, Bandung"
            ]
        ];
        $this->view->locations = json_decode(json_encode($locations));

    }


}

