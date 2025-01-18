import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/presentation/search/widgets/search_field.dart';
import 'package:movie_app/presentation/search/widgets/search_result.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppbar(
        title: Text("Tìm kiếm", style: TextStyle(fontSize: 23)),
      ),
      body: Padding(
        padding: EdgeInsets.all(13),
        child: Column(
          children: [
            SearchField(),
            SizedBox(height: 16),
            Expanded(child: SearchResult()),
          ],
        ),
      ),
    );
  }
}
