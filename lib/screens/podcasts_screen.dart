import 'package:flutter/material.dart';
import 'package:podcast_player_app/providers/podcasts_provider.dart';
import 'package:podcast_player_app/widgets/podcast_preview_item.dart';
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
    Future.delayed(Duration.zero, () {
      final podcasts = Provider.of<PodcastsProvider>(context, listen: false);
      podcasts.fetchPodcasts();

      scrollController.addListener(() {
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels != 0) {
            podcasts.fetchPodcasts();
          }
        }
      });
    });
  }

  Widget buildSpinner() {
    return Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
          strokeWidth: 3.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final podcasts = Provider.of<PodcastsProvider>(context);

    return SingleChildScrollView(
      physics: ScrollPhysics(),
      controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: podcasts.isLoading && podcasts.page == 1
            ? buildSpinner()
            : Column(
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      final podcast = podcasts.items[index];
                      return PodcastPreviewItem(
                          key: Key(podcast.id), podcast: podcast);
                    },
                    itemCount: podcasts.items.length,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    child: podcasts.isLoading ? buildSpinner() : null,
                  ),
                ],
              ),
      ),
    );
  }
}
