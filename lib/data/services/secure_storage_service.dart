import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static final _instance = SecureStorageService._internal();
  factory SecureStorageService() => _instance;
  SecureStorageService._internal();

  final _secureStorage = const FlutterSecureStorage();

  Future<String?> read({required String key}) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> write({required String key, required dynamic value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<void> delete({required String key}) async {
    await _secureStorage.delete(key: key);
  }
}
