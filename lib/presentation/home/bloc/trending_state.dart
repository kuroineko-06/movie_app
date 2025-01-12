import 'package:movie_app/domain/movie/entities/movie.dart';

abstract class TrendingState {}

class TrendingMovieLoading extends TrendingState {}

class TrendingMovieLoaded extends TrendingState {
  final MovieTrendingEntity movies;

  TrendingMovieLoaded({required this.movies});
}

class FailureLoadedTrendingMovies extends TrendingState {
  final String errorMessage;

  FailureLoadedTrendingMovies({required this.errorMessage});
}
