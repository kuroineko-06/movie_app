import 'package:movie_app/domain/anime/entities/anime.dart';

abstract class AnimeMovieState {}

class AnimeMoviesLoading extends AnimeMovieState {}

class AnimeMovieLoaded extends AnimeMovieState {
  final AnimeMovieEntity anime;

  AnimeMovieLoaded({required this.anime});
}

class FailureLoadedAnimeMovies extends AnimeMovieState {
  final String errorMessage;

  FailureLoadedAnimeMovies({required this.errorMessage});
}
