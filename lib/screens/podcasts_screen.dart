import 'package:flutter/material.dart';
import 'package:podcast_player_app/providers/podcasts_provider.dart';
import 'package:podcast_player_app/widgets/podcast_preview_item.dart';
import 'package:provider/provider.dart';

class PodcastsScreen extends StatefulWidget {
  @override
  _PodcastsScreenState createState() => _PodcastsScreenState();
}

class _PodcastsScreenState extends State<PodcastsScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final podcasts = Provider.of<PodcastsProvider>(context, listen: false);
      podcasts.fetchPodcasts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final podcasts = Provider.of<PodcastsProvider>(context);

    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: podcasts.isLoading
            ? Center(child: CircularProgressIndicator.adaptive())
            : ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  final podcast = podcasts.items[index];
                  return PodcastPreviewItem(
                      key: Key(podcast.id), podcast: podcast);
                },
                itemCount: podcasts.items.length,
              ),
      ),
    );
  }
}
