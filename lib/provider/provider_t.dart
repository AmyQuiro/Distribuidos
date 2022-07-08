import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../helper/API.dart';

class ProviderTem {
  API service = new API();
  ProviderTem() {
    print('ProviderTem inicializado');
  }

  getnowtemperatura() async {
    var uri = Uri.parse(service.urlBase + 'support/test?id=42323');
    final response = await http.get(uri);
    final Map<String, dynamic> decodeData = jsonDecode(response.body);
    print(decodeData['results']);
  }
}
