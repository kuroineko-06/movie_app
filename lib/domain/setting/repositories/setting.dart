import 'package:dartz/dartz.dart';

abstract class SettingRepository {
  Future<Either> editUser(Map<String, dynamic> data);
  Future<Either> getUser(String id);
}
