import 'package:dartz/dartz.dart';

abstract class AnimeRepository {
  Future<Either> getAnimeMovie(int pages);
}
