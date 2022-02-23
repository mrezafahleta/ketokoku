import 'dart:convert';

import 'package:ketokoku/models/user.dart';
import 'package:http/http.dart' as http;

class UserServices {
  final String baseUrlHp = "http://192.168.222.195:8000/api/";
  final String baseUrlEmulator = "http://10.0.2.2:8000/api/";
  Future<User> login({required String email, required String password}) async {
    final response = await http.post(Uri.parse(baseUrlEmulator + "login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'email': email, 'password': password}));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      User user = User.fromJson(data['user']);
      user.token = data['token_type'] + ' ' + data['access_token'];

      return user;
    } else {
      throw (jsonDecode(response.body)['message']);
    }
  }
}
