import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/common/widgets/movies/trending_movie_card.dart';
import 'package:movie_app/presentation/home/bloc/trending_cubit.dart';
import 'package:movie_app/presentation/home/bloc/trending_state.dart';
import 'package:number_pagination/number_pagination.dart';

class ListTrendingMoviePage extends StatefulWidget {
  const ListTrendingMoviePage({super.key});

  @override
  State<ListTrendingMoviePage> createState() => _ListTrendingMoviePageState();
}

class _ListTrendingMoviePageState extends State<ListTrendingMoviePage> {
  int selectedPageNumber = 1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingCubit, TrendingState>(
      builder: (context, state) {
        if (state is TrendingMovieLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is TrendingMovieLoaded) {
          selectedPageNumber = state.movies.content.pagination.currentPage;
          return Scaffold(
            appBar: const BasicAppbar(
              hideBack: false,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text('Phim mới | Phim mới cập nhật | Phim mới hay nhất'),
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
        if (state is FailureLoadedTrendingMovies) {
          return Center(child: Text(state.errorMessage));
        }
        return Container();
      },
    );
  }

  Widget _paginationPage(TrendingMovieLoaded state) {
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
          context.read<TrendingCubit>().getTrendingMovies(selectedPageNumber);
        });
      },
      visiblePagesCount: 6,
      totalPages: state.movies.content.pagination.totalPages,
      currentPage: selectedPageNumber,
    );
  }

  Widget _listMovie(TrendingMovieLoaded state) {
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
            child: TrendingMovieCard(
              itemsEntities: state.movies.content.items[index],
            ),
          );
        },
      ),
    );
  }
}
