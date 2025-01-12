import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/core/configs/assets/app_vectors.dart';
import 'package:movie_app/presentation/auth/pages/sign_in.dart';
import 'package:movie_app/presentation/home/pages/list_details/list_anime_movie_page.dart';
import 'package:movie_app/presentation/home/pages/list_details/list_series_movie_page.dart';
import 'package:movie_app/presentation/home/pages/list_details/list_single_movie_page.dart';
import 'package:movie_app/presentation/home/pages/list_details/list_trending_movie.dart';
import 'package:movie_app/presentation/home/pages/list_details/list_tv_shows_page.dart';
import 'package:movie_app/presentation/search/pages/search_page.dart';
import 'package:movie_app/presentation/home/widgets/anime_movie.dart';
import 'package:movie_app/presentation/home/widgets/category_text.dart';
import 'package:movie_app/presentation/home/widgets/popular_tv.dart';
import 'package:movie_app/presentation/home/widgets/series_movie.dart';
import 'package:movie_app/presentation/home/widgets/single_movie.dart';
import 'package:movie_app/presentation/home/widgets/trending_movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  String? _selectedOption;

  final List<String> _options = [
    'Phim Bộ',
    'Phim Lẻ',
    'Hoạt Hình',
    'TV Shows',
    'Đăng Xuất',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
          hideBack: true,
          title: SvgPicture.asset(AppVectors.logo),
          action: Row(
            children: [
              IconButton(
                onPressed: () {
                  AppNavigator.push(context, const SearchPage());
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  showMenu(
                    context: context,
                    position: const RelativeRect.fromLTRB(
                        100, 100, 0, 0), // Adjust position as needed
                    items: _options.map((String option) {
                      return PopupMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        _selectedOption = value;
                      });
                      // Handle the selected option
                      _handleSelection(value);
                    }
                  });
                },
                icon: const Icon(Icons.list_outlined),
              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Phim mới cập nhật 🔥',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {
                        AppNavigator.push(
                            context, const ListTrendingMoviePage());
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blue,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const TrendingMovies(),
            const SizedBox(height: 10),
            const CategoryText(title: 'Phim Lẻ 🎞️'),
            const SizedBox(height: 10),
            const SingleMovie(),
            const SizedBox(height: 10),
            const CategoryText(
              title: 'Phim Dài Tập ▶️',
            ),
            const SizedBox(height: 10),
            const SeriesMovie(),
            const SizedBox(height: 10),
            const CategoryText(
              title: 'Hoạt Hình ⛩️',
            ),
            const SizedBox(height: 10),
            const AnimeMovie(),
            const SizedBox(height: 10),
            const CategoryText(
              title: 'Tv Show 🖥️',
            ),
            const SizedBox(height: 10),
            const PopularTV(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _handleSelection(String value) {
    switch (value) {
      case 'Phim Bộ':
        AppNavigator.push(context, ListSeriesMoviePage());
        break;
      case 'Phim Lẻ':
        AppNavigator.push(context, ListSingleMoviePage());
        print('Selected: Phim Le');
        break;
      case 'Hoạt Hình':
        AppNavigator.push(context, ListAnimeMoviePage());
        print('Selected: Hoathinh');
        break;
      case 'TV Shows':
        AppNavigator.push(context, ListTvShowsPage());
        print('Selected: TV Shows');
        break;
      case 'Đăng Xuất':
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Bạn muốn đăng xuất 😢'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Từ chối'),
                ),
                TextButton(
                  onPressed: () {
                    Future.delayed(Duration(seconds: 2));
                    AppNavigator.pushAndRemove(
                        context, SignInPage()); // Close the dialog
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        print('Selected: Logout');
        break;
    }
  }
}
