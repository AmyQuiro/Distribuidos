import 'package:flutter/material.dart';
import 'package:flutter_application_listas/modelo/TemperaturaModel.dart';
import 'package:intl/intl.dart';

class ListTempetura extends StatelessWidget {
  const ListTempetura({
    Key? key,
    required this.options,
  }) : super(key: key);

  final List<TemperaturaModel> options;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (options.isEmpty) {
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
            Text('Temperatura: ${options[i].temperatura} °C'),
            Text('Humedad: ${options[i].humedad}'),
            Text(
                'Fecha y hora: ${DateFormat('dd-MM-yyyy – kk:mm').format(options[i].tiempo)}  ')
          ],
        ),
        onTap: () {},
      ),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: options.length,
    );
  }
}
