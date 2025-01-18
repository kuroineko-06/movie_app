import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/helper/mapper/setting_mapper.dart';
import 'package:movie_app/data/setting/models/setting_model.dart';
import 'package:movie_app/domain/setting/usecase/setting_edit_user.dart';
import 'package:movie_app/domain/setting/usecase/setting_get_user.dart';
import 'package:movie_app/presentation/setting/bloc/setting_state.dart';
import 'package:movie_app/service_locator.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingLoading());

  void getUserData(String id) async {
    var returnedData = await sl<SettingGetUserUseCase>().call(params: id);
    returnedData.fold(
      (error) => emit(SettingError(message: error)),
      (data) {
        // Ensure data is in correct format before emitting the state
        emit(SettingLoaded(
          setting: SettingMapper.toEntity(SettingModel.fromJson(data)),
        ));
      },
    );
  }

  void editUserData({
    required String id,
    required String email,
    required String password,
    required String image,
  }) async {
    final params = {
      "id": id,
      "email": email,
      "password": password,
      "image": image,
    };

    // Ensure correct handling of the returned data
    var returnedData = await sl<SettingEditUserUseCase>().call(params: params);
    returnedData.fold(
      (error) => emit(SettingError(message: error)),
      (data) {
        // Correctly parse and convert response to the entity
        emit(SettingLoaded(
          setting: data,
        ));
      },
    );
  }
}
