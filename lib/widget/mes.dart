import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../views/graficos_real_time_screen.dart';

class Mes extends StatefulWidget {
  const Mes({Key? key}) : super(key: key);

  @override
  State<Mes> createState() => _MesState();
}

class _MesState extends State<Mes> {
  final List<String> items = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Noviembre',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return /*Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Graficos Por Mes'),
        elevation: 10,
      ),
      body: */
        Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: const [
              Icon(
                Icons.list,
                size: 16,
                color: Color.fromARGB(255, 244, 243, 243),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  'MES',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 242, 242, 242),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const GraficosRealTimeScreen(
                        idDispositivo: "123",
                      )),
            );
          },
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: Color.fromARGB(255, 249, 248, 247),
          iconDisabledColor: Colors.grey,
          buttonHeight: 50,
          buttonWidth: 160,
          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.black26,
            ),
            color: Color.fromARGB(255, 114, 82, 255),
          ),
          buttonElevation: 2,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 200,
          dropdownWidth: 200,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Color.fromARGB(255, 82, 102, 255),
          ),
          dropdownElevation: 8,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          offset: const Offset(-20, 0),
        ),
      ),
    );
    /* ****
    );*/
  }
}
