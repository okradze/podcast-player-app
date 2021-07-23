import 'package:flutter/material.dart';
import 'package:podcast_player_app/providers/podcasts_provider.dart';
import 'package:podcast_player_app/widgets/podcast_list.dart';
import 'package:podcast_player_app/widgets/spinner.dart';
import 'package:provider/provider.dart';

class PodcastsScreen extends StatefulWidget {
  @override
  _PodcastsScreenState createState() => _PodcastsScreenState();
}

class _PodcastsScreenState extends State<PodcastsScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final podcasts = Provider.of<PodcastsProvider>(context, listen: false);
      await podcasts.fetchPodcasts();

      scrollController.addListener(() async {
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels != 0) {
            await podcasts.fetchPodcasts();
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              PodcastList(),
              Consumer<PodcastsProvider>(
                builder: (ctx, podcasts, _) => Container(
                  height: 60,
                  width: double.infinity,
                  child: podcasts.isLoading ? Spinner() : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
