import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:podcast_player_app/apiClient.dart';
import 'package:podcast_player_app/models/podcast_preview_model.dart';

class DiscoverPodcastsProvider with ChangeNotifier {
  List<PodcastPreviewModel> _items = [];
  List<String> _titles = [];
  bool _loading = false;
  int _page = 1;
  bool _hasNextPage = true;

  List<PodcastPreviewModel> get items => _items;
  List<String> get titles => _titles;
  bool get isLoading => _loading;
  bool get hasNextPage => _hasNextPage;
  int get page => _page;

  void setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> fetchPodcastLists() async {
    try {
      if (!_hasNextPage) return;

      setLoading(true);

      final res =
          await listenNotesApi.get(Uri.parse('/curated_podcasts?page=$_page'));
      setLoading(false);

      final data = jsonDecode(res.body) as Map<String, dynamic>;
      final List<dynamic> lists = data['curated_lists'];

      lists.forEach((list) {
        list['podcasts'].forEach((e) {
          _items.add(PodcastPreviewModel.fromJson(e));
        });
        _titles.add(list['title']);
      });

      _hasNextPage = data['has_next'];
      _page = _page + 1;
      notifyListeners();
    } catch (e) {
      setLoading(false);
      // throw e;
    }
  }
}
