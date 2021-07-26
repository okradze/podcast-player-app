import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_player_app/bloc/podcasts_bloc.dart';
import 'package:podcast_player_app/widgets/podcast_preview_item.dart';
import 'package:podcast_player_app/widgets/spinner.dart';

class PodcastList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PodcastsBloc, PodcastsState>(
      builder: (context, state) {
        switch (state.status) {
          case PodcastsStatus.failure:
            return Center(child: Text('Something Went Wrong'));
          case PodcastsStatus.success:
            return ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                if (index == state.podcasts.length) {
                  return Spinner();
                }
                final podcast = state.podcasts[index];
                return PodcastPreviewItem(
                    key: Key(podcast.id), podcast: podcast);
              },
              itemCount: state.hasNextPage
                  ? state.podcasts.length + 1
                  : state.podcasts.length,
            );
          default:
            return Spinner();
        }
      },
    );
  }
}
