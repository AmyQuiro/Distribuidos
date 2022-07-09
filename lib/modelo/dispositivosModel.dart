class Dispositivos {
  List<DispositivoModel> items = [];

  Dispositivos();

  Dispositivos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final myDis = DispositivoModel.fromJsonMap(item);
      items.add(myDis);
    }
  }
}

class DispositivoModel {
  late String id;
  late String name;
  DispositivoModel({
    required this.id,
    required this.name,
  });
  DispositivoModel.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
