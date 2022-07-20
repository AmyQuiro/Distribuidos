<?php

namespace App\Http\Controllers;

use App\Model\Dispositivos;
use Illuminate\Http\Request;

class DispositivoController extends Controller

{
    public function index()
    {
        $dispositivos = Dispositivos::where("estado", '=', "true")->get();
        $listResponse = array();
        foreach ($dispositivos as $item) {
            $listResponse[] = [
                "id" => $item["id"],
                "temp" => $item["ultimaTemp"],
                "hum" => $item["ultimaHumed"],
                "estado" => $item["estado"],
                "ultimoRegistro" => $item["ultimaFechaDatos"],
            ];
        }
        return response()->json($listResponse);
    }
}
