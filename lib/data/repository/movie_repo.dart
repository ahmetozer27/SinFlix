import 'package:dating_app/data/models/movie_model.dart';
import 'package:dating_app/data/service/movie_service.dart';
import 'package:dating_app/presentation/pages/profile/state/bloc/favorite_movie_bloc.dart';
import '../../presentation/pages/home/components/state/bloc/movie_bloc.dart';
import '../../presentation/pages/home/components/state/bloc/movie_event.dart';
import '../../presentation/pages/profile/state/bloc/favorite_movie_event.dart';
import '../../utils/logger_utils.dart';
import '../service/secure_storage_service.dart';

class MovieRepo {

  static Future<void> fetchFavoriteMovie(
      FavoriteMovieBloc favoriteMovieBloc) async {
    var token = await SecureStorageService.getToken();
    if (token == null || token.isEmpty) {
      return;
    }
    try {
      var data = await MovieService.getFavorites(token: token);
      final dynamic moviesJson = data['data'];
      if (moviesJson != null) {
        List<MovieModel> movies = moviesJson
            .map<MovieModel>((json) => MovieModel.fromJson(json))
            .toList();
        favoriteMovieBloc.add(UpdateFavoriteMovies(movies));
        LoggerUtils.logger.i('Favori Film Listesi Alındı!');
      }
    } catch (e) {
      LoggerUtils.logger.e('Favori Film Listesi Alınamadı! Hata: $e');
    }
  }

  static Future<void> fetchMovieList(
      {required int page, required MovieBloc movieBloc}) async {
    var token = await SecureStorageService.getToken();
    if (token == null || token.isEmpty) {
      return;
    }
    try {
      var data = await MovieService.getMovieList(token: token, page: page);
      final dynamic moviesJson = data['data']['movies'];
      if (moviesJson!= null) {
        List<MovieModel> movies = moviesJson
            .map<MovieModel>((json) => MovieModel.fromJson(json))
            .toList();
        movieBloc.add(UpdateMovies(movies));
        LoggerUtils.logger.i('Film Listesi Alındı!');
      }
    } catch (e) {
      LoggerUtils.logger.e('Film Listesi Alınamadı! Hata: $e');
    }
  }

  static Future<bool> addFavorite(String favoriteId) async {
    var token = await SecureStorageService.getToken();
    if (token == null || token.isEmpty) {
      return false;
    }
    try {
      var success =
          await MovieService.addFavorite(token: token, favoriteId: favoriteId);
      LoggerUtils.logger.i('Film Favorilere Eklendi! FilmID: $favoriteId');
      return success;
    } catch (e) {
      LoggerUtils.logger.e('Film Favorilere Eklenemedi! Hata: $e');
      return false;
    }
  }

  static Future<bool> removeFavorite(String favoriteId) async {
    var token = await SecureStorageService.getToken();
    if (token == null || token.isEmpty) {
      return false;
    }
    try {
      var success =
      await MovieService.addFavorite(token: token, favoriteId: favoriteId);
      LoggerUtils.logger.i('Film Favorilerden Çıkarıldı! FilmID: $favoriteId');
      return success;
    } catch (e) {
      LoggerUtils.logger.e('Film Favorilerden Çıkarılamadı! Hata: $e');
      return false;
    }
  }



}
