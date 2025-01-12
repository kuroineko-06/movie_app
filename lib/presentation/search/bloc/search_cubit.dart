import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/search/usecases/get_search.dart';
import 'package:movie_app/presentation/search/bloc/search_state.dart';
import 'package:movie_app/service_locator.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchLoading());

  void getSearch(String query) async {
    emit(SearchLoading());
    var returnedData = await sl<GetSearchUseCase>().call(params: query);
    returnedData.fold((error) {
      emit(FailureLoadedSearchs(errorMessage: error));
    }, (data) {
      emit(SearchLoaded(search: data));
    });
  }
}
