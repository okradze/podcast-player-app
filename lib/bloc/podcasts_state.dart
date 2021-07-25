part of 'podcasts_bloc.dart';

enum PodcastsStatus { initial, success, failure }

class PodcastsState extends Equatable {
  final PodcastsStatus status;
  final List<PodcastPreviewModel> podcasts;
  final bool hasNextPage;

  const PodcastsState({
    this.status = PodcastsStatus.initial,
    this.podcasts = const <PodcastPreviewModel>[],
    this.hasNextPage = true,
  });

  @override
  List<Object> get props => [status, podcasts, hasNextPage];

  PodcastsState copyWith({
    PodcastsStatus? status,
    List<PodcastPreviewModel>? podcasts,
    bool? hasNextPage,
  }) {
    return PodcastsState(
      status: status ?? this.status,
      podcasts: podcasts ?? this.podcasts,
      hasNextPage: hasNextPage ?? this.hasNextPage,
    );
  }
}
