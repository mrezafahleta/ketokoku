import 'package:get/get.dart';
import 'package:ketokoku/bindings/item_bindins.dart';
import 'package:ketokoku/bindings/login_bindings.dart';
import 'package:ketokoku/splash_screen.dart';
import 'package:ketokoku/views/items_page.dart';
import 'package:ketokoku/views/login_page.dart';

final List<GetPage> routes = [
  GetPage(name: '/', page: () => const SplashScreen()),
  GetPage(
      name: '/login',
      page: () => LoginPage(Get.find()),
      binding: LoginBindings()),
  GetPage(
      name: '/items',
      page: () => ItemsPage(Get.find()),
      binding: ItemBindings())
];
