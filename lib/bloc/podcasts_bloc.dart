import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:podcast_player_app/api/listen_notes_api.dart';
import 'package:podcast_player_app/models/podcast_preview_model.dart';

part 'podcasts_event.dart';
part 'podcasts_state.dart';

class PodcastsBloc extends Bloc<PodcastsEvent, PodcastsState> {
  int page = 1;
  PodcastsBloc() : super(PodcastsState());

  @override
  Stream<PodcastsState> mapEventToState(
    PodcastsEvent event,
  ) async* {
    if (event is FetchPodcastsEvent) {
      if (!state.hasNextPage) yield state;

      final res = await ListenNotesApi.fetchPodcasts(page);

      if (res.statusCode != 200) {
        yield state.copyWith(
          status: PodcastsStatus.failure,
        );
      }

      final data = jsonDecode(res.body) as Map<String, dynamic>;
      final List<dynamic> podcasts = data['podcasts'];
      final List<PodcastPreviewModel> items = podcasts.map((podcast) {
        return PodcastPreviewModel.fromJson(podcast);
      }).toList();

      final hasNextPage = data['has_next'];
      page = page + 1;

      yield state.copyWith(
        podcasts: List.of(state.podcasts)..addAll(items),
        hasNextPage: hasNextPage,
        status: PodcastsStatus.success,
      );
    }
  }
}
