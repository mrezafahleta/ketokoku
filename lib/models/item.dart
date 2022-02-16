import 'package:ketokoku/models/category.dart';
import 'package:ketokoku/models/user.dart';

class Item {
  final int id;
  User? user;
  Category? category;
  final String namaItems;
  final int harga;
  final String hargaRp;
  final int jumlah;
  final String tanggalMasuk;

  Item(
      {required this.id,
      required this.user,
      required this.category,
      required this.namaItems,
      required this.harga,
      required this.hargaRp,
      required this.jumlah,
      required this.tanggalMasuk});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        id: json['id'],
        user:
            json['user'] == null ? json['user'] : User?.fromJson(json['user']),
        category: json['category'] == null
            ? json['category']
            : Category?.fromJson(json['category']),
        namaItems: json['item'],
        harga: json['harga'],
        hargaRp: json['harga_rupiah'],
        jumlah: json['jumlah'],
        tanggalMasuk: json['tanggal_masuk']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'category': category,
      'item': namaItems,
      'harga': harga,
      'harga_rupiah': hargaRp,
      'jumlah': jumlah,
      'tanggal_masuk': tanggalMasuk
    };
  }
}
