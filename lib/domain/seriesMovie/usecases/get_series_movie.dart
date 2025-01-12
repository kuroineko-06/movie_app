import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/seriesMovie/repositories/series_movie.dart';
import 'package:movie_app/service_locator.dart';

class GetSeriesMovieUseCase extends UseCase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return sl<SeriesMovieRepository>().getSeriesMovie(params!);
  }
}
