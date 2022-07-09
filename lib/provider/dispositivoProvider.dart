import 'package:flutter/cupertino.dart';
import 'package:flutter_application_listas/modelo/DispositivosModel.dart';

import '../helper/API.dart';
import 'dart:async';

import 'package:http/http.dart' as http;

import '../modelo/TemperaturaModel.dart';

class dispositivoProvider extends ChangeNotifier {
  API service = API();
  List<DispositivoModel> listDispositivos = [];

  dispositivoProvider() {
    print('DispositivoProvider inicializado');
    getDispositivo();
  }

  getDispositivo() async {
    var uri = Uri.parse('${service.urlBase}support/getDevices');

    ///support/getDevices
    // var uri = Uri.parse('${service.urlBase}support/arduino');
    final response = await http.get(uri);
    final responseJson = service.getResponse(response.body);
    final dispositivos = Dispositivos.fromJsonList(responseJson);

    listDispositivos = dispositivos.items;
    notifyListeners();
    // return temperaturas.items;
  }
}
