import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageKeys {
  static const String firstName = "blott_fname";
  static const String lastName = "blott_lname";
}

final class SecureStorage {
  static final SecureStorage _sharedInstance = SecureStorage();
  static SecureStorage shared() {
    return _sharedInstance;
  }

  final storage = const FlutterSecureStorage();

  Future<String> getValue(String key) async {
    String? value = await storage.read(key: key);
    return value ?? "";
  }

  void writeKey(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  void deleteKey(dynamic key) async => await storage.delete(key: key);
  void emptyDB() async => await storage.deleteAll();
}
