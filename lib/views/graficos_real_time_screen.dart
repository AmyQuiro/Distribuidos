import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_listas/modelo/TemperaturaModel.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../provider/TemperaturaProvider.dart';

class GraficosRealTimeScreen extends StatelessWidget {
  final String idDispositivo;
  const GraficosRealTimeScreen({Key? key, required this.idDispositivo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TemperaturaProvider(idDispositivo: idDispositivo),
      child: GraficosRealTimeScreenF(
        idDispositivo: idDispositivo,
      ),
    );
  }
}

class GraficosRealTimeScreenF extends StatefulWidget {
  final String idDispositivo;
  const GraficosRealTimeScreenF({Key? key, required this.idDispositivo})
      : super(key: key);

  @override
  State<GraficosRealTimeScreenF> createState() =>
      _GraficosRealTimeScreenState();
}

class _GraficosRealTimeScreenState extends State<GraficosRealTimeScreenF> {
  late ChartSeriesController _chartSeriesController;
  late List<TemperaturaModel> chartData;
  get math => null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tempProvider = Provider.of<TemperaturaProvider>(context);
    getDatosEnVivo(provider: tempProvider);

    if (tempProvider.listTemperaturas.isEmpty) {
      return const Scaffold(
          body: Center(
        child: CircularProgressIndicator(),
      ));
    }
    chartData = tempProvider.listTemperaturas;
    return SafeArea(
        child: Scaffold(
            body: SfCartesianChart(
                series: <LineSeries<TemperaturaModel, double>>[
          LineSeries<TemperaturaModel, double>(
            onRendererCreated: (ChartSeriesController controller) {
              _chartSeriesController = controller;
            },
            dataSource: chartData,
            color: const Color.fromRGBO(192, 108, 132, 1),
            xValueMapper: (TemperaturaModel sales, _) => sales.getTime(),
            yValueMapper: (TemperaturaModel sales, _) => sales.temperatura,
          )
        ],
                primaryXAxis: NumericAxis(
                    majorGridLines: const MajorGridLines(width: 0),
                    edgeLabelPlacement: EdgeLabelPlacement.none,
                    interval: 3,
                    title: AxisTitle(text: 'Tiempo')),
                primaryYAxis: NumericAxis(
                    axisLine: const AxisLine(width: 0),
                    majorTickLines: const MajorTickLines(size: 0),
                    title: AxisTitle(text: 'Temperatura (°C)')))));
  }

  void getDatosEnVivo({required provider}) {
    Timer.periodic(const Duration(seconds: 2),
        (timer) => {updateDataSource(provider: provider)});
  }

  int time = 19;

  Future<void> updateDataSource({required TemperaturaProvider provider}) async {
    final listUltimas = await provider.getUltimasTemeperaturas(
        idDispositivo: widget.idDispositivo);
    for (var newData in listUltimas) {
      chartData.add(newData);
      chartData.removeAt(0);

      _chartSeriesController.updateDataSource(
          addedDataIndex: chartData.length - 1, removedDataIndex: 0);
    }
  }

  // List<LiveData> getChartData() {
  //   return <LiveData>[
  //     LiveData(0, 42),
  //     LiveData(1, 47),
  //     LiveData(2, 43),
  //     LiveData(3, 49),
  //     LiveData(4, 54),
  //     LiveData(5, 41),
  //     LiveData(6, 58),
  //     LiveData(7, 51),
  //     LiveData(8, 93),
  //     LiveData(9, 41),
  //     LiveData(10, 53),
  //     LiveData(11, 72),
  //     LiveData(12, 86),
  //     LiveData(13, 52),
  //     LiveData(14, 94),
  //     LiveData(15, 92),
  //     LiveData(16, 86),
  //     LiveData(17, 72),
  //     LiveData(18, 94)
  //   ];
  // }

}
