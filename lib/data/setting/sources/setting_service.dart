import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/service_locator.dart';

abstract class SettingService {
  Future<Either> getUser(String id);
  Future<Either> editUser(Map<String, dynamic> data);
}

class SettingApiServiceImpl extends SettingService {
  @override
  Future<Either> editUser(Map<String, dynamic> data) async {
    try {
      var response = await sl<DioClient>().put(
        ApiUrl.editUser + data['id'], // Append the user ID to the URL
        data: {
          "email": data["email"],
          "password": data["password"],
          "image": data["image"],
        },
      );
      print("Data of edit user: ${response.data}");
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getUser(String id) async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.getUser + '$id');
      print("Data of get user: ${response.data}");
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
