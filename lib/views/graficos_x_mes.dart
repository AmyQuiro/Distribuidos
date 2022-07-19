import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_listas/views/graficos_real_time_screen.dart';

import '../widget/mes.dart';

class GraficosMes extends StatefulWidget {
  const GraficosMes({Key? key}) : super(key: key);

  @override
  State<GraficosMes> createState() => _GraficosMesState();
}

class _GraficosMesState extends State<GraficosMes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Graficos Por Mes'),
          elevation: 10,
        ),
        body: Column(children: const [
          Mes(),
          //GraficosRealTimeScreen(idDispositivo: "123"),
        ]));
  }
}
