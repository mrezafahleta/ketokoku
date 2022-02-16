import 'package:get/get.dart';
import 'package:ketokoku/models/item.dart';
import 'package:ketokoku/models/user_session.dart';
import 'package:ketokoku/services/items_services.dart';

class ItemController extends GetxController {
  final _isLoading = false.obs;
  final _isDataEmpty = false.obs;
  final _items = <Item>[].obs;

  bool get isLoading => _isLoading.value;
  bool get isDataEmpty => _isDataEmpty.value;

  List<Item> get items => _items.toList();

  @override
  void onInit() {
    super.onInit();
    fetchItem();
  }

  Future<void> fetchItem() async {
    try {
      _isLoading.value = true;
      final data_items = await ItemService().getItems(token: UserSession.token);

      // ignore: unnecessary_null_comparison
      if (data_items == null) {
        _isDataEmpty.value = true;
      } else {
        _items.assignAll(data_items);
      }
    } finally {
      _isLoading.value = false;
    }
  }
}
