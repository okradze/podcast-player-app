import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:podcast_player_app/api/listen_notes_api.dart';
import 'package:podcast_player_app/models/podcast_preview_model.dart';

part 'search_podcasts_event.dart';
part 'search_podcasts_state.dart';

class SearchPodcastsBloc
    extends Bloc<SearchPodcastsEvent, SearchPodcastsState> {
  SearchPodcastsBloc() : super(SearchPodcastsState());

  @override
  Stream<SearchPodcastsState> mapEventToState(
    SearchPodcastsEvent event,
  ) async* {
    final res = await ListenNotesApi.searchPodcasts(event.searchTerm);

    if (res.statusCode != 200) {
      yield state.copyWith(status: SearchPodcastsStatus.failure);
    }

    final data = jsonDecode(res.body) as Map<String, dynamic>;
    final List<PodcastPreviewModel> podcasts = data['podcasts'];

    print(podcasts);
  }
}
