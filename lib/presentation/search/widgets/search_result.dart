import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/search/search_card.dart';
import 'package:movie_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_app/presentation/search/bloc/search_state.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is SearchLoaded) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8, // Add spacing between rows
              childAspectRatio: 0.6, // Adjust aspect ratio as needed
            ),
            itemCount: state.search.content.data.items.length,
            itemBuilder: (context, index) {
              return SearchCard(
                itemsEntities: state.search.content.data.items[index],
              );
            },
          );
        }
        if (state is FailureLoadedSearchs) {
          return Center(child: Text(state.errorMessage));
        }
        return Container();
      },
    );
  }
}
