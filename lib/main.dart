import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_listas/helper/push_notifications_services.dart';
import 'package:flutter_application_listas/modelo/dispositivosModel.dart';
import 'package:flutter_application_listas/provider/TemperaturaProvider.dart';
import 'package:flutter_application_listas/provider/dTemperaturaProvider.dart';
import 'package:flutter_application_listas/provider/provider_t.dart';
import 'package:flutter_application_listas/views/disp_view.dart';
import 'package:flutter_application_listas/views/dispositivos_view.dart';
import 'package:flutter_application_listas/views/graf_mes.dart';
import 'package:flutter_application_listas/views/graficos_real_time_screen.dart';
import 'package:flutter_application_listas/views/graficos_x_mes.dart';
import 'package:flutter_application_listas/views/home_notificacion.dart';
import 'package:flutter_application_listas/views/home_page2.dart';
import 'package:flutter_application_listas/views/message_screen.dart';
import 'package:flutter_application_listas/views/screens.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(MyApp());
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
          create: (_) => dTemperaturaProvider(),
          child: DispositivoView(),
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      new GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    //context
    PushNotificationService.messaging
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        final snackBar = SnackBar(content: Text(message.data['producto']));
        messengerKey.currentState?.showSnackBar(snackBar);
        navigatorKey.currentState
            ?.pushNamed('message', arguments: message.data['producto']);
      }
    });

    //context

    PushNotificationService.messageStream.listen((message) {
      navigatorKey.currentState?.pushNamed('homePage2');
      final snackBar = SnackBar(content: Text(message));
      messengerKey.currentState?.showSnackBar(snackBar);
    });

    /* PushNotificationService.messageStream.listen((message) {
      // print('MyApp:$message');
      navigatorKeys.currentState?.pushNamed('message', arguments: message);

      final snackBar = SnackBar(content: Text(message));
      messengerKey.currentState?.showSnackBar(snackBar);
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LISTAS',
      initialRoute: 'principal',
      navigatorKey: navigatorKey, //navegar
      scaffoldMessengerKey: messengerKey, //sancks
      routes: {
        //
        'homeNoti': (_) => HomeNotificacion(),
        'message': (_) => MessageScreen(),
        'GrafMes': (_) => GraficosMes(),
        'principal': (_) => DispositivoView(),
      },
    );
  }
}
