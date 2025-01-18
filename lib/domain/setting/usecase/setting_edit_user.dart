import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/setting/repositories/setting.dart';
import 'package:movie_app/service_locator.dart';

class SettingEditUserUseCase extends UseCase<Either, Map<String, dynamic>> {
  @override
  Future<Either> call({Map<String, dynamic>? params}) async {
    return await sl<SettingRepository>().editUser(params!);
  }
}
