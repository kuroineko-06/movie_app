import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/search/bloc/search_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return TextField(
      controller: searchController,
      onChanged: (value) {
        if (value.isNotEmpty) {
          context.read<SearchCubit>().getSearch(value);
        }
      },
      decoration: InputDecoration(hintText: "Nhập tên phim ....."),
    );
  }
}
