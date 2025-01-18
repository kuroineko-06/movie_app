import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/anime/repositories/anime.dart';
import 'package:movie_app/data/anime/sources/anime.dart';
import 'package:movie_app/data/auth/repositories/auth.dart';
import 'package:movie_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_app/data/movie/repositories/movie.dart';
import 'package:movie_app/data/movie/sources/movie.dart';
import 'package:movie_app/data/search/repositories/search.dart';
import 'package:movie_app/data/search/sources/search.dart';
import 'package:movie_app/data/seriesMovie/repositories/series_movie.dart';
import 'package:movie_app/data/seriesMovie/sources/series_movie.dart';
import 'package:movie_app/data/setting/repositories/setting.dart';
import 'package:movie_app/data/setting/sources/setting_service.dart';
import 'package:movie_app/data/singleMovie/repositories/single_movie.dart';
import 'package:movie_app/data/singleMovie/sources/single_movie.dart';
import 'package:movie_app/data/tv/repositories/tv.dart';
import 'package:movie_app/data/tv/sources/tv.dart';
import 'package:movie_app/domain/anime/repositories/anime.dart';
import 'package:movie_app/domain/anime/usecases/get_anime_movie.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/domain/auth/usecase/is_logged_in.dart';
import 'package:movie_app/domain/auth/usecase/signin.dart';
import 'package:movie_app/domain/auth/usecase/signup.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/domain/movie/usecases/get_trending_movie.dart';
import 'package:movie_app/domain/movie/usecases/get_movie_detail.dart';
import 'package:movie_app/domain/search/repositories/search.dart';
import 'package:movie_app/domain/search/usecases/get_search.dart';
import 'package:movie_app/domain/seriesMovie/repositories/series_movie.dart';
import 'package:movie_app/domain/seriesMovie/usecases/get_series_movie.dart';
import 'package:movie_app/domain/setting/repositories/setting.dart';
import 'package:movie_app/domain/setting/usecase/setting_edit_user.dart';
import 'package:movie_app/domain/setting/usecase/setting_get_user.dart';
import 'package:movie_app/domain/singleMovie/repositories/single_movie.dart';
import 'package:movie_app/domain/singleMovie/usecases/get_single_movie.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/domain/tv/usecases/get_popular_tv.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  //services
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieApiServicerImpl());
  sl.registerSingleton<TvService>(TvApiServiceImpl());
  sl.registerSingleton<SingleMovieService>(SingleMovieApiServiceImpl());
  sl.registerSingleton<SeriesMovieService>(SeriesMovieApiServiceImpl());
  sl.registerSingleton<AnimeService>(AnimeApiServiceImpl());
  sl.registerSingleton<SearchService>(SearchApiServiceImpl());
  sl.registerSingleton<SettingService>(SettingApiServiceImpl());

  //respositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRespository>(MovieRepositoryImpl());
  sl.registerSingleton<TvRepository>(TvRepositoryImpl());
  sl.registerSingleton<SingleMovieRepository>(SingleMovieRepositoryImpl());
  sl.registerSingleton<SeriesMovieRepository>(SeriesMovieRepositoryImpl());
  sl.registerSingleton<AnimeRepository>(AnimeRepositoryImpl());
  sl.registerSingleton<SearchRepository>(SearchRepositoryImpl());
  sl.registerSingleton<SettingRepository>(SettingRepositoryImpl());

  //usecase
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrendingMovieUseCase>(GetTrendingMovieUseCase());
  sl.registerSingleton<GetMovieDetailUseCase>(GetMovieDetailUseCase());
  sl.registerSingleton<GetPopularTvUseCase>(GetPopularTvUseCase());
  sl.registerSingleton<GetSingleMovieUseCase>(GetSingleMovieUseCase());
  sl.registerSingleton<GetSeriesMovieUseCase>(GetSeriesMovieUseCase());
  sl.registerSingleton<GetAnimeMovieUseCase>(GetAnimeMovieUseCase());
  sl.registerSingleton<GetSearchUseCase>(GetSearchUseCase());
  sl.registerSingleton<SettingEditUserUseCase>(SettingEditUserUseCase());
  sl.registerSingleton<SettingGetUserUseCase>(SettingGetUserUseCase());
}
