import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/core/configs/theme/app_colors.dart';
import 'package:movie_app/presentation/movies/bloc/movie_detail_cubit.dart';
import 'package:movie_app/presentation/movies/bloc/movie_detail_state.dart';
import 'package:movie_app/presentation/movies/widgets/details_movie.dart';
import 'package:movie_app/presentation/movies/widgets/episode.dart';
import 'package:movie_app/presentation/movies/widgets/movie_images.dart';

class DetailPages extends StatefulWidget {
  final String slug;
  const DetailPages({super.key, required this.slug});

  @override
  State<DetailPages> createState() => _DetailPagesState();
}

class _DetailPagesState extends State<DetailPages> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _serverKey = GlobalKey(); // Key for the SERVER text

  void scrollToServer() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox =
          _serverKey.currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero).dy;
      _scrollController.animateTo(
        position - 100, // Adjust offset as needed
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailCubit()..getMovieDetail(widget.slug),
      child: BlocBuilder<MovieDetailCubit, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is MovieDetailLoaded) {
            return Container(
              color: AppColors.background,
              child: Scaffold(
                appBar: BasicAppbar(
                  hideBack: false,
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      state.movies.movie.name,
                      style: const TextStyle(fontSize: 23),
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  controller: _scrollController, // Attach the controller
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      children: [
                        const SizedBox(height: 25),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12)),
                            color: Colors.blueGrey[900],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MovieImages(
                              imageUrl: state.movies.movie.posterUrl.toString(),
                              onViewButtonPressed:
                                  scrollToServer, // Update to scroll to SERVER
                              trailerUrl: state.movies.movie.trailerUrl,
                              name: state.movies.movie.name,
                              time: state.movies.movie.modified,
                              content: state.movies.movie.content,
                            ),
                          ),
                        ),
                        DetailsMovie(
                          name: state.movies.movie.name,
                          originName: state.movies.movie.originName,
                          episodeCurrent: state.movies.movie.episodeCurrent,
                          episodeTotal: state.movies.movie.episodeTotal,
                          time: state.movies.movie.time,
                          quality: state.movies.movie.quality,
                          lang: state.movies.movie.lang,
                          director: state.movies.movie.director,
                          actor: state.movies.movie.actor,
                          year: state.movies.movie.year,
                          category: state.movies.movie.category,
                          country: state.movies.movie.country,
                        ),
                        const SizedBox(height: 16),
                        Episode(
                          key:
                              _serverKey, // Assign the key to the Episode widget
                          content: state.movies.movie.content,
                          episode: state.movies.episodes,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          if (state is FailuerLoadMovieDetail) {
            return Center(child: Text(state.errorMessage));
          }
          return Container();
        },
      ),
    );
  }
}
