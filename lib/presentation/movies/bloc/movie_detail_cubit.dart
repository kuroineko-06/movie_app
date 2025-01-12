import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/usecases/get_movie_detail.dart';
import 'package:movie_app/presentation/movies/bloc/movie_detail_state.dart';
import 'package:movie_app/service_locator.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit() : super(MovieDetailLoading());

  void getMovieDetail(String slug) async {
    var returnData = await sl<GetMovieDetailUseCase>().call(params: slug);
    returnData.fold((error) {
      emit(FailuerLoadMovieDetail(errorMessage: error));
    }, (data) {
      emit(MovieDetailLoaded(movies: data));
    });
  }
}
