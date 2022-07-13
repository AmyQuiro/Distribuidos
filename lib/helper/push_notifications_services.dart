//
//SHA1: EE:72:E7:8B:3E:4D:C4:65:7E:9B:AD:5E:6A:C9:33:D3:BC:FC:B8:AA

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream = StreamController.broadcast();
  static Stream<String> get messageStream => _messageStream.stream;

  static Future _backgroundhandler(RemoteMessage message) async {
    //print('onbackground Handler ${message.messageId}');
    print(message.data);
    _messageStream.add(message.data['producto'] ?? 'no data');
  }

  static Future _onMessagehandler(RemoteMessage message) async {
    // print('onMessage Handler ${message.messageId}');
    print(message.data);
    _messageStream.add(message.data['producto'] ?? 'no data');
  }

  static Future _onMessageopenApp(RemoteMessage message) async {
    //  print('onMessageOpenApp Handler ${message.messageId}');
    print(message.data);
    _messageStream.add(message.data['producto'] ?? 'no data');
  }

  static Future initializeApp() async {
    // push notificatios
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('Token: $token');

    FirebaseMessaging.onBackgroundMessage(_backgroundhandler);
    FirebaseMessaging.onMessage.listen(_onMessagehandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageopenApp);

    //local notification
  }

  static closeStreams() {
    _messageStream.close();
  }
}
