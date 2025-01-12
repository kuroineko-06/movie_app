import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either> getSearch(String query);
}
