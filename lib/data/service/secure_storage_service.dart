import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

class SecureStorageService {
  static final _storage = FlutterSecureStorage();
  static var logger = Logger();

  /// Token kaydetme
  static Future<bool> saveToken(String token) async {
    try {
      await _storage.write(key: 'auth_token', value: token);
      logger.i("Token başarıyla kaydedildi!");
      return true;
    } catch (e) {
      logger.e("Token kaydedilemedi: $e");
      return false;
    }
  }

  /// Token okuma
  static Future<String?> getToken() async {
    try {
      return await _storage.read(key: 'auth_token');
    } catch (e) {
      logger.e("Token verisi çekilirken hata: $e");
      return null;
    }
  }

  /// Token silme
  static Future<bool> deleteToken() async {
    try {
      await _storage.delete(key: 'auth_token');
      logger.i("Token başarıyla silindi.");
      return true;
    } catch (e) {
      logger.e("Token silinirken hata oluştu: $e");
      return false;
    }
  }
}
