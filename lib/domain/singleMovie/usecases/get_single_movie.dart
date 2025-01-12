import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/singleMovie/repositories/single_movie.dart';
import 'package:movie_app/service_locator.dart';

class GetSingleMovieUseCase extends UseCase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<SingleMovieRepository>().getSingleMovie(params!);
  }
}
