import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/setting_mapper.dart';
import 'package:movie_app/data/setting/models/setting_model.dart';
import 'package:movie_app/data/setting/sources/setting_service.dart';
import 'package:movie_app/domain/setting/repositories/setting.dart';
import 'package:movie_app/service_locator.dart';

class SettingRepositoryImpl extends SettingRepository {
  @override
  Future<Either> editUser(Map<String, dynamic> data) async {
    var response = await sl<SettingService>().editUser(data);
    return response.fold(
      (error) => Left(error),
      (data) {
        var entity = SettingMapper.toEntity(SettingModel.fromJson(data));
        print("response from data/repositories/editUser: $entity");
        return Right(entity);
      },
    );
  }

  @override
  Future<Either> getUser(String id) async {
    var data = await sl<SettingService>().getUser(id);
    return data.fold((error) {
      return Left(error);
    }, (data) async {
      var response = SettingMapper.toEntity(SettingModel.fromJson(data));
      return Right(data);
    });
  }
}
