import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/anime/usecases/get_anime_movie.dart';
import 'package:movie_app/presentation/home/bloc/anime_movie_state.dart';
import 'package:movie_app/service_locator.dart';

class AnimeMovieCubit extends Cubit<AnimeMovieState> {
  AnimeMovieCubit() : super(AnimeMoviesLoading());

  void getAnimeMovie(int pages) async {
    var returnedData = await sl<GetAnimeMovieUseCase>().call(params: pages);
    returnedData.fold((error) {
      emit(FailureLoadedAnimeMovies(errorMessage: error));
    }, (data) {
      emit(AnimeMovieLoaded(anime: data));
    });
  }
}
