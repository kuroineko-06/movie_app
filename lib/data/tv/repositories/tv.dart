import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/tv_shows_mapper.dart';
import 'package:movie_app/data/tv/models/tv.dart';
import 'package:movie_app/data/tv/sources/tv.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/service_locator.dart';

class TvRepositoryImpl extends TvRepository {
  @override
  Future<Either> getPopularTv(int pages) async {
    var returnedData = await sl<TvService>().getPopularTv(pages);

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      if (data['content'] != null) {
        try {
          var movies =
              TvShowsMapper.toEntity(TvShowsModel.fromJson(data['content']));
          return Right(movies);
        } catch (e) {
          log("Error parsing movie data: $e");
          return Left(e);
        }
      } else {
        log("Content is null or does not exist.");
        return Left("Content is null or does not exist.");
      }
    });
  }
}
