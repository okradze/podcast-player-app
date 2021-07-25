import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:podcast_player_app/api/listen_notes_api.dart';
import 'package:podcast_player_app/models/discover_podcasts_model.dart';

part 'discover_podcasts_event.dart';
part 'discover_podcasts_state.dart';

class DiscoverPodcastsBloc
    extends Bloc<DiscoverPodcastsEvent, DiscoverPodcastsState> {
  DiscoverPodcastsBloc() : super(DiscoverPodcastsState());
  int page = 1;

  @override
  Stream<DiscoverPodcastsState> mapEventToState(
    DiscoverPodcastsEvent event,
  ) async* {
    if (event is FetchDiscoverPodcastsEvent) {
      if (!state.hasNextPage) yield state;

      final res = await ListenNotesApi.fetchDiscoverPodcasts(page);

      if (res.statusCode != 200) {
        yield state.copyWith(status: DiscoverPodcastsStatus.failure);
      }

      final Map<String, dynamic> data = jsonDecode(res.body);
      final lists = List<Map<String, dynamic>>.from(data['curated_lists']);

      final List<DiscoverPodcastsModel> items = lists.map((list) {
        return DiscoverPodcastsModel.fromJson(list);
      }).toList();

      final hasNextPage = data['has_next'];
      page = page + 1;

      yield state.copyWith(
        lists: List.of(state.lists)..addAll(items),
        status: DiscoverPodcastsStatus.success,
        hasNextPage: hasNextPage,
      );
    }
  }
}
