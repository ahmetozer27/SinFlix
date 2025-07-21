import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProfileService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['API_BASE_URL']!,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  /// Profil bilgisini getirir
  static Future<dynamic> getProfile({
    required String? token,
  }) async {
    try {
      final response = await _dio.get(
        '/user/profile',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        return null;
      }
    } on DioException catch (e) {
      throw Exception('Get profile failed: ${e.message}');
    }
  }


  /// Fotoğraf yükleme fonksiyonu
  static Future<bool> uploadPhoto({
    required String? token,
    required File photoFile,
  }) async {
    try {
      // Multipart file oluştur
      final fileName = photoFile.path.split('/').last;
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          photoFile.path,
          filename: fileName,
          // contentType: MediaType('image', 'jpeg'), // gerekirse import edilebilir
        ),
      });

      final response = await _dio.post(
        '/user/upload_photo',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      throw Exception('Upload photo failed: ${e.message}');
    }
  }
}
