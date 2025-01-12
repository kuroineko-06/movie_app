import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/service_locator.dart';

abstract class TvService {
  Future<Either> getPopularTv(int page);
}

class TvApiServiceImpl extends TvService {
  @override
  Future<Either> getPopularTv(int page) async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.popularTv + '$page');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
