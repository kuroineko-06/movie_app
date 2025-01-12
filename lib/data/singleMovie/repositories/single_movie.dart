import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/single_movie_mapper.dart';
import 'package:movie_app/data/singleMovie/models/single_movie.dart';
import 'package:movie_app/data/singleMovie/sources/single_movie.dart';
import 'package:movie_app/domain/singleMovie/repositories/single_movie.dart';
import 'package:movie_app/service_locator.dart';

class SingleMovieRepositoryImpl extends SingleMovieRepository {
  @override
  Future<Either> getSingleMovie(int page) async {
    var returnedData = await sl<SingleMovieService>().getSingleMovie(page);

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      if (data['content'] != null) {
        try {
          var movies =
              SingleMovieMapper.toEntity(SingleMovieModel.fromJson(data));
          print("Movie Title: ${movies.content.titlePage}");
          return Right(movies);
        } catch (e) {
          log("Error parsing movie data: $e");
          return Left("Error parsing movie data");
        }
      } else {
        log("Content is null or does not exist.");
        return Left("Content is null or does not exist.");
      }
    });
  }
}
