import 'package:flutter/material.dart';
import 'package:flutter_application_listas/provider/TemperaturaProvider.dart';
import 'package:flutter_application_listas/views/graficos_real_time_screen.dart';
import 'package:flutter_application_listas/views/graph_view.dart';
import 'package:provider/provider.dart';

import '../modelo/DispositivosModel.dart';
import '../widget/list_temp_widget.dart';

class TemperaturaHome extends StatelessWidget {
  final DispositivoModel dispositivo;
  TemperaturaHome({Key? key, required this.dispositivo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TemperaturaProvider(idDispositivo: dispositivo.id),
      child: TemperaturaView(
        dispositivo: dispositivo,
      ),
    );
  }
}

class TemperaturaView extends StatefulWidget {
  final DispositivoModel dispositivo;
  const TemperaturaView({Key? key, required this.dispositivo})
      : super(key: key);

  @override
  State<TemperaturaView> createState() => _TemperaturaViewState();
}

class _TemperaturaViewState extends State<TemperaturaView> {
  @override
  Widget build(BuildContext context) {
    final tempProvider = Provider.of<TemperaturaProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.dispositivo.name),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const GraficosRealTimeScreen(
                        idDispositivo: "123",
                      )),
            );
          },
          backgroundColor: Color.fromARGB(255, 143, 199, 225),
          child: const Icon(
            Icons.auto_graph_rounded,
            color: Colors.black,
            size: 30.0,
          ),
        ),
        body: ListTempetura(
          options: tempProvider.listTemperaturas,
        ));
  }
}
