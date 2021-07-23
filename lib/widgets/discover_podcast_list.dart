import 'package:flutter/material.dart';
import 'package:podcast_player_app/colors.dart';
import 'package:podcast_player_app/providers/discover_podcasts_provider.dart';
import 'package:provider/provider.dart';

class DiscoverPodcastList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final discoverPodcasts = Provider.of<DiscoverPodcastsProvider>(context);
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        ...discoverPodcasts.items.map((item) {
          return Column(
            children: [
              Text(
                item.title,
                style: TextStyle(
                  fontSize: 16,
                  color: kTextColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: size.width,
                height: 120,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: item.podcasts.length,
                  separatorBuilder: (ctx, int index) {
                    return SizedBox(width: 20);
                  },
                  itemBuilder: (ctx, index) {
                    final podcast = item.podcasts[index];
                    return Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(podcast.thumbnail),
                      ),
                    );
                  },
                  // children: [
                  //   ...item.podcasts.map(
                  //     (podcast) => Container(
                  //       child: ClipRRect(
                  //         borderRadius: BorderRadius.circular(20.0),
                  //         child: Image.network(podcast.thumbnail),
                  //       ),
                  //     ),
                  //   ),
                  // ],
                ),
              ),
              SizedBox(height: 40),
            ],
          );
        }),
      ],
    );

    // return ListView.separated(
    //   physics: NeverScrollableScrollPhysics(),
    //   shrinkWrap: true,
    //   separatorBuilder: (ctx, index) {
    //     return const Divider();
    //   },
    //   itemBuilder: (ctx, index) {
    //     final podcast = discoverPodcasts.items[index];
    //     return PodcastPreviewItem(key: Key(podcast.id), podcast: podcast);
    //   },
    //   itemCount: discoverPodcasts.items.length,
    // );
  }
}
