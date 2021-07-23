import 'package:flutter/material.dart';
import 'package:podcast_player_app/models/podcast_preview_model.dart';
import 'package:podcast_player_app/themes/colors.dart';

class PodcastDetailScreen extends StatelessWidget {
  static const routeName = '/podcast-detail';

  @override
  Widget build(BuildContext context) {
    final podcast =
        ModalRoute.of(context)?.settings.arguments as PodcastPreviewModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightBackgroundColor,
        elevation: 0.0,
        title:
            Text(podcast.title, style: Theme.of(context).textTheme.headline5),
        iconTheme: IconThemeData(
          color: kTextColor,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              podcast.title,
              style: Theme.of(context).textTheme.headline3,
            ),
            Hero(
              tag: podcast.id,
              child: Image.network(
                podcast.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'by ${podcast.publisher}',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}
