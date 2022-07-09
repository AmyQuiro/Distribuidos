import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_listas/modelo/DispositivosModel.dart';
import 'package:flutter_application_listas/provider/dispositivoProvider.dart';
import 'package:flutter_application_listas/views/disp_view.dart';
import 'package:provider/provider.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  List<DispositivoModel>? dispositivo;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new dispositivoProvider(),
      child: DispositivosView(),
    );
  }
}
