import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import '../core/services/storage_service.dart';
import '../model/storage_model/storage_item.dart';

class StorageServiceImpl implements StorageService {
  final _secureStorage = const FlutterSecureStorage();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  @override
  Future<bool> containsKeyInSecureData({required String key}) async {
    debugPrint('Checking data for the key $key');
    final bool containsKey = await _secureStorage.containsKey(
        key: key, aOptions: _getAndroidOptions());
    return containsKey;
  }

  @override
  Future<void> deleteAllSecureData() async {
    debugPrint('Deleting all secured data');
    await _secureStorage.deleteAll(aOptions: _getAndroidOptions());
  }

  @override
  Future<void> deleteSecureData({required StorageItem item}) async {
    debugPrint('Deleting data having key ${item.key}');
    await _secureStorage.delete(key: item.key, aOptions: _getAndroidOptions());
  }

  @override
  Future<BuiltList<StorageItem>> readAllSecureData() async {
    debugPrint('Reading all secured data');
    final Map<String, String> allData =
        await _secureStorage.readAll(aOptions: _getAndroidOptions());
    final BuiltList<StorageItem> list = allData.entries
        .map((MapEntry<String, String> e) => StorageItem((StorageItemBuilder b) => b
          ..value = e.value
          ..key = e.key))
        .toBuiltList();
    return list;
  }

  @override
  Future<String?> readSecureData({required String key}) async {
    debugPrint('Reading data having key $key');
    final String readData =
        await _secureStorage.read(key: key, aOptions: _getAndroidOptions());
    return readData;
  }

  @override
  Future<void> writeSecureData({required StorageItem newItem}) async {
    debugPrint('Writing new data having key ${newItem.key}');
    await _secureStorage.write(
        key: newItem.key, value: newItem.value, aOptions: _getAndroidOptions());
  }
}
