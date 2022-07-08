import 'package:flutter/material.dart';

import 'package:flutter_application_listas/modelo/TemperaturaModel.dart';
import 'package:flutter_application_listas/provider/TemperaturaProvider.dart';
import 'package:flutter_application_listas/views/screens.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TemperaturaModel>? temperatura;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new TemperaturaProvider(),
      child: TemperaturaView(),
    );
  }

  // Widget build(BuildContext context) {

  // return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Temperatura'),
  //     ),
  //     body: Visibility(
  //       visible: isLoaded,
  //       // ignore: sort_child_properties_last
  //       child: ListView.builder(
  //         itemCount: temperatura?.length,
  //         itemBuilder: (context, index) {
  //           return Container(
  //             padding: const EdgeInsets.all(16),
  //             child: Row(
  //               children: [
  //                 Container(
  //                   height: 50,
  //                   width: 50,
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(12),
  //                     color: Colors.grey[300],
  //                   ),
  //                 ),
  //                 const SizedBox(width: 16),
  //                 Expanded(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         temperatura![index].temperatura,
  //                         maxLines: 2,
  //                         overflow: TextOverflow.ellipsis,
  //                         style: const TextStyle(
  //                           fontSize: 24,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                       Text(
  //                         temperatura![index].humedad,
  //                         maxLines: 3,
  //                         overflow: TextOverflow.ellipsis,
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           );
  //         },
  //       ),
  //       replacement: const Center(
  //         child: CircularProgressIndicator(),
  //       ),
  //     ));

  // }
}
