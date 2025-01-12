import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/seriesMovie/usecases/get_series_movie.dart';
import 'package:movie_app/presentation/home/bloc/series_movie_state.dart';
import 'package:movie_app/service_locator.dart';

class SeriesMovieCubit extends Cubit<SeriesMovieState> {
  SeriesMovieCubit() : super(SeriesMoviesLoading());

  void getSeriesMovie(int pages) async {
    var returnedData = await sl<GetSeriesMovieUseCase>().call(params: pages);
    returnedData.fold((error) {
      emit(FailureLoadedSeriesMovies(errorMessage: error));
    }, (data) {
      emit(SeriesMovieLoaded(movies: data));
    });
  }
}
