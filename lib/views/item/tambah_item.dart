import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:ketokoku/controller/item_controller.dart';
import 'package:ketokoku/models/category.dart';
import 'package:intl/intl.dart';

class TambahItem extends StatelessWidget {
  const TambahItem(this.controller, {Key? key}) : super(key: key);

  final ItemController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Input Barang'),
      ),
      body: Container(
        child: Form(
          key: controller.formKey,
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(children: [
                DropdownSearch<Category>(
                  showSearchBox: true,
                  mode: Mode.DIALOG,
                  // ignore: avoid_print
                  onChanged: (value) =>
                      controller.namaCategory.value = value!.id,
                  dropdownBuilder: (context, data) =>
                      Text(data?.name ?? 'Silahkan Pilih Kategori'),
                  popupItemBuilder: (context, item, isSelected) {
                    return ListTile(
                      title: Text(item.name),
                    );
                  },
                  onFind: (text) async {
                    var data = controller.categories;
                    return data;
                    // return data;
                  },
                  // onFind: (text) => controller.categories
                  // {
                  //   final response = await http.get(
                  //       Uri.parse('http://10.0.2.2:8000/api/category'),
                  //       headers: <String, String>{
                  //         'Content-Type': 'application/json;  charset=UTF-8',
                  //         'Authorization': UserSession.token,
                  //       });

                  //   if (response.statusCode != 200) {
                  //     return [];
                  //   } else {
                  //     List kategori = jsonDecode(response.body)['category'];
                  //     List<Category> categories = [];
                  //     kategori.forEach((element) {
                  //       categories.add(Category(
                  //           id: element['id'],
                  //           slug: element['slug'],
                  //           name: element['nama']));
                  //     });

                  //     return categories;
                  //   }
                  // }
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Nama item', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == "") {
                      return 'Field nama item tidak boleh kosong';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    controller.namaItem.value = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Harga item', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == "") {
                      return 'Field Harga item tidak boleh kosong';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    controller.hargaItem.value = int.parse(value);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Jumlah item', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == "") {
                      return 'Field Jumlah item tidak boleh kosong';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    controller.jumlahItem.value = int.parse(value);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                    controller: controller.tanggalController,
                    onTap: () => controller.getDate(),
                    onSaved: (value) =>
                        controller.tanggalController.text = value.toString(),
                    showCursor: true,
                    autofocus: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Tanggal Beli")),
                const SizedBox(
                  height: 15,
                ),
              ])),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.simpanData();
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
