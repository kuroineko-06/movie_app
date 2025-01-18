import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/common/widgets/movies/anime_movie_card.dart';
import 'package:movie_app/presentation/home/bloc/anime_movie_cubit.dart';
import 'package:movie_app/presentation/home/bloc/anime_movie_state.dart';
import 'package:number_pagination/number_pagination.dart';

class ListAnimeMoviePage extends StatefulWidget {
  const ListAnimeMoviePage({super.key});

  @override
  State<ListAnimeMoviePage> createState() => _ListAnimeMoviePageState();
}

class _ListAnimeMoviePageState extends State<ListAnimeMoviePage> {
  int selectedPageNumber = 1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeMovieCubit, AnimeMovieState>(
      builder: (context, state) {
        if (state is AnimeMoviesLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is AnimeMovieLoaded) {
          selectedPageNumber =
              state.anime.content.params.paginationEntity.currentPage;
          return Scaffold(
            appBar: BasicAppbar(
              hideBack: false,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(state.anime.content.seoOnPage.titleHead),
              ),
            ),
            body: Column(
              children: [
                _listMovie(state),
                const SizedBox(height: 20),
                _paginationPage(state),
                const SizedBox(height: 20),
              ],
            ),
          );
        }
        if (state is FailureLoadedAnimeMovies) {
          return Center(child: Text(state.errorMessage));
        }
        return Container();
      },
    );
  }

  Widget _paginationPage(AnimeMovieLoaded state) {
    return NumberPagination(
      controlButtonSize: Size(35, 35),
      numberButtonSize: Size(35, 35),
      navigationButtonSpacing: 0,
      sectionSpacing: 1,
      buttonRadius: 10,
      betweenNumberButtonSpacing: 0,
      selectedButtonColor: Colors.red,
      unSelectedButtonColor: Colors.amber,
      onPageChanged: (int pageNumber) {
        setState(() {
          selectedPageNumber = pageNumber;
          print('Pages: $selectedPageNumber');
          // Fetch new data for the selected page
          context.read<AnimeMovieCubit>().getAnimeMovie(selectedPageNumber);
        });
      },
      visiblePagesCount: 6,
      totalPages: state.anime.content.params.paginationEntity.totalPages,
      currentPage: selectedPageNumber,
    );
  }

  Widget _listMovie(AnimeMovieLoaded state) {
    return Flexible(
      child: GridView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          crossAxisSpacing: 0, // Space between columns
          mainAxisSpacing: 8, // Space between rows
        ),
        itemCount: state.anime.content.items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: AnimeMovieCard(
              itemsEntities: state.anime.content.items[index],
            ),
          );
        },
      ),
    );
  }
}
