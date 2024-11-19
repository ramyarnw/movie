import 'package:built_collection/built_collection.dart';

abstract class StorageService {
  Future<void> writeSecureData({required StorageItem newItem});

  Future<String?> readSecureData({required String key});

  Future<void> deleteSecureData({required StorageItem item});

  Future<BuiltList<StorageItem>> readAllSecureData();

  Future<void> deleteAllSecureData();

  Future<bool> containsKeyInSecureData({required String key});
}
