import 'package:movie_app/domain/movie/entities/movie_details.dart';

abstract class MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetailEntity movies;

  MovieDetailLoaded({required this.movies});
}

class FailuerLoadMovieDetail extends MovieDetailState {
  final String errorMessage;

  FailuerLoadMovieDetail({required this.errorMessage});
}
