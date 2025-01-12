import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/presentation/movies/widgets/text_detail_style.dart';
import 'package:movie_app/presentation/watch/pages/watch_trailer.dart';

class MovieImages extends StatelessWidget {
  final String imageUrl, trailerUrl, name, content;
  final DateTime time;
  final VoidCallback onViewButtonPressed;

  const MovieImages({
    super.key,
    required this.imageUrl,
    required this.onViewButtonPressed,
    required this.trailerUrl,
    required this.name,
    required this.time,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostImage(context),
        Container(
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.purple[300],
                ),
                child: TextButton(
                  onPressed: onViewButtonPressed, // Trigger scroll
                  child: const TextDetailStyle(
                    text: "Xem phim",
                  ),
                ),
              ),
              trailerUrl.isNotEmpty &&
                      trailerUrl.contains("https://www.youtube.com/watch?v=")
                  ? Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red[300],
                      ),
                      child: TextButton(
                        onPressed: () {
                          AppNavigator.push(
                              context,
                              WatchTrailer(
                                trailerUrl: trailerUrl,
                                name: name,
                                time: time,
                                content: content,
                              ));
                        },
                        child: const TextDetailStyle(text: "Trailer"),
                      ),
                    )
                  : Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red[300],
                      ),
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Thông báo!'),
                                content: const Text(
                                    "Xin lỗi, chúng tôi không tìm thấy trailer cho bộ phim này 🥺"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("OK"))
                                ],
                              );
                            },
                          );
                        },
                        child: const TextDetailStyle(text: "Trailer"),
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }

  Widget PostImage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 430,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.fill),
      ),
    );
  }
}
