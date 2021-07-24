import 'dart:collection';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:podcast_player_app/apiClient.dart';
import 'package:podcast_player_app/models/podcast_preview_model.dart';

class PodcastsProvider with ChangeNotifier {
  final List<PodcastPreviewModel> _items = [];
  bool _loading = false;
  int _page = 1;
  bool _hasNextPage = true;

  UnmodifiableListView<PodcastPreviewModel> get items =>
      UnmodifiableListView(_items);
  bool get isLoading => _loading;
  bool get hasNextPage => _hasNextPage;
  int get page => _page;

  void setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> fetchPodcasts() async {
    try {
      if (!_hasNextPage) return;

      setLoading(true);

      final res =
          await listenNotesApi.get(Uri.parse('/best_podcasts?page=$_page'));
      setLoading(false);

      final data = jsonDecode(res.body) as Map<String, dynamic>;
      final List<dynamic> podcasts = data['podcasts'];

      podcasts.forEach((podcast) {
        _items.add(PodcastPreviewModel.fromJson(podcast));
      });

      _hasNextPage = data['has_next'];
      _page = _page + 1;
      notifyListeners();
    } catch (e) {
      setLoading(false);
      throw e;
    }
  }
}
