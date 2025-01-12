import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/singleMovie/usecases/get_single_movie.dart';
import 'package:movie_app/presentation/home/bloc/single_movie_state.dart';
import 'package:movie_app/service_locator.dart';

class SingleMovieCubit extends Cubit<SingleMovieState> {
  SingleMovieCubit() : super(SingleMoviesLoading());

  void getSingleMovie(int pages) async {
    var returnedData = await sl<GetSingleMovieUseCase>().call(params: pages);
    returnedData.fold((error) {
      emit(FailureLoadedSingleMovies(errorMessage: error));
    }, (data) {
      emit(SingleMovieLoaded(movies: data));
    });
  }
}
