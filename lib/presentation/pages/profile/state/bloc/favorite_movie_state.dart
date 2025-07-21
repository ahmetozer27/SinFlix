import '../../../../../data/models/movie_model.dart';

abstract class FavoriteMovieState {}

class FavoriteMovieInitial extends FavoriteMovieState {}

class FavoriteMovieLoading extends FavoriteMovieState {}

class FavoriteMovieLoaded extends FavoriteMovieState {
  final List<MovieModel> movies;
  FavoriteMovieLoaded(this.movies);
}

class FavoriteMovieError extends FavoriteMovieState {
  final String message;
  FavoriteMovieError(this.message);
}
