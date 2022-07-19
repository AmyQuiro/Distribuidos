//
//SHA1: EE:72:E7:8B:3E:4D:C4:65:7E:9B:AD:5E:6A:C9:33:D3:BC:FC:B8:AA
/*
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
}*/
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream = StreamController.broadcast();
  static Stream<String> get messageStream => _messageStream.stream;

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    //  'This channel is used for important notifications.', // description
    importance: Importance.max,
  );

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future _backgroundHandler(RemoteMessage message) async {
    print('onBackgroundHandler: ${message.messageId}');
    print(message.data);
    _messageStream.add(message.data['producto'] ?? 'no data');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    // print('onMessageHandler: ${message.messageId}');
    print(message.data);
    _messageStream.add(message.data['producto'] ?? 'no data');

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    RemoteNotification? notification = message.notification;
    String iconName = AndroidInitializationSettings('@mipmap/ic_launcher')
        .defaultIcon
        .toString();

    // Si `onMessage` es activado con una notificación, construimos nuestra propia
    // notificación local para mostrar a los usuarios, usando el canal creado.
    if (notification != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                //    channel.description,
                icon: iconName),
          ));
    }
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    //print('onMessageOpenApp: ${message.messageId}');
    print(message.data);
    _messageStream.add(message.data['producto'] ?? 'no data');
  }

  static Future initializeApp() async {
    //Push Notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('Token: $token');

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    //Local Notifications
  }

  static closeStreams() {
    _messageStream.close();
  }
}
