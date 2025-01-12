import 'package:dartz/dartz.dart';

abstract class MovieRespository {
  Future<Either> getTrendingMovie(int pages);
  Future<Either> getMovieDetail(String slug);
}
