import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/model/model.dart';

final itemProvider =
    ChangeNotifierProvider<ItemProvider>((ref) => ItemProvider());

class ItemProvider extends ChangeNotifier {
  List<Item> _itemList = [];

  List<Item> get item => _itemList;

  void addItem(Item item) {
    _itemList.add(item);
    notifyListeners();
  }

  void fetchItems(List<Item> items) {
    _itemList = items;
    notifyListeners();
  }

  void deleteItem(Item item) {
    _itemList.remove(item);
    notifyListeners();
  }
}
