class Temperaturas {
  List<TemperaturaModel> items = [];

  Temperaturas();

  Temperaturas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final mytemp = TemperaturaModel.fromJsonMap(item);
      items.add(mytemp);
    }
  }
}

class TemperaturaModel {
  late String id;
  late double temperatura;
  late double humedad;
  late DateTime tiempo;

  TemperaturaModel({
    required this.id,
    required this.temperatura,
    required this.humedad,
    required this.tiempo,
  });

  // ignore: non_constant_identifier_names
  TemperaturaModel.fromJsonMap(Map<String, dynamic> json) {
    id = (json['idDispositivo']).toString();
    temperatura = double.parse(json['temp']);
    humedad = double.parse(json['hum']);
    tiempo = DateTime.parse(json['time']);
  }

  // int getTemp() {
  //   if (temperatura) {
  //     return 0;
  //   }
  //   return 24;

  //   // return int.parse(temperatura);
  // }

  getTime() {
    final response =
        tiempo.minute.toDouble() + (tiempo.second.toDouble() * 0.01);
    // print(response);
    return response;
    // if (tiempo.isEmpty) {
    //   return 20;
    // }
    // return 25;
  }
}
