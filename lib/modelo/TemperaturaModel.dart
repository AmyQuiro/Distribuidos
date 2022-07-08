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
  late String temperatura;
  late String humedad;
  late String tiempo;

  TemperaturaModel({
    required this.id,
    required this.temperatura,
    required this.humedad,
    required this.tiempo,
  });

  // ignore: non_constant_identifier_names
  TemperaturaModel.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    temperatura = json['temperatura'];
    humedad = json['humedad'];
    tiempo = json['tiempo'];
  }
}
