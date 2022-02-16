import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ketokoku/controller/item_controller.dart';
import 'package:ketokoku/widgets/card_item.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage(this.controller, {Key? key}) : super(key: key);
  final ItemController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Stok Barang'),
        ),
        body: Obx(() {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              return CardItem(item: controller.items[index]);
            },
          );
        }));
  }
}
