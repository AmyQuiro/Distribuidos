import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_listas/views/graph_view.dart';
import 'package:flutter_application_listas/widget/dispositivos_widget.dart';
import 'package:flutter_application_listas/provider/dispositivoProvider.dart';
import 'package:provider/provider.dart';

import '../widget/list_temp_widget.dart';

class DispositivosView extends StatefulWidget {
  const DispositivosView({Key? key}) : super(key: key);

  @override
  State<DispositivosView> createState() => _DispositivosViewState();
}

class _DispositivosViewState extends State<DispositivosView> {
  @override
  Widget build(BuildContext context) {
    final tempProvider = Provider.of<dispositivoProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Dispositivos'),
          elevation: 0,
        ),
        body: listDispositivos(
          options: tempProvider.listDispositivos,
        ));
  }
}
