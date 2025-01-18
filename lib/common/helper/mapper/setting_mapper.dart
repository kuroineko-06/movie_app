import 'package:movie_app/data/setting/models/setting_model.dart';
import 'package:movie_app/domain/setting/entities/setting.dart';

class SettingMapper {
  static SettingEntities toEntity(SettingModel model) {
    return SettingEntities(
        success: model.success,
        data: DataEntities(
            id: model.data.id,
            email: model.data.email,
            password: model.data.password,
            image: model.data.image,
            searchHistory: model.data.searchHistory,
            v: model.data.v));
  }
}
