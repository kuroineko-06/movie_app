import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/anime_movie_mapper.dart';
import 'package:movie_app/data/anime/models/anime.dart';
import 'package:movie_app/data/anime/sources/anime.dart';
import 'package:movie_app/domain/anime/repositories/anime.dart';
import 'package:movie_app/service_locator.dart';

class AnimeRepositoryImpl extends AnimeRepository {
  @override
  Future<Either> getAnimeMovie(int page) async {
    var returnedData = await sl<AnimeService>().getAnimeMovie(page);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var anime = AnimeMovieMapper.toEntity(AnimeMovieModel.fromJson(data));
      return Right(anime);
    });
  }
}
