import 'package:movie_app/domain/tv/entities/tv.dart';

abstract class PopularTVState {}

class PopularTVLoading extends PopularTVState {}

class PopularTVLoaded extends PopularTVState {
  final TvShowsEntity tv;

  PopularTVLoaded({required this.tv});
}

class FailureLoadedPopularTV extends PopularTVState {
  final String errorMessage;

  FailureLoadedPopularTV({required this.errorMessage});
}
