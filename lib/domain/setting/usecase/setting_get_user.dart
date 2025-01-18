import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/setting/repositories/setting.dart';
import 'package:movie_app/service_locator.dart';

class SettingGetUserUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<SettingRepository>().getUser(params!);
  }
}
