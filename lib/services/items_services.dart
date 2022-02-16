import 'dart:convert';

import 'package:ketokoku/models/item.dart';
import 'package:http/http.dart' as http;

class ItemService {
  final String baseUrlHp = "http://192.168.96.83:8000/api/";
  final String baseUrlEmulator = "http://10.0.2.2:8000/api/";

  Future<List<Item>> getItems({required String token}) async {
    final response = await http
        .get(Uri.parse(baseUrlHp + 'items'), headers: <String, String>{
      'Content-Type': 'application/json;  charset=UTF-8',
      'Authorization': token.toString(),
    });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['items'] as List;

      final items = data.map((e) => Item.fromJson(e)).toList();

      return items;
    } else {
      throw (jsonDecode(response.body)['message']);
    }
  }
}
