import 'package:flutter/material.dart';
import 'package:podcast_player_app/colors.dart';
import 'package:podcast_player_app/models/podcast_preview_model.dart';
import 'package:podcast_player_app/my_app_icons.dart';

class PodcastPreviewItem extends StatelessWidget {
  final PodcastPreviewModel podcast;
  const PodcastPreviewItem({Key? key, required this.podcast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: kOffsetColor,
        border: null,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              podcast.thumbnail,
              fit: BoxFit.cover,
              width: 60,
              height: 60,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    podcast.title,
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'by ${podcast.publisher}',
                    style: TextStyle(
                      color: kLightText,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            iconSize: 32,
            icon: Icon(
              MyAppIcons.play_button,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
