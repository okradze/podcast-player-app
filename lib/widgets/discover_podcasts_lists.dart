import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_player_app/bloc/discover_podcasts_bloc.dart';
import 'package:podcast_player_app/widgets/discover_podcast_item.dart';

class DiscoverPodcastsLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverPodcastsBloc, DiscoverPodcastsState>(
      builder: (context, state) {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            final list = state.lists[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: Column(
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
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: list.podcasts.length,
                      itemBuilder: (ctx, index) {
                        final podcast = list.podcasts[index];
                        return DiscoverPodcastItem(
                          key: Key(podcast.id),
                          podcast: podcast,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: state.lists.length,
        );
      },
    );
  }
}
