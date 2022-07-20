<?php

namespace App\Http\Controllers;

use App\Model\DatosClima;
use App\Model\Dispositivos;
use Illuminate\Http\Request;

class DatosClimaController extends Controller
{
    public function index()
    {
        $datosClima = DatosClima::all();
        return response()->json($datosClima);
    }

    public function getHistorialPorDia($idDispositivo)
    {
        $modelDatos = Dispositivos::where('id', '=', $idDispositivo)->firstOrFail();

        $listUltDatos = array();
        $listUltDatos[] = [
            "fechaHora" => $modelDatos["ultimaFechaDatos"],
            "temperatura" => $modelDatos->ultimaTemp,
            "humedad" => $modelDatos->ultimaHumed,
            "IdDispositivo" => $modelDatos->id
        ];
        //    return response()->json($this->formatearRespuesta($listUltDatos));

        $modelDatos = new DatosClima();
        $datosClima = $modelDatos->getDatosClima($idDispositivo, DatosClima::TYPE_DIA);
        return response()->json($this->formatearRespuesta($datosClima));
    }
    public function getHistorialPorSemana($idDispositivo)
    {

        $modelDatos = new DatosClima();
        $datosClima = $modelDatos->getDatosClima($idDispositivo, DatosClima::TYPE_SEMANA);
        return response()->json($this->formatearRespuesta($datosClima));
    }
    public function getHistorialPorMes($idDispositivo)
    {
        $modelDatos = new DatosClima();
        $datosClima = $modelDatos->getDatosClima($idDispositivo, DatosClima::TYPE_MES);
        return response()->json($this->formatearRespuesta($datosClima));
    }

    private function formatearRespuesta($listDatosClima)
    {
        $response = array();
        foreach ($listDatosClima as $data) {
            $response[] = [
                "temp" => $data["temperatura"],
                "time" => $data["fechaHora"],
                "idDispositivo" => $data["IdDispositivo"],
            ];
        }

        return $response;
    }
}
