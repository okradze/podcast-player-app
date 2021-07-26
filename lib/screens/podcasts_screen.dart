import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_player_app/bloc/podcasts_bloc.dart';
import 'package:podcast_player_app/widgets/podcast_list.dart';
import 'package:podcast_player_app/widgets/search_input.dart';

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
      context.read<PodcastsBloc>().add(FetchPodcastsEvent());

      scrollController.addListener(() {
        if (isBottom) {
          context.read<PodcastsBloc>().add(FetchPodcastsEvent());
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular Podcasts',
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 30),
            SearchInput(),
            SizedBox(height: 50),
            Expanded(
              child: PodcastList(),
            ),
          ],
        ),
      ),
    );
  }

  bool get isBottom {
    if (scrollController.position.atEdge) {
      return scrollController.position.pixels != 0;
    }
    return false;
    // if (!scrollController.hasClients) return false;
    // final maxScroll = scrollController.position.maxScrollExtent;
    // final currentScroll = scrollController.offset;
    // return currentScroll >= (maxScroll * 0.90);
  }
}
