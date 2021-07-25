part of 'podcasts_bloc.dart';

abstract class PodcastsEvent extends Equatable {
  const PodcastsEvent();

  @override
  List<Object> get props => [];
}

class FetchPodcastsEvent extends PodcastsEvent {}
