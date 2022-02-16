import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ketokoku/controller/item_controller.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage(this.controller, {Key? key}) : super(key: key);
  final ItemController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (controller.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Text('tes');
    }));
  }
}
