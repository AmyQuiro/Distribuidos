import 'dart:convert';
import 'dart:ffi';

class DTemperaturas {
  List<DTemperaturaModel> items = [];

  DTemperaturas();

  DTemperaturas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final mytemp = DTemperaturaModel.fromJsonMap(item);
      items.add(mytemp);
    }
  }
}

class DTemperaturaModel {
  late String id;
  late double temperatura;
  late double humedad;
  late DateTime ultimoRegistro;
  late bool estado;

  DTemperaturaModel({
    required this.id,
    required this.temperatura,
    required this.humedad,
    required this.ultimoRegistro,
    required this.estado,
  });

  // ignore: non_constant_identifier_names
  DTemperaturaModel.fromJsonMap(Map<String, dynamic> json) {
    final tiempo = json['time'] != null ? json['time'] : json['ultimoRegistro'];
    id = (json['id']).toString();
    temperatura = double.parse(json['temp']);
    humedad = double.parse(json['hum']);
    ultimoRegistro = DateTime.parse(tiempo);
    estado = (json['estado']).toString().toLowerCase() == 'true';
  }

  factory DTemperaturaModel.fromJson(String str) =>
      DTemperaturaModel.fromJsonMap(json.decode(str)); // (json.decode(str));

  // int getTemp() {
  //   if (temperatura) {
  //     return 0;
  //   }
  //   return 24;

  //   // return int.parse(temperatura);
  // }

  getTime() {
    final response = ultimoRegistro.minute.toDouble() +
        (ultimoRegistro.second.toDouble() * 0.01);
    // print(response);
    return response;
    // if (tiempo.isEmpty) {
    //   return 20;
    // }
    // return 25;
  }
}
