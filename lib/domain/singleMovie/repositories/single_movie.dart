import 'package:dartz/dartz.dart';

abstract class SingleMovieRepository {
  Future<Either> getSingleMovie(int pages);
}
