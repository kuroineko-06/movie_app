import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movie_app/core/configs/assets/app_images.dart';
import 'package:movie_app/presentation/home/bloc/trending_cubit.dart';
import 'package:movie_app/presentation/home/bloc/trending_state.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

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
                autoPlay: false,
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
