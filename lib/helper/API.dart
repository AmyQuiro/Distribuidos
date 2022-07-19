import 'dart:convert';

class API {
  // final String urlBase =
  //     "https://staginggatewayservicios.multipago.com/api/v1/";
  final String urlBase = 'https://distribuidos-api.herokuapp.com/';

  getResponse(dynamic body) {
    final response = new APIResponse.fromJsonMap(json.decode(body));
    if (response.isOK()) {
      return response.data;
    }
    return null;
  }
}

class APIResponse {
  String statusCode;
  String message;
  dynamic data;

  APIResponse(this.statusCode, this.message, this.data);

  APIResponse.fromJsonMap(Map<String, dynamic> json)
      : statusCode = json['statusCode'],
        message = json['message'],
        data = json['data'];

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'message': message,
      'data': data,
    };
  }

  bool isOK() {
    return statusCode == '10000';
  }
}

class ApiResponse {}
