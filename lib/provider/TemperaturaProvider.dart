import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_listas/modelo/TemperaturaModel.dart';

import '../helper/API.dart';
import 'dart:async';

import 'package:http/http.dart' as http;

class TemperaturaProvider extends ChangeNotifier {
  API service = API();
  List<TemperaturaModel> listTemperaturas = [];

  TemperaturaProvider({required idDispositivo}) {
    print('TemperaturaProvider inicializado');
    getTemperaturas(idDispositivo: idDispositivo);
  }

  getTemperaturas({required idDispositivo}) async {
    var uri = Uri.parse(
      '${service.urlBase}getHistorialPorDia/${idDispositivo}',
    );

    final response = await http.get(uri);

    final temperaturas = Temperaturas.fromJsonList(json.decode(response.body));

    listTemperaturas = temperaturas.items;
    notifyListeners();
  }

  Future<List<TemperaturaModel>> getUltimasTemeperaturas(
      {required idDispositivo}) async {
    DateTime now = DateTime.now();
    var uri = Uri.parse(
      '${service.urlBase}support/ultimasTemperaturas?id=$idDispositivo&${now.toString()}',
    );

    final response = await http.get(uri);
    final responseJson = service.getResponse(response.body);
    final responseTemperaturas = Temperaturas.fromJsonList(responseJson);
    print(responseTemperaturas.items);
    return responseTemperaturas.items;
  }
}
