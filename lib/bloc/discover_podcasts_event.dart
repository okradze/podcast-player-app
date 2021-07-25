part of 'discover_podcasts_bloc.dart';

abstract class DiscoverPodcastsEvent extends Equatable {
  const DiscoverPodcastsEvent();

  @override
  List<Object> get props => [];
}

class FetchDiscoverPodcastsEvent extends DiscoverPodcastsEvent {}
