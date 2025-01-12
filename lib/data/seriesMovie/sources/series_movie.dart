import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/service_locator.dart';

abstract class SeriesMovieService {
  Future<Either> getSeriesMovie(int page);
}

class SeriesMovieApiServiceImpl extends SeriesMovieService {
  @override
  Future<Either> getSeriesMovie(int page) async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.seriesMovie + '$page');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}