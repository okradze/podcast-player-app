import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_player_app/bloc/discover_podcasts_bloc.dart';
import 'package:podcast_player_app/widgets/discover_podcasts_list.dart';
import 'package:podcast_player_app/widgets/spinner.dart';

class DiscoverPodcastsLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverPodcastsBloc, DiscoverPodcastsState>(
      builder: (context, state) {
        switch (state.status) {
          case DiscoverPodcastsStatus.failure:
            return Center(child: Text('Something Went Wrong'));
          case DiscoverPodcastsStatus.success:
            return ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                if (index == state.lists.length) return Spinner();
                final list = state.lists[index];
                return DiscoverPodcastsList(key: Key(list.id), list: list);
              },
              itemCount: state.hasNextPage
                  ? state.lists.length + 1
                  : state.lists.length,
            );
          default:
            return Spinner();
        }
      },
    );
  }
}
