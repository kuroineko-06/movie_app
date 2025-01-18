import 'package:movie_app/domain/setting/entities/setting.dart';

abstract class SettingState {}

class SettingLoading extends SettingState {}

class SettingLoaded extends SettingState {
  final SettingEntities setting;

  SettingLoaded({required this.setting});
}

class SettingError extends SettingState {
  final String message;

  SettingError({required this.message});
}
