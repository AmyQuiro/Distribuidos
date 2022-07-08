import 'package:flutter/material.dart';
import 'package:flutter_application_listas/modelo/TemperaturaModel.dart';

import '../views/graph_view.dart';

class ListTempetura extends StatelessWidget {
  const ListTempetura({
    Key? key,
    required this.options,
  }) : super(key: key);

  final List<TemperaturaModel> options;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (options.length == 0) {
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
            Text('Temperatura: ${options[i].temperatura}'),
            Text('Humedad:${options[i].humedad}'),
            Text('Tiempo:${options[i].tiempo}')
          ],
        ),
        // trailing: const Icon(Icons.arrow_forward_ios_outlined),
        onTap: () {
          // String datos = options[i];

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => GraphView(
          //             data: datos,
          //           )),
          // );
        },
      ),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: options.length,
    );
  }
}
