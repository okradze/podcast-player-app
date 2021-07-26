import 'package:flutter/material.dart';
import 'package:podcast_player_app/models/podcast_preview_model.dart';
import 'package:podcast_player_app/screens/podcast_detail_screen.dart';
import 'package:podcast_player_app/themes/colors.dart';

class DiscoverPodcastItem extends StatelessWidget {
  final PodcastPreviewModel podcast;
  const DiscoverPodcastItem({Key? key, required this.podcast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Future.delayed(Duration.zero, () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => PodcastDetailScreen(podcast: podcast)));
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: 130,
            height: 130,
            color: kOffsetColor,
            child: Image.network(
              podcast.thumbnail,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
