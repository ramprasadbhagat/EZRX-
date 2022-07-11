import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/local_storage/i_secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage implements ISecureStorage {
  final secureStorage = const FlutterSecureStorage();

  @override
  Future<String> read({required String key}) async {
    try {
      return await secureStorage.read(key: key) ?? '';
    } catch (e) {
      throw LocalException(message: e.toString());
    }
  }

  @override
  Future<void> write({required String key, required String value}) async {
    try {
      await secureStorage.write(key: key, value: value);
    } catch (e) {
      throw LocalException(message: e.toString());
    }
  }

  @override
  Future<void> delete({required String key}) async {
    try {
      await secureStorage.delete(key: key);
    } catch (e) {
      throw LocalException(message: e.toString());
    }
  }

  @override
  Future<void> clear() async {
    try {
      await secureStorage.deleteAll();
    } catch (e) {
      throw LocalException(message: e.toString());
    }
  }
}
