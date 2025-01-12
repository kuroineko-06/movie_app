import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchTrailer extends StatefulWidget {
  final String trailerUrl, name, content;
  final DateTime time;
  const WatchTrailer(
      {super.key,
      required this.trailerUrl,
      required this.name,
      required this.time,
      required this.content});

  @override
  State<WatchTrailer> createState() => _WatchTrailerState();
}

class _WatchTrailerState extends State<WatchTrailer> {
  String? videoId = '';

  @override
  void initState() {
    videoId = YoutubePlayer.convertUrlToId(widget.trailerUrl.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Trailer_link: ${widget.trailerUrl}");
    print("name: ${widget.name}");
    print("Time: ${widget.time}");
    print("Content: ${widget.content}");

    final _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    DateTime dateTime = DateTime.parse(widget.time.toString());
    String _getMonthName(int month) {
      const List<String> monthNames = [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December'
      ];
      return monthNames[month - 1]; // month is 1-indexed
    }

    String formattedDate =
        '${dateTime.day.toString().padLeft(2, '0')} ${_getMonthName(dateTime.month)} ${dateTime.year}';

    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(widget.name,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_month,
                          size: 20, color: Colors.grey),
                      Text(
                        ' ${formattedDate}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: Row(
                      children: [
                        Icon(Icons.star, size: 20, color: Colors.orange),
                        Text(
                          ' 7.6',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text("Tổng quan",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              const SizedBox(height: 16),
              Text(widget.content,
                  style: Theme.of(context).primaryTextTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
