import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  final String _baseUrl = "https://newsapi.org/v2";
  final String _apiKey = "478731405d704e20b70650faa96b6a2d";
  final http.Client httpClient = http.Client();

  Future<dynamic> get(String url) async {
    var apiUrl = Uri.parse("$_baseUrl/$url&apiKey=$_apiKey");
    try {
      var response = await httpClient.get(apiUrl);
      if (response.statusCode == 200) {
        var map = jsonDecode(response.body);
        return map;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      return null;
    }
  }
}