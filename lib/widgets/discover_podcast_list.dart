import 'package:flutter/material.dart';
import 'package:podcast_player_app/providers/discover_podcasts_provider.dart';
import 'package:podcast_player_app/widgets/podcast_preview_item.dart';
import 'package:provider/provider.dart';

class DiscoverPodcastList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final discoverPodcasts = Provider.of<DiscoverPodcastsProvider>(context);
    print('discover podcast list rebuilds');

    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (ctx, index) {
        return const Divider();
      },
      itemBuilder: (ctx, index) {
        final podcast = discoverPodcasts.items[index];
        return PodcastPreviewItem(key: Key(podcast.id), podcast: podcast);
      },
      itemCount: discoverPodcasts.items.length,
    );
  }
}
