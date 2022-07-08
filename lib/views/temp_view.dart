import 'package:flutter/material.dart';
import 'package:flutter_application_listas/provider/TemperaturaProvider.dart';
import 'package:flutter_application_listas/views/graph_view.dart';
import 'package:provider/provider.dart';

import '../widget/list_temp_widget.dart';

class TemperaturaView extends StatefulWidget {
  const TemperaturaView({Key? key}) : super(key: key);

  @override
  State<TemperaturaView> createState() => _TemperaturaViewState();
}

class _TemperaturaViewState extends State<TemperaturaView> {
  @override
  Widget build(BuildContext context) {
    final tempProvider = Provider.of<TemperaturaProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('lista300'),
          elevation: 0,
        ),
        body: ListTempetura(
          options: tempProvider.listTemperaturas,
        ));
  }
}
