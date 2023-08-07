// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:secure_storage_demo/data/model/model.dart';

import 'package:secure_storage_demo/main.dart';
import 'package:secure_storage_demo/riverpod/state.dart';

void main() {
  late ItemProvider itemProvider;
  setUp(() {
    itemProvider = ItemProvider();
  });
  test('Item List should have items when database is not empty ', () {
    List<Item> items = [
      Item(title: 'Item1', des: 'It is item1.'),
      Item(title: 'Item2', des: 'It is item2')
    ];

    itemProvider.fetchItems(items);

    expect(itemProvider.item.isNotEmpty, true);
  });
  test('Item List should have no items when database is empty ', () {
    List<Item> items = [];

    itemProvider.fetchItems(items);

    expect(itemProvider.item.isEmpty, true);
  });

  test('An item should be deleted from itemList', () {
    Item item1 = Item(title: 'Item1', des: 'It is item1.');
    Item item2 = Item(title: 'Item2', des: 'It is item2');

    itemProvider.addItem(item1);
    itemProvider.addItem(item2);
    //length should be 2
    expect(itemProvider.item.length, 2);

    itemProvider.deleteItem(item1);

    //length of itemList should be 1 after deleting an item
    expect(itemProvider.item.length, 1);

    //itemList should not contain the deleted item
    expect(itemProvider.item.contains(item1), false);
  });
}
