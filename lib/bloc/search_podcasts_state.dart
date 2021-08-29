part of 'search_podcasts_bloc.dart';

enum SearchPodcastsStatus { initial, success, failure }

class SearchPodcastsState extends Equatable {
  final List<PodcastPreviewModel> podcasts;
  final SearchPodcastsStatus status;

  const SearchPodcastsState({
    this.podcasts = const <PodcastPreviewModel>[],
    this.status = SearchPodcastsStatus.initial,
  });

  @override
  List<Object> get props => [podcasts, status];

  SearchPodcastsState copyWith({
    List<PodcastPreviewModel>? podcasts,
    SearchPodcastsStatus? status,
  }) {
    return SearchPodcastsState(
      podcasts: podcasts ?? this.podcasts,
      status: status ?? this.status,
    );
  }
}
