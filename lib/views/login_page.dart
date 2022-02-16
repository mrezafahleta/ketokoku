import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ketokoku/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage(this.controller, {Key? key}) : super(key: key);
  final LoginController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff932113),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Ayo bergabung KETOKOKU',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(
              height: 50,
            ),
            // Obx(
            //   () => controller.isLoading ? CircularProgressIndicator() : Text(''),
            // ),
            // Obx(() => Text('${controller.nama}')),
            // ElevatedButton(
            //     onPressed: () {
            //       // controller.change();
            //     },
            //     child: Text('Ubah')),
            const SizedBox(
              height: 50,
            ),
            Obx(() {
              if (controller.emailIsEmpty.value == true) {
                return Center(
                  child: Column(
                    children: [
                      const Card(
                        color: Colors.red,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'Email tidak boleh kosong',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.emailIsEmpty.value = false;
                        },
                        icon: const Icon(Icons.clear),
                        color: Colors.white,
                      )
                    ],
                  ),
                );
              } else if (controller.passwordIsWrong.value == true) {
                return Center(
                  child: Column(
                    children: [
                      const Card(
                        color: Colors.red,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'Password tidak boleh kosong',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            controller.passwordIsWrong.value = false;
                          },
                          icon: const Icon(Icons.clear))
                    ],
                  ),
                );
              } else {
                return const SizedBox(
                  height: 0,
                );
              }
            }),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              width: double.infinity,
              height: 70,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.mail),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, label: Text("Email")),
                    ))
                  ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              width: double.infinity,
              height: 70,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.vpn_key,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Obx(() {
                      return Expanded(
                          child: TextField(
                        controller: controller.passwordController,
                        obscureText: controller.show.value,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.changeShow();
                                },
                                icon: controller.show.value
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)),
                            border: InputBorder.none,
                            label: const Text("Password")),
                      ));
                    })
                  ]),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Obx(() => Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          controller.login();
                        },
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text('Masuk'))))
              ],
            )
          ],
        ),
      )),
    );
  }
}
