import 'dart:convert';

import 'package:http/http.dart' as http;

class CategoryService {
  final String baseUrlHp = "http://192.168.78.167:8000/api/";
  final String baseUrlEmulator = "http://10.0.2.2:8000/api/";

  Future<List> fetchCategory({required String token}) async {
    final response = await http
        .get(Uri.parse(baseUrlEmulator + 'category'), headers: <String, String>{
      'Content-Type': 'application/json;  charset=UTF-8',
      'Authorization': token.toString(),
    });

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['category'];

      return data;
    } else {
      throw (jsonDecode(response.body)['message']);
    }
  }
}
