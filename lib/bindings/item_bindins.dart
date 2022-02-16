import 'package:get/get.dart';
import 'package:ketokoku/controller/item_controller.dart';

class ItemBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemController());
  }
}
