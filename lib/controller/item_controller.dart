import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ketokoku/models/category.dart';
import 'package:ketokoku/models/item.dart';
import 'package:ketokoku/models/user_session.dart';
import 'package:ketokoku/services/category_services.dart';
import 'package:ketokoku/services/items_services.dart';

class ItemController extends GetxController {
  final tanggalController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  DateTime tanggaldb = DateTime.now();

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
        initialDate: _selectedDate,
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));

    if (pickedDate != null) {
      _selectedDate = pickedDate;
      var date =
          "${pickedDate.toLocal().day}-${pickedDate.toLocal().month}-${pickedDate.toLocal().year}";
      tanggalController.text = date;
      tanggaldb = pickedDate;
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
      try {
      
        await ItemService().postItems(
            token: UserSession.token,
            userId: UserSession.id,
            categoriId: namaCategory.value,
            namaItem: namaItem.value,
              harga: hargaItem.value,
            jumlah: jumlahItem.value,
          
            tanggal: tanggaldb.toString());
            tanggalController.text = "";
        Get.back();
        fetchItem();
      
        Get.snackbar('Berhasil', '${namaItem.value} berhasil disimpan');
      } catch (e) {
        print(e.toString());
        Get.snackbar('Gagal', e.toString());
      }
    }
  }
}
