import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MovieService {
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

  /// Filmler listesini token ile getirir
  static Future<dynamic> getMovieList({required String? token,int page = 1}) async {
    try {
      final response = await _dio.get(
        '/movie/list',
        queryParameters: {
          'page': page,
        },
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
      throw Exception('Get movie list failed: ${e.message}');
    }
  }

  /// Favori filmleri token ile getirir
  static Future<dynamic> getFavorites({required String? token}) async {
    try {
      final response = await _dio.get(
        '/movie/favorites',
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
      throw Exception('Get favorites failed: ${e.message}');
    }
  }

  /// Belirtilen favoriteId ile favoriye ekler (POST)
  static Future<bool> addFavorite({
    required String? token,
    required String favoriteId,
  }) async {
    try {
      final response = await _dio.post(
        '/movie/favorite/$favoriteId',
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
      throw Exception('Add favorite failed: ${e.message}');
    }
  }

  /// Belirtilen favoriteId ile favorilerden çıkarır (POST)
  static Future<bool> removeFavorite({
    required String? token,
    required String favoriteId,
  }) async {
    try {
      final response = await _dio.post(
        '/movie/favorite/$favoriteId',
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
      throw Exception('Remove favorite failed: ${e.message}');
    }
  }


}
