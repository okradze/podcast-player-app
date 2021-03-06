import 'package:equatable/equatable.dart';

class PodcastPreviewModel extends Equatable {
  final String id, title, thumbnail, publisher;

  PodcastPreviewModel({
    required this.id,
    required this.title,
    required this.publisher,
    required this.thumbnail,
  });

  factory PodcastPreviewModel.fromJson(Map<String, dynamic> json) {
    return PodcastPreviewModel(
      id: json['id'],
      title: json['title'],
      publisher: json['publisher'],
      thumbnail: json['thumbnail'],
    );
  }

  @override
  List<Object?> get props => [id, title, thumbnail, publisher];
}
