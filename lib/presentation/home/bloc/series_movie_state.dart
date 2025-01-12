import 'package:movie_app/domain/seriesMovie/entities/series_movie.dart';

abstract class SeriesMovieState {}

class SeriesMoviesLoading extends SeriesMovieState {}

class SeriesMovieLoaded extends SeriesMovieState {
  final SeriesMovieEntity movies;

  SeriesMovieLoaded({required this.movies});
}

class FailureLoadedSeriesMovies extends SeriesMovieState {
  final String errorMessage;

  FailureLoadedSeriesMovies({required this.errorMessage});
}
