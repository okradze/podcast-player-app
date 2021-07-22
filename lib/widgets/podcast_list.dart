import 'package:flutter/material.dart';
import 'package:podcast_player_app/providers/podcasts_provider.dart';
import 'package:podcast_player_app/widgets/podcast_preview_item.dart';
import 'package:provider/provider.dart';

class PodcastList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final podcasts = Provider.of<PodcastsProvider>(context);
    print('podcast list rebuilds');

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        final podcast = podcasts.items[index];
        return PodcastPreviewItem(key: Key(podcast.id), podcast: podcast);
      },
      itemCount: podcasts.items.length,
    );
  }
}
