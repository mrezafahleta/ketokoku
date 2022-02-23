import 'dart:convert';

import 'package:ketokoku/models/item.dart';
import 'package:http/http.dart' as http;

class ItemService {
  final String baseUrlHp = "http://192.168.222.195:8000/api/";
  final String baseUrlEmulator = "http://10.0.2.2:8000/api/";

  Future<List<Item>> getItems({required String token}) async {
    final response = await http
        .get(Uri.parse(baseUrlEmulator + 'items'), headers: <String, String>{
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

  Future postItems({
    required String token,
    required int userId,
    required int categoriId,
    required String namaItem,
    required int jumlah,
    required int harga,
    required String tanggal,
  }) async {
    final response = await http.post(Uri.parse(baseUrlEmulator + "additems"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': token.toString()
        },
        body: jsonEncode({
          'user_id': userId,
          'category_id': categoriId,
          'nama_item': namaItem,
          'harga': harga,
          'jumlah': jumlah,
          'tanggal_masuk': tanggal
        }));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['message'];
      return data;
    } else {
      throw (jsonDecode(response.body)['message']);
    }
  }
}
