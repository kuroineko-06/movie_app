import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/common/widgets/movies/single_movies_card.dart';
import 'package:movie_app/presentation/home/bloc/single_movie_cubit.dart';
import 'package:movie_app/presentation/home/bloc/single_movie_state.dart';
import 'package:number_pagination/number_pagination.dart';

class ListSingleMoviePage extends StatefulWidget {
  const ListSingleMoviePage({super.key});

  @override
  State<ListSingleMoviePage> createState() => _ListMoviePageState();
}

class _ListMoviePageState extends State<ListSingleMoviePage> {
  int selectedPageNumber = 1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleMovieCubit, SingleMovieState>(
      builder: (context, state) {
        if (state is SingleMoviesLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is SingleMovieLoaded) {
          selectedPageNumber =
              state.movies.content.paramsEntity.paginationEntity.currentPage;
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
                const SizedBox(height: 15),
              ],
            ),
          );
        }
        if (state is FailureLoadedSingleMovies) {
          return Center(child: Text(state.errorMessage));
        }
        return Container();
      },
    );
  }

  Widget _paginationPage(SingleMovieLoaded state) {
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
          context.read<SingleMovieCubit>().getSingleMovie(selectedPageNumber);
        });
      },
      visiblePagesCount: 6,
      totalPages: state.movies.content.paramsEntity.paginationEntity.totalPages,
      currentPage: selectedPageNumber,
    );
  }

  Widget _listMovie(SingleMovieLoaded state) {
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
            child: SingleMoviesCard(
              itemsEntity: state.movies.content.items[index],
            ),
          );
        },
      ),
    );
  }
}
