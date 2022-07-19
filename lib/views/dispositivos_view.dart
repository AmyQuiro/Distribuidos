import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_listas/modelo/DTemperatura.dart';
import 'package:flutter_application_listas/modelo/DispositivosModel.dart';
import 'package:flutter_application_listas/provider/dTemperaturaProvider.dart';
import 'package:flutter_application_listas/provider/dispositivoProvider.dart';
import 'package:flutter_application_listas/views/disp_view.dart';
import 'package:flutter_application_listas/views/dispo_view.dart';
import 'package:provider/provider.dart';

class DispositivoView extends StatefulWidget {
  const DispositivoView({Key? key}) : super(key: key);

  @override
  State<DispositivoView> createState() => _DispositivoViewState();
}

class _DispositivoViewState extends State<DispositivoView> {
  List<DTemperaturaModel>? dispositivo;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new DTemperaturaProvider(),
      child: DispoView(),
    );
  }
}
