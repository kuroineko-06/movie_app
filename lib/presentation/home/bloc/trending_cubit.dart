import 'package:movie_app/domain/movie/usecases/get_trending_movie.dart';
import 'package:movie_app/presentation/home/bloc/trending_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMovieLoading());

  void getTrendingMovies(int page) async {
    var returnedData = await sl<GetTrendingMovieUseCase>().call(params: page);
    returnedData.fold((error) {
      emit(FailureLoadedTrendingMovies(errorMessage: error));
    }, (data) {
      emit(TrendingMovieLoaded(movies: data));
    });
  }
}
