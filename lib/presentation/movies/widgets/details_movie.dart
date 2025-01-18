import 'package:flutter/material.dart';
import 'package:movie_app/domain/movie/entities/movie_details.dart';
import 'package:movie_app/presentation/movies/widgets/text_detail_style.dart';

class DetailsMovie extends StatelessWidget {
  final String name,
      originName,
      episodeCurrent,
      episodeTotal,
      time,
      quality,
      lang;
  final int year;
  final List<String> director, actor;
  final List<CategoryEntity> category;
  final List<CountryEntity> country;
  const DetailsMovie(
      {super.key,
      required this.name,
      required this.originName,
      required this.episodeCurrent,
      required this.episodeTotal,
      required this.time,
      required this.quality,
      required this.lang,
      required this.director,
      required this.actor,
      required this.year,
      required this.category,
      required this.country});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
        color: Colors.blueGrey[900],
      ),
      child: Column(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 23,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.purple[500]),
                ),
              ),
              const SizedBox(height: 0),
              Text(
                originName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.none,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.blue[200]),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Table(
              border: const TableBorder(
                  horizontalInside: BorderSide(width: 0.2, color: Colors.grey)),
              defaultColumnWidth: const FixedColumnWidth(140),
              children: [
                TableRow(children: [
                  TextDetailStyle(
                    text: 'Tình trạng',
                    color: Colors.blue[200],
                  ),
                  TextDetailStyle(text: episodeCurrent),
                ]),
                TableRow(children: [
                  TextDetailStyle(
                    text: 'Số tập',
                    color: Colors.blue[200],
                  ),
                  TextDetailStyle(text: episodeTotal),
                ]),
                TableRow(children: [
                  TextDetailStyle(
                    text: 'Thời lượng',
                    color: Colors.blue[200],
                  ),
                  TextDetailStyle(text: time),
                ]),
                TableRow(children: [
                  TextDetailStyle(
                    text: 'Năm phát hành',
                    color: Colors.blue[200],
                  ),
                  TextDetailStyle(text: '$year'),
                ]),
                TableRow(children: [
                  TextDetailStyle(
                    text: 'Chất lượng',
                    color: Colors.blue[200],
                  ),
                  TextDetailStyle(text: quality),
                ]),
                TableRow(children: [
                  TextDetailStyle(
                    text: 'Ngôn ngữ',
                    color: Colors.blue[200],
                  ),
                  TextDetailStyle(text: lang),
                ]),
                TableRow(children: [
                  TextDetailStyle(
                    text: 'Đạo diễn',
                    color: Colors.blue[200],
                  ),
                  TextDetailStyle(text: director.join().toString()),
                ]),
                TableRow(children: [
                  TextDetailStyle(
                    text: 'Diễn viên',
                    color: Colors.blue[200],
                  ),
                  TextDetailStyle(text: actor.join(', ').toString()),
                ]),
                TableRow(children: [
                  TextDetailStyle(
                    text: 'Thể loại',
                    color: Colors.blue[200],
                  ),
                  TextDetailStyle(
                      text: category
                          .map((item) => item.name.toString())
                          .join(", ")),
                ]),
                TableRow(children: [
                  TextDetailStyle(
                    text: 'Quốc gia',
                    color: Colors.blue[200],
                  ),
                  TextDetailStyle(
                      text: country
                          .map((item) => item.name.toString())
                          .join(", ")),
                ]),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
