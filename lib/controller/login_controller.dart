import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ketokoku/models/user.dart';
import 'package:ketokoku/models/user_session.dart';
import 'package:ketokoku/services/user_service.dart';
import 'package:ketokoku/views/admin/home.dart';
import 'package:ketokoku/views/users/home.dart';

class LoginController extends GetxController {
  var show = true.obs;
  var emailIsEmpty = false.obs;
  var isLoading = false.obs;
  var passwordIsWrong = false.obs;
  final emailController = TextEditingController(text: "reza@gmail.com");
  final passwordController = TextEditingController(text: "ejakbae");

  Future<void> login() async {
    if (emailController.text.isEmpty) {
      emailIsEmpty.value = true;
    } else if (passwordController.text.isEmpty) {
      passwordIsWrong.value = true;
    } else {
      try {
        isLoading.value = true;
        User auth = await UserServices().login(
            email: emailController.text, password: passwordController.text);

        if (auth.roleId == 1) {
          UserSession.id = auth.id;
          UserSession.email = auth.email;
          UserSession.name = auth.name;
          UserSession.token = auth.token.toString();
          UserSession.roleId = auth.roleId;
          UserSession.status = auth.status;
          Get.off(() => const HomeAdmin());
          Get.snackbar('Login Berhasil',
              'Selamat Datang ${auth.roleId == 1 ? "Admin" : 'User'}');
        } else {
          UserSession.id = auth.id;
          UserSession.email = auth.email;
          UserSession.name = auth.name;
          UserSession.token = auth.token.toString();
          UserSession.roleId = auth.roleId;
          UserSession.status = auth.status;
          Get.off(() => const UserHome());
          Get.snackbar('Login Berhasil',
              'Selamat Datang ${auth.roleId == 1 ? "Admin" : auth.name}');
        }
      } catch (e) {
        Get.snackbar("Failed", e.toString(),
            colorText: Colors.black, backgroundColor: Colors.white);
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> logout() async {
    UserSession.id = 0;
    UserSession.email = "";
    UserSession.name = "";
    UserSession.token = "";
    UserSession.roleId = 0;
    UserSession.status = "";
    // emailController.text = "";
    // passwordController = "";
    Get.offNamed('/login');
    Get.snackbar('Logout', "Anda telah logout");
  }

  void changeShow() {
    show.value = !show.value;
  }
}
