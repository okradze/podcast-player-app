part of 'search_podcasts_bloc.dart';

class SearchPodcastsEvent extends Equatable {
  final String searchTerm;
  const SearchPodcastsEvent({required this.searchTerm});

  @override
  List<Object> get props => [searchTerm];
}
