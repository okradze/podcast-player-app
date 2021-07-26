import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_player_app/bloc/discover_podcasts_bloc.dart';
import 'package:podcast_player_app/widgets/discover_podcasts_lists.dart';
import 'package:podcast_player_app/widgets/search_input.dart';

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
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      controller: scrollController,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Discover Podcasts',
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 30),
              SearchInput(openSearchScreenOnTap: true),
              SizedBox(height: 50),
              DiscoverPodcastsLists(),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
