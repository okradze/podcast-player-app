part of 'discover_podcasts_bloc.dart';

enum DiscoverPodcastsStatus { initial, success, failure }

class DiscoverPodcastsState extends Equatable {
  final DiscoverPodcastsStatus status;
  final List<DiscoverPodcastsModel> lists;
  final bool hasNextPage;

  DiscoverPodcastsState({
    this.status = DiscoverPodcastsStatus.initial,
    this.lists = const <DiscoverPodcastsModel>[],
    this.hasNextPage = true,
  });

  @override
  List<Object> get props => [status, lists, hasNextPage];

  DiscoverPodcastsState copyWith({
    DiscoverPodcastsStatus? status,
    List<DiscoverPodcastsModel>? lists,
    bool? hasNextPage,
  }) {
    return DiscoverPodcastsState(
      status: status ?? this.status,
      lists: lists ?? this.lists,
      hasNextPage: hasNextPage ?? this.hasNextPage,
    );
  }
}
