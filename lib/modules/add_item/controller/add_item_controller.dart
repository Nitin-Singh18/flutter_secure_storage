import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/model.dart';
import '../../../riverpod/state.dart';
import '../../../services/secure_storage.dart';

class AddItemController {
  final WidgetRef ref;
  AddItemController({required this.ref});
  late final TextEditingController key;
  late final TextEditingController value;

  final SecureStorage secureStorage = SecureStorage();

  void set() {
    secureStorage.set(key.text, value.text);
    final Item item = Item(title: key.text, des: value.text);
    ref.read(itemProvider).addItem(item);
    print('Added');
  }
}
