import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/movies/single_movies_card.dart';
import 'package:movie_app/presentation/home/bloc/single_movie_cubit.dart';
import 'package:movie_app/presentation/home/bloc/single_movie_state.dart';

class SingleMovie extends StatelessWidget {
  const SingleMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingleMovieCubit()..getSingleMovie(1),
      child: BlocBuilder<SingleMovieCubit, SingleMovieState>(
        builder: (context, state) {
          if (state is SingleMoviesLoading) {
            // return const Center(child: CircularProgressIndicator());
          }
          if (state is SingleMovieLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.movies.content.items.length,
                itemBuilder: (context, index) {
                  final movie = state.movies.content.items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: SingleMoviesCard(
                      itemsEntity: movie,
                    ),
                  );
                },
              ),
            );
          }
          if (state is FailureLoadedSingleMovies) {
            return Center(child: Text(state.errorMessage));
          }
          return Container();
        },
      ),
    );
  }
}
