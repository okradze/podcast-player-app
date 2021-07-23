import 'package:podcast_player_app/models/podcast_preview_model.dart';

class DiscoverPodcastsModel {
  final String id, title;
  final List<PodcastPreviewModel> podcasts;

  DiscoverPodcastsModel({
    required this.id,
    required this.title,
    required this.podcasts,
  });

  factory DiscoverPodcastsModel.fromJson(Map<String, dynamic> json) {
    final podcasts = List<Map<String, dynamic>>.from(json['podcasts']);

    return DiscoverPodcastsModel(
      id: json['id'],
      title: json['title'],
      podcasts: podcasts.map((e) => PodcastPreviewModel.fromJson(e)).toList(),
    );
  }
}
