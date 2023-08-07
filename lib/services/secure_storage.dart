import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:secure_storage_demo/data/model/model.dart';

class SecureStorage {
  // Create storage
  final storage = const FlutterSecureStorage();
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  Future set(String key, String value) async {
    await storage.write(key: key, value: value, aOptions: _getAndroidOptions());
  }

  Future<String?> get(String title) async {
    return await storage.read(key: title, aOptions: _getAndroidOptions());
  }

  Future<List<Item>> readAllData() async {
    var allData = await storage.readAll(aOptions: _getAndroidOptions());
    List<Item> list =
        allData.entries.map((e) => Item(title: e.key, des: e.value)).toList();
    return list;
  }

  Future<void> deleteSecureData(Item item) async {
    await storage.delete(key: item.title, aOptions: _getAndroidOptions());
  }
}
