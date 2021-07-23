import 'package:flutter/material.dart';
import 'package:podcast_player_app/themes/colors.dart';
import 'package:podcast_player_app/providers/discover_podcasts_provider.dart';
import 'package:provider/provider.dart';

class DiscoverPodcastList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final discoverPodcasts = Provider.of<DiscoverPodcastsProvider>(context);

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        final item = discoverPodcasts.items[index];

        return Container(
          margin: const EdgeInsets.only(bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                child: Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 17,
                    color: kTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                alignment: Alignment.centerLeft,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: item.podcasts.length,
                  itemBuilder: (ctx, index) {
                    final podcast = item.podcasts[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(podcast.thumbnail),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
      itemCount: discoverPodcasts.items.length,
    );
  }
}
