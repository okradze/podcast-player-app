import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_player_app/bloc/discover_podcasts_bloc.dart';
import 'package:podcast_player_app/widgets/discover_podcast_list.dart';

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

            return DiscoverPodcastsList(list: list);
          },
          itemCount: state.lists.length,
        );
      },
    );
  }
}
