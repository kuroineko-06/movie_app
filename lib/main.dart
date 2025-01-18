import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/configs/theme/app_theme.dart';
import 'package:movie_app/presentation/home/bloc/anime_movie_cubit.dart';
import 'package:movie_app/presentation/home/bloc/popular_tv_cubit.dart';
import 'package:movie_app/presentation/home/bloc/series_movie_cubit.dart';
import 'package:movie_app/presentation/home/bloc/single_movie_cubit.dart';
import 'package:movie_app/presentation/home/bloc/trending_cubit.dart';
import 'package:movie_app/presentation/home/pages/list_details/list_single_movie_page.dart';
import 'package:movie_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_app/presentation/search/pages/search_page.dart';
import 'package:movie_app/presentation/setting/bloc/setting_cubit.dart';
import 'package:movie_app/presentation/setting/pages/setting_page.dart';
import 'package:movie_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:movie_app/presentation/splash/pages/splash.dart';
import 'package:movie_app/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashCubit()..appStarted(),
        ),
        BlocProvider(
          create: (context) => SingleMovieCubit()
            ..getSingleMovie(1), // Initialize the cubit here
          child:
              const ListSingleMoviePage(), // Ensure ListMoviePage is a child of BlocProvider
        ),
        BlocProvider(
          create: (context) => SeriesMovieCubit()
            ..getSeriesMovie(1), // Initialize the cubit here
          child:
              const ListSingleMoviePage(), // Ensure ListMoviePage is a child of BlocProvider
        ),
        BlocProvider(
          create: (context) =>
              AnimeMovieCubit()..getAnimeMovie(1), // Initialize the cubit here
          child:
              const ListSingleMoviePage(), // Ensure ListMoviePage is a child of BlocProvider
        ),
        BlocProvider(
          create: (context) =>
              SettingCubit()..getUserData(''), // Initialize the cubit here
          child:
              const SettingPage(), // Ensure ListMoviePage is a child of BlocProvider
        ),
        BlocProvider(
          create: (context) => SettingCubit(), // Initialize the cubit here
          child: Container(), // Ensure ListMoviePage is a child of BlocProvider
        ),
        BlocProvider(
          create: (context) => TrendingCubit()
            ..getTrendingMovies(1), // Initialize the cubit here
          child:
              const ListSingleMoviePage(), // Ensure ListMoviePage is a child of BlocProvider
        ),
        BlocProvider(
          create: (context) =>
              PopularTVCubit()..getPopularTV(1), // Initialize the cubit here
          child:
              const ListSingleMoviePage(), // Ensure ListMoviePage is a child of BlocProvider
        ),
        BlocProvider(
          create: (context) =>
              SearchCubit()..getSearch(''), // Initialize the cubit here
          child:
              const SearchPage(), // Ensure ListMoviePage is a child of BlocProvider
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme,
          home: const SplashPage()),
    );
  }
}
