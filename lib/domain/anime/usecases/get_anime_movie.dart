import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/anime/repositories/anime.dart';
import 'package:movie_app/service_locator.dart';

class GetAnimeMovieUseCase extends UseCase<Either, int> {
  @override
  Future<Either> call({int? params}) {
    return sl<AnimeRepository>().getAnimeMovie(params!);
  }
}
