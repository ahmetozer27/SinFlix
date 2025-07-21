import 'package:flutter_bloc/flutter_bloc.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieState.initial()) {
    on<UpdateMovies>(_updateMovies);
  }
  void _updateMovies(UpdateMovies event, Emitter<MovieState> emit){
    emit(state.copyWith(movies: [...state.movies, ...event.newMovies]));
  }
}
