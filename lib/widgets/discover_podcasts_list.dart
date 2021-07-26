import 'package:flutter/material.dart';
import 'package:podcast_player_app/models/discover_podcasts_model.dart';
import 'package:podcast_player_app/widgets/discover_podcast_item.dart';

class DiscoverPodcastsList extends StatelessWidget {
  const DiscoverPodcastsList({
    Key? key,
    required this.list,
  }) : super(key: key);

  final DiscoverPodcastsModel list;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          width: double.infinity,
          child: Text(
            list.title,
            style: Theme.of(context).textTheme.headline5,
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
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: list.podcasts
                .map(
                  (podcast) => DiscoverPodcastItem(
                    key: Key(podcast.id),
                    podcast: podcast,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
