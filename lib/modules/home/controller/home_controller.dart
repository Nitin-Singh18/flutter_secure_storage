import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secure_storage_demo/riverpod/state.dart';
import 'package:secure_storage_demo/services/secure_storage.dart';

import '../../../data/model/model.dart';

class HomeController {
  final WidgetRef ref;
  HomeController(this.ref);

  final SecureStorage secureStorage = SecureStorage();

  void getAllData() async {
    ref.read(itemProvider).fetchItems(await secureStorage.fetchItems());
  }

  void deleteItem(Item item) {
    secureStorage.deleteItem(item);
    ref.read(itemProvider).deleteItem(item);
  }
}
