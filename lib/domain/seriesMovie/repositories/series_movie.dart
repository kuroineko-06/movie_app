import 'package:dartz/dartz.dart';

abstract class SeriesMovieRepository {
  Future<Either> getSeriesMovie(int pages);
}
