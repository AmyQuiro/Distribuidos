import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_listas/modelo/DispositivosModel.dart';
import 'package:flutter_application_listas/views/home_page.dart';

class listDispositivos extends StatelessWidget {
  const listDispositivos({
    Key? key,
    required this.options,
  }) : super(key: key);

  final List<DispositivoModel> options;

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
              Text('ID: ${options[i].id}'),
              Text('Nombre:${options[i].name}')
            ],
          ),
          trailing: const Icon(Icons.arrow_forward_ios_outlined),
          onTap: () {
            // String datos = options[i];

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()
                  //       builder: (context) => GraphView(
                  //             data: datos,
                  //           )
                  ),
            );
          }),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: options.length,
    );
  }
}
