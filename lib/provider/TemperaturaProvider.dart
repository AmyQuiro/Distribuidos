import 'package:flutter/cupertino.dart';
import 'package:flutter_application_listas/modelo/TemperaturaModel.dart';

import '../helper/API.dart';
import 'dart:async';

import 'package:http/http.dart' as http;

class TemperaturaProvider extends ChangeNotifier {
  API service = API();
  List<TemperaturaModel> listTemperaturas = [];

  TemperaturaProvider() {
    print('TemperaturaProvider inicializado');
    getTemperaturas();
  }

  getTemperaturas() async {
    var uri = Uri.parse('${service.urlBase}support/test?id=42323');
    final response = await http.get(uri);
    final responseJson = service.getResponse(response.body);
    final temperaturas = Temperaturas.fromJsonList(responseJson);

    listTemperaturas = temperaturas.items;
    notifyListeners();
    // return temperaturas.items;
  }
}
