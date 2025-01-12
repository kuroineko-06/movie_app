import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/movie_details_mapper.dart';
import 'package:movie_app/common/helper/mapper/movie_mapper.dart';
import 'package:movie_app/data/movie/models/movie_details.dart';
import 'package:movie_app/data/movie/models/movie.dart';
import 'package:movie_app/data/movie/sources/movie.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/service_locator.dart';

class MovieRepositoryImpl extends MovieRespository {
  @override
  Future<Either> getTrendingMovie(int pages) async {
    var returnedData = await sl<MovieService>().getTrendingMovies(pages);

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = MovieMapper.toEntity(MovieTrendingModel.fromJson(data));
      return Right(movies);
    });
  }

  @override
  Future<Either> getMovieDetail(String slug) async {
    var returnedData = await sl<MovieService>().getMovieDetail(slug);

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      // log("dataaaaaaaaaa: ${data}");
      var movies = MovieDetailMapper.toEntity(
          MovieDetailModel.fromJson(data['content']));
      return Right(movies);
    });
  }
}
