import 'package:movie_app/domain/search/entities/search.dart';

abstract class SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final SearchEntity search;

  SearchLoaded({required this.search});
}

class FailureLoadedSearchs extends SearchState {
  final String errorMessage;

  FailureLoadedSearchs({required this.errorMessage});
}
