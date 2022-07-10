import 'package:flutter/material.dart';
import 'package:flutter_application_listas/modelo/dispositivosModel.dart';
import 'package:flutter_application_listas/provider/TemperaturaProvider.dart';
import 'package:flutter_application_listas/provider/dispositivoProvider.dart';
import 'package:flutter_application_listas/provider/provider_t.dart';
import 'package:flutter_application_listas/views/disp_view.dart';
import 'package:flutter_application_listas/views/graficos_real_time_screen.dart';
import 'package:flutter_application_listas/views/home_page2.dart';
import 'package:flutter_application_listas/views/screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TemperaturaProvider(idDispositivo: ""),
        ),
        ChangeNotifierProvider(
          create: (_) => dispositivoProvider(),
          child: DispositivosView(),
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LISTAS',
      initialRoute: 'homePage2',
      routes: {
        'homePage2': (_) => DispositivoHome(),
      },
    );
  }
}
