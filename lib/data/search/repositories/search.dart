import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/search_mapper.dart';
import 'package:movie_app/data/search/models/search.dart';
import 'package:movie_app/data/search/sources/search.dart';
import 'package:movie_app/domain/search/repositories/search.dart';
import 'package:movie_app/service_locator.dart';

class SearchRepositoryImpl extends SearchRepository {
  @override
  Future<Either> getSearch(String query) async {
    var returnedData = await sl<SearchService>().getSearch(query);

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = SearchMapper.toEntity(SearchModel.fromJson(data));
      return Right(movies);
    });
  }
}
