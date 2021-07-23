import 'package:flutter/material.dart';
import 'package:podcast_player_app/providers/discover_podcasts_provider.dart';
import 'package:podcast_player_app/widgets/discover_podcast_list.dart';
import 'package:podcast_player_app/widgets/spinner.dart';
import 'package:provider/provider.dart';

class DiscoverPodcastsScreen extends StatefulWidget {
  @override
  _DiscoverPodcastsScreenState createState() => _DiscoverPodcastsScreenState();
}

class _DiscoverPodcastsScreenState extends State<DiscoverPodcastsScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final discoverPodcasts =
          Provider.of<DiscoverPodcastsProvider>(context, listen: false);
      await discoverPodcasts.fetchPodcastLists();

      scrollController.addListener(() async {
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels != 0) {
            await discoverPodcasts.fetchPodcastLists();
          }
        }
      });
    });
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
            Consumer<DiscoverPodcastsProvider>(
              builder: (ctx, podcasts, _) => Container(
                height: 60,
                width: double.infinity,
                child: podcasts.isLoading ? Spinner() : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
