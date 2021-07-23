import 'package:flutter/material.dart';
import 'package:podcast_player_app/screens/podcast_detail_screen.dart';
import 'package:podcast_player_app/themes/colors.dart';
import 'package:podcast_player_app/models/podcast_preview_model.dart';
import 'package:podcast_player_app/my_app_icons.dart';

class PodcastPreviewItem extends StatelessWidget {
  final PodcastPreviewModel podcast;
  const PodcastPreviewItem({Key? key, required this.podcast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(PodcastDetailScreen.routeName, arguments: podcast);
      },
      child: Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          color: kOffsetColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                podcast.thumbnail,
                fit: BoxFit.cover,
                width: 70,
                height: 70,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      podcast.title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'by ${podcast.publisher}',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: kLightText,
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
      ),
    );
  }
}
