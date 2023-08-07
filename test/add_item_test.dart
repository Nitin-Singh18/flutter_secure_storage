import 'package:flutter_test/flutter_test.dart';
import 'package:secure_storage_demo/data/model/model.dart';
import 'package:secure_storage_demo/riverpod/state.dart';

void main() {
  late ItemProvider itemProvider;
  setUp(() {
    itemProvider = ItemProvider();
  });
  test('An item should be added to itemList', () {
    Item item1 = Item(title: 'Item1', des: 'It is item1.');
    Item item2 = Item(title: 'Item2', des: 'It is item2');

    itemProvider.addItem(item1);
    itemProvider.addItem(item2);

    expect(itemProvider.item.length, 2);
    expect(itemProvider.item.contains(item1), true);
    expect(itemProvider.item.contains(item2), true);
  });
}
