import 'package:movie_app/domain/singleMovie/entities/single_movie.dart';

abstract class SingleMovieState {}

class SingleMoviesLoading extends SingleMovieState {}

class SingleMovieLoaded extends SingleMovieState {
  final SingleMovieEntity movies;

  SingleMovieLoaded({required this.movies});
}

class FailureLoadedSingleMovies extends SingleMovieState {
  final String errorMessage;

  FailureLoadedSingleMovies({required this.errorMessage});
}
