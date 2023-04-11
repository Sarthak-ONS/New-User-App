import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';

class RequestHelper {
  Future request({required String endPoint, required Map bodyMap}) async {
    try {
      final http.Response response =
          await http.post(Uri.parse('$serverHost$endPoint'.trim()),
              headers: {
                'Content-Type': 'application/json',
              },
              body: json.encode(bodyMap));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
