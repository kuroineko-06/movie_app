import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/common/widgets/tv/tv_card.dart';
import 'package:movie_app/presentation/home/bloc/popular_tv_cubit.dart';
import 'package:movie_app/presentation/home/bloc/popular_tv_state.dart';
import 'package:number_pagination/number_pagination.dart';

class ListTvShowsPage extends StatefulWidget {
  const ListTvShowsPage({super.key});

  @override
  State<ListTvShowsPage> createState() => _ListTvShowsPageState();
}

class _ListTvShowsPageState extends State<ListTvShowsPage> {
  int selectedPageNumber = 1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularTVCubit, PopularTVState>(
      builder: (context, state) {
        if (state is PopularTVLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is PopularTVLoaded) {
          selectedPageNumber = state.tv.data.params.pagination.currentPage;
          return Scaffold(
            appBar: BasicAppbar(
              hideBack: false,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(state.tv.data.seoOnPage.titleHead),
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
        if (state is FailureLoadedPopularTV) {
          return Center(child: Text(state.errorMessage));
        }
        return Container();
      },
    );
  }

  Widget _paginationPage(PopularTVLoaded state) {
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
          context.read<PopularTVCubit>().getPopularTV(selectedPageNumber);
        });
      },
      visiblePagesCount: 6,
      totalPages: state.tv.data.params.pagination.totalPages,
      currentPage: selectedPageNumber,
    );
  }

  Widget _listMovie(PopularTVLoaded state) {
    return Flexible(
      child: GridView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          crossAxisSpacing: 0, // Space between columns
          mainAxisSpacing: 8, // Space between rows
        ),
        itemCount: state.tv.data.items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TvCard(
              tvEntity: state.tv.data.items[index],
            ),
          );
        },
      ),
    );
  }
}
