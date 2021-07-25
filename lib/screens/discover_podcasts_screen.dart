import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_player_app/bloc/discover_podcasts_bloc.dart';
import 'package:podcast_player_app/widgets/discover_podcast_lists.dart';
import 'package:podcast_player_app/widgets/spinner.dart';

class DiscoverPodcastsScreen extends StatefulWidget {
  @override
  _DiscoverPodcastsScreenState createState() => _DiscoverPodcastsScreenState();
}

class _DiscoverPodcastsScreenState extends State<DiscoverPodcastsScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      context.read<DiscoverPodcastsBloc>().add(FetchDiscoverPodcastsEvent());

      scrollController.addListener(() {
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels != 0) {
            context
                .read<DiscoverPodcastsBloc>()
                .add(FetchDiscoverPodcastsEvent());
          }
        }
      });
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        controller: scrollController,
        child: Column(
          children: [
            SizedBox(height: 20),
            DiscoverPodcastList(),
          ],
        ),
      ),
    );
  }
}
