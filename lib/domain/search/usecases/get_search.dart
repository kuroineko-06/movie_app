import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/search/repositories/search.dart';
import 'package:movie_app/service_locator.dart';

class GetSearchUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return sl<SearchRepository>().getSearch(params!);
  }
}
