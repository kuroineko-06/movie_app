import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/service_locator.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies(int page);
  Future<Either> getMovieDetail(String slug);
}

class MovieApiServicerImpl extends MovieService {
  @override
  Future<Either> getTrendingMovies(int page) async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.trendingMovie + '$page');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getMovieDetail(String slug) async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.getMovieDetail + '$slug');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
