import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/movies/series_movie_card.dart';
import 'package:movie_app/presentation/home/bloc/series_movie_cubit.dart';
import 'package:movie_app/presentation/home/bloc/series_movie_state.dart';

class SeriesMovie extends StatelessWidget {
  const SeriesMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SeriesMovieCubit()..getSeriesMovie(1),
      child: BlocBuilder<SeriesMovieCubit, SeriesMovieState>(
        builder: (context, state) {
          if (state is SeriesMoviesLoading) {
            // return const Center(child: CircularProgressIndicator());
          }
          if (state is SeriesMovieLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.movies.content.items.length,
                itemBuilder: (context, index) {
                  final movies = state.movies.content.items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: SeriesMovieCard(
                      itemsEntities: movies,
                    ),
                  );
                },
              ),
            );
          }
          if (state is FailureLoadedSeriesMovies) {
            return Center(child: Text(state.errorMessage));
          }
          return Container();
        },
      ),
    );
  }
}
