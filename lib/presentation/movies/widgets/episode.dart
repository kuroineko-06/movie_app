import 'package:flutter/material.dart';
import 'package:movie_app/domain/movie/entities/movie_details.dart';
import 'package:movie_app/presentation/movies/widgets/text_detail_style.dart';
import 'package:url_launcher/url_launcher.dart';

class Episode extends StatefulWidget {
  final String content;
  final List<EpisodeEntity> episode;
  const Episode({super.key, required this.content, required this.episode});

  @override
  State<Episode> createState() => _EpisodeState();
}

class _EpisodeState extends State<Episode> {
  String firstHalf = '';
  String secondHalf = '';
  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.content.length > 100) {
      firstHalf = widget.content.substring(0, 100);
      secondHalf = widget.content.substring(100, widget.content.length);
    } else {
      firstHalf = widget.content;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blueGrey[900]),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8),
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextDetailStyle(text: 'Nội dung phim'),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        flag = !flag;
                      });
                    },
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
            secondHalf.isEmpty
                ? TextDetailStyle(text: firstHalf)
                : flag
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: TextDetailStyle(text: firstHalf + "..."),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: TextDetailStyle(text: firstHalf + secondHalf),
                      ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(8),
              child: const TextDetailStyle(text: 'Danh sách tập phim'),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: buttonFirm(context),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget buttonFirm(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(left: 10),
          child: RichText(
            text: TextSpan(
                text: 'server: '.toUpperCase(),
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                children: <InlineSpan>[
                  TextSpan(
                    text:
                        ' ${widget.episode.map((item) => item.serverName).join(", ").toUpperCase()}',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 187, 99, 202)),
                  )
                ]),
          ),
        ),
        const SizedBox(height: 10),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: 200,
            child: ListView.builder(
              itemCount: widget.episode.length, // Number of episodes
              itemBuilder: (BuildContext context, int episodeIndex) {
                return ListView.builder(
                  physics: const PageScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.episode[episodeIndex].serverData.length,
                  itemBuilder: (BuildContext context, int serverIndex) {
                    final element =
                        widget.episode[episodeIndex].serverData[serverIndex];
                    return GestureDetector(
                      onTap: () {
                        Uri _url = Uri.parse(element.linkM3u8.toString());
                        print(element.linkEmbed.toString());
                        launchUrl(_url);
                      },
                      child: Container(
                        width: 50,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.grey[400],
                        ),
                        child: TextDetailStyle(
                          text: element.name,
                        ),
                      ),
                    );
                  },
                );
              },
            ))
      ],
    );
  }

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
