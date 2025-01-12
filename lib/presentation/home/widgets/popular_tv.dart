import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/tv/tv_card.dart';
import 'package:movie_app/presentation/home/bloc/popular_tv_cubit.dart';
import 'package:movie_app/presentation/home/bloc/popular_tv_state.dart';

class PopularTV extends StatelessWidget {
  const PopularTV({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularTVCubit()..getPopularTV(1),
      child: BlocBuilder<PopularTVCubit, PopularTVState>(
        builder: (context, state) {
          if (state is PopularTVLoading) {
            // return const Center(child: CircularProgressIndicator());
          }
          if (state is PopularTVLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final tv = state.tv.data.items[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: TvCard(tvEntity: tv),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: state.tv.data.items.length),
            );
          }
          if (state is FailureLoadedPopularTV) {
            return Center(child: Text(state.errorMessage));
          }
          return Container();
        },
      ),
    );
  }
}
