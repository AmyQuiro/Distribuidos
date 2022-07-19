import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_listas/modelo/DTemperatura.dart';
import 'package:flutter_application_listas/modelo/DispositivosModel.dart';

import 'package:flutter_application_listas/views/temp_view.dart';

import '../views/graficos_real_time_screen.dart';

class listTDispositivos extends StatelessWidget {
  const listTDispositivos({
    Key? key,
    required this.dispositivos,
  }) : super(key: key);

  final List<DTemperaturaModel> dispositivos;
  // late final String ID;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (dispositivos.length == 0) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return ListView.separated(
      itemBuilder: (context, i) => ListTile(
          title: Column(
            children: [
              Text('ID: ${dispositivos[i].id}'),
              Text('Temperatura:${dispositivos[i].temperatura}'),
              Text('Humedad:${dispositivos[i].humedad}'),
              Text('UltimaRegistro:${dispositivos[i].ultimoRegistro}'),
              Text('Estado:${dispositivos[i].estado}'),
              // ID : dispositivos[i].id
            ],
          ),
          trailing: const Icon(Icons.arrow_forward_ios_outlined),
          onTap: () {
            final myDispositivo = dispositivos[i];
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      GraficosRealTimeScreen(idDispositivo: myDispositivo.id)),
            );
          }),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: dispositivos.length,
    );
  }
}
