import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/series_movie_mapper.dart';
import 'package:movie_app/data/seriesMovie/models/series_movie.dart';
import 'package:movie_app/data/seriesMovie/sources/series_movie.dart';
import 'package:movie_app/domain/seriesMovie/repositories/series_movie.dart';
import 'package:movie_app/service_locator.dart';

class SeriesMovieRepositoryImpl extends SeriesMovieRepository {
  @override
  Future<Either> getSeriesMovie(int page) async {
    var returnedData = await sl<SeriesMovieService>().getSeriesMovie(page);

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = SeriesMovieMapper.toEntity(SeriesMovieModel.fromJson(data));

      return Right(movies);
    });
  }
}
