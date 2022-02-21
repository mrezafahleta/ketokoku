import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ketokoku/models/category.dart';
import 'package:ketokoku/models/item.dart';
import 'package:ketokoku/models/user_session.dart';
import 'package:ketokoku/services/category_services.dart';
import 'package:ketokoku/services/items_services.dart';

class ItemController extends GetxController {
  final tanggalController = TextEditingController();

  var tanggal_sekarang = DateTime.now().obs;

  RxInt namaCategory = 0.obs;
  RxString namaItem = "".obs;
  RxInt hargaItem = 0.obs;
  RxInt jumlahItem = 0.obs;

  final formKey = GlobalKey<FormState>();
  final _isLoading = false.obs;
  final _isDataEmpty = false.obs;
  final _items = <Item>[].obs;

  List<Category> categories = [];
  var dropdownvalue = "".obs;

  bool get isLoading => _isLoading.value;
  bool get isDataEmpty => _isDataEmpty.value;

  List<Item> get items => _items.toList();
  // List<Category> get kategori => _category.toList();

  @override
  void onInit() {
    super.onInit();
    fetchItem();
    getKategori();
  }

  getDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));

    if (pickedDate != null) {
      tanggalController.text = pickedDate.toString();
      update();
    }
  }

  void getKategori() async {
    try {
      List _data =
          await CategoryService().fetchCategory(token: UserSession.token);

      _data.forEach((element) {
        categories.add(Category(
            id: element['id'], slug: element['slug'], name: element['nama']));
      });

      // _data.forEach((element) {
      //   categories.add(Category(
      //       id: element['id'], slug: element['slug'], name: element['name']));
      // });
      Get.snackbar('Berhasil', '');
    } catch (e) {
      Get.snackbar('Failed', e.toString());
    }
  }

  Future<void> fetchItem() async {
    try {
      _isLoading.value = true;
      final dataItems = await ItemService().getItems(token: UserSession.token);

      // ignore: unnecessary_null_comparison
      if (dataItems == null) {
        _isDataEmpty.value = true;
      } else {
        _items.assignAll(dataItems);
      }
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> simpanData() async {
    final isValid = formKey.currentState!.validate();

    if (isValid) {
      formKey.currentState!.save();
      Get.snackbar('berhasil',
          'Category: $namaCategory, Jumlah: $jumlahItem, Harga : $hargaItem, Tanggal : ${tanggalController.text}');
    }
  }
}
