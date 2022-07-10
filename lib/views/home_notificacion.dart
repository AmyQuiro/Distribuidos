import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeNotificacion extends StatelessWidget {
  const HomeNotificacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('noti'),
      ),
      body: Center(
        child: Text('Home Notificaciones'),
      ),
    );
  }
}
