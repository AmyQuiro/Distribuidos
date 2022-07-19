import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_listas/views/graph_view.dart';
import 'package:flutter_application_listas/widget/dispositivos_widget.dart';
import 'package:flutter_application_listas/provider/dTemperaturaProvider.dart';
import 'package:provider/provider.dart';

import '../widget/list_dispositivo.dart';
import '../widget/list_temp_widget.dart';

class DispoView extends StatefulWidget {
  const DispoView({Key? key}) : super(key: key);

  @override
  State<DispoView> createState() => _DispoViewState();
}

class _DispoViewState extends State<DispoView> {
  @override
  Widget build(BuildContext context) {
    final tempProvider = Provider.of<DTemperaturaProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Dispositivos'),
          elevation: 0,
        ),
        body: listTDispositivos(
          dispositivos: tempProvider.listDTemperaturas,
        ));
  }
}
