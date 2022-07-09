import 'package:flutter/material.dart';
import 'package:flutter_application_listas/provider/TemperaturaProvider.dart';
import 'package:flutter_application_listas/provider/provider_t.dart';
import 'package:flutter_application_listas/views/home_page2.dart';
import 'package:flutter_application_listas/views/screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      // ChangeNotifierProvider(create: (_) => ProviderTem()),
      // ChangeNotifierProvider(create: (_) => TemperaturaProvider()),
      ChangeNotifierProvider(
        create: (_) => TemperaturaProvider(),
        child: TemperaturaView(),
      ),
    ]);
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
        'homePage': (_) => HomePage(),
        'list': (_) => TemperaturaView(),
        'homePage2': (_) => HomePage2(),
      },
    );
  }
}
