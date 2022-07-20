<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class DatosClima extends Model
{
    protected $table = 'tbl_datosclima';
    protected $fillable = ['fechaHora', 'IdDispositivo', 'temperatura', 'humedad'];

    const TYPE_DIA = 1;
    const TYPE_SEMANA = 2;
    const TYPE_MES = 3;


    public function dispositivo()
    {
        return $this->belongsTo(Dispositivos::class, 'IdDispositivo');
    }

    public function getDatosClima($idDispositivo, $type)
    {
        $list = DatosClima::where("IdDispositivo", '=', $idDispositivo)->get();
        $date = Carbon::now()->setTimezone('America/La_Paz');
        switch ($type) {
            case DatosClima::TYPE_DIA:
                $strDate = $date->startOfDay()->toDateString();
                $list = $list->where("fechaHora", '>=', $strDate)->toArray();
                break;
            case DatosClima::TYPE_SEMANA:
                $strDate = $date->addDays(-7)->toDateString();
                $list = $list->where("fechaHora", '>=', $strDate)->toArray();
                break;
            case DatosClima::TYPE_MES:
                $strDate = Carbon::now()->startOfMonth()->toDateString();
                $list = $list->where("fechaHora", '>=', $strDate)->toArray();
                break;

            default:
                # code...
                break;
        }
        return $list;
    }
}
