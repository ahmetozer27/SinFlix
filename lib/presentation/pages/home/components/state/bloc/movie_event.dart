import '../../../../../../data/models/movie_model.dart';

abstract class MovieEvent {}

class UpdateMovies extends MovieEvent {
  final List<MovieModel> newMovies;
  UpdateMovies(this.newMovies);
}

