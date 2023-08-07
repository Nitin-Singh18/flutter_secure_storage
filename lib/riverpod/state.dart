import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/model/model.dart';

final itemProvider =
    ChangeNotifierProvider<ItemProvider>((ref) => ItemProvider());

class ItemProvider extends ChangeNotifier {
  List<Item> _item = [];

  List<Item> get item => _item;

  void addItem(Item item) {
    _item.add(item);
    notifyListeners();
  }

  void fetchItems(List<Item> items) {
    _item = items;
    notifyListeners();
  }

  void deleteItem(Item item) {
    _item.remove(item);
    notifyListeners();
  }
}
