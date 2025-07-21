import '../../../../../../data/models/movie_model.dart';

class MovieState {
  final List<MovieModel> movies;

  MovieState({required this.movies});

  factory MovieState.initial() => MovieState(movies: []);

  MovieState copyWith({List<MovieModel>? movies}) {
    return MovieState(
      movies: movies ?? this.movies,
    );
  }
}
