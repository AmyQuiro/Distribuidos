<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Dispositivos extends Model
{
    protected $table = 'tbl_dispositivos';
    protected $fillable = ['idEstacion', 'fechaHoraReg', 'ultimaFechaDatos', 'ultimaTemp', 'ultimaHumed', 'estado'];


    public function datosClima()
    {
        return $this->hasMany(DatosClima::class, 'IdEstacion');
    }
}
