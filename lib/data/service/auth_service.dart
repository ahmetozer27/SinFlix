import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['API_BASE_URL']!, // ← Buraya kendi API base URL’ini yaz
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  /// Sends a POST request to /auth/signin endpoint.
  static Future<dynamic> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/user/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      // API başarılıysa (200 veya 201), true döndür
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        return null;
      }
    } on DioException catch (e) {
      throw Exception("Sign in failed: ${e.message}");
    }
  }

  /// Sends a POST request to /auth/signup endpoint.
  static Future<bool> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await _dio.post(
        '/user/register',
        data: {
          'email': email,
          'password': password,
          'name': name,
        },
      );

      // API başarılıysa (200 veya 201), true döndür
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      // Hata varsa yakala ve fırlat
      throw Exception("Sign up failed: ${e.message}");
    }
  }
}
