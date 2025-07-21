import '../../../../../data/models/movie_model.dart';

abstract class FavoriteMovieEvent {}

class LoadFavoriteMovies extends FavoriteMovieEvent {}

class UpdateFavoriteMovies extends FavoriteMovieEvent {
  final List<MovieModel> movies;
  UpdateFavoriteMovies(this.movies);
}
