import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/common/widgets/movies/Series_movie_card.dart';
import 'package:movie_app/presentation/home/bloc/series_movie_cubit.dart';
import 'package:movie_app/presentation/home/bloc/series_movie_state.dart';
import 'package:number_pagination/number_pagination.dart';

class ListSeriesMoviePage extends StatefulWidget {
  const ListSeriesMoviePage({super.key});

  @override
  State<ListSeriesMoviePage> createState() => _ListSeriesMoviePageState();
}

class _ListSeriesMoviePageState extends State<ListSeriesMoviePage> {
  int selectedPageNumber = 1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesMovieCubit, SeriesMovieState>(
      builder: (context, state) {
        if (state is SeriesMoviesLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is SeriesMovieLoaded) {
          selectedPageNumber =
              state.movies.content.params.paginationEntity.currentPage;
          return Scaffold(
            appBar: BasicAppbar(
              hideBack: false,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(state.movies.content.seoOnPage.titleHead),
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
        if (state is FailureLoadedSeriesMovies) {
          return Center(child: Text(state.errorMessage));
        }
        return Container();
      },
    );
  }

  Widget _paginationPage(SeriesMovieLoaded state) {
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
          context.read<SeriesMovieCubit>().getSeriesMovie(selectedPageNumber);
        });
      },
      visiblePagesCount: 6,
      totalPages: state.movies.content.params.paginationEntity.totalPages,
      currentPage: selectedPageNumber,
    );
  }

  Widget _listMovie(SeriesMovieLoaded state) {
    return Flexible(
      child: GridView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          crossAxisSpacing: 0, // Space between columns
          mainAxisSpacing: 8, // Space between rows
        ),
        itemCount: state.movies.content.items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SeriesMovieCard(
              itemsEntities: state.movies.content.items[index],
            ),
          );
        },
      ),
    );
  }
}
