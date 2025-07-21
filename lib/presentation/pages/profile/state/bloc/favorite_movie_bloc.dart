import 'package:flutter_bloc/flutter_bloc.dart';
import 'favorite_movie_state.dart';
import 'favorite_movie_event.dart';

class FavoriteMovieBloc extends Bloc<FavoriteMovieEvent, FavoriteMovieState> {
  FavoriteMovieBloc() : super(FavoriteMovieInitial()) {
    on<UpdateFavoriteMovies>((event, emit) {
      emit(FavoriteMovieLoaded(event.movies));
    });
  }
}
