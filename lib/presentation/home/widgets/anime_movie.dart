import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/movies/Anime_movie_card.dart';
import 'package:movie_app/presentation/home/bloc/anime_movie_cubit.dart';
import 'package:movie_app/presentation/home/bloc/anime_movie_state.dart';

class AnimeMovie extends StatelessWidget {
  const AnimeMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimeMovieCubit()..getAnimeMovie(1),
      child: BlocBuilder<AnimeMovieCubit, AnimeMovieState>(
        builder: (context, state) {
          if (state is AnimeMoviesLoading) {
            // return const Center(child: CircularProgressIndicator());
          }
          if (state is AnimeMovieLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.anime.content.items.length,
                itemBuilder: (context, index) {
                  final movies = state.anime.content.items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: AnimeMovieCard(
                      itemsEntities: movies,
                    ),
                  );
                },
              ),
            );
          }
          if (state is FailureLoadedAnimeMovies) {
            return Center(child: Text(state.errorMessage));
          }
          return Container();
        },
      ),
    );
  }
}
