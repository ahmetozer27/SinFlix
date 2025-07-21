import 'package:dating_app/data/service/auth_service.dart';
import 'package:dating_app/data/service/secure_storage_service.dart';
import '../../utils/logger_utils.dart';

class AuthRepo {

  static Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    try {
      var data = await AuthService.signIn(email: email, password: password);
      if (data == null) {
        return false;
      }
      var token = data['data']['token'];
      return await SecureStorageService.saveToken(token);

    } catch (e) {
      LoggerUtils.logger.e('Sign in failed: $e');
      return false;
    }
  }

  static Future<bool> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      bool success = await AuthService.signUp(
          email: email, password: password, name: name);
      return success;
    } catch (e) {
      LoggerUtils.logger.e('Sign Up failed: $e');
      return false;
    }
  }

  static Future<bool> signOut() async {
    var success = await SecureStorageService.deleteToken();
    if(success){
      LoggerUtils.logger.i('Başarıyla Çıkış Yapıldı!');
    }
    else{
      LoggerUtils.logger.e('Çıkış Yapılamadı!');
    }
    return success;
  }
}
