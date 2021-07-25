import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_player_app/bloc/podcasts_bloc.dart';
import 'package:podcast_player_app/widgets/podcast_list.dart';

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
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: PodcastList(),
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
