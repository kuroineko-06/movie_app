import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/presentation/home/bloc/trending_cubit.dart';
import 'package:movie_app/presentation/home/bloc/trending_state.dart';
import 'package:movie_app/presentation/movies/pages/detail_pages.dart';

class TrendingMovies extends StatefulWidget {
  const TrendingMovies({super.key});

  @override
  State<TrendingMovies> createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  bool _isExpanded = false;

  void _handleTap(String imageUrl) {
    if (_isExpanded) {
      AppNavigator.push(context, DetailPages(slug: imageUrl));
    } else {
      // Expand the image
      setState(() {
        _isExpanded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingCubit()..getTrendingMovies(2),
      child: BlocBuilder<TrendingCubit, TrendingState>(
        builder: (context, state) {
          if (state is TrendingMovieLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TrendingMovieLoaded) {
            return FanCarouselImageSlider.sliderType1(
                imagesLink: state.movies.content.items
                    .map((item) => item.posterUrl)
                    .toList(),
                isAssets: false,
                autoPlay: true,
                sliderHeight: 300,
                imageFitMode: BoxFit.cover,
                showIndicator: true,
                expandImageHeight: 380,
                expandImageWidth: 300,
                expandedImageFitMode: BoxFit.fill,
                expandedCloseChild: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  width: 70,
                  height: 45,
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 18,
                  ),
                ));
          }
          if (state is FailureLoadedTrendingMovies) {
            return Center(child: Text(state.errorMessage));
          }
          return Container();
        },
      ),
    );
  }
}
