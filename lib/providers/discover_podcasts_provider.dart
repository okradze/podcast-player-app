import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:podcast_player_app/apiClient.dart';
import 'package:podcast_player_app/models/discover_podcasts_model.dart';

class DiscoverPodcastsProvider with ChangeNotifier {
  List<DiscoverPodcastsModel> _items = [];
  bool _loading = false;
  int _page = 1;
  bool _hasNextPage = true;

  List<DiscoverPodcastsModel> get items => _items;
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

      final Map<String, dynamic> data = jsonDecode(res.body);
      // final List<dynamic> lists = data['curated_lists'];
      final lists = List<Map<String, dynamic>>.from(data['curated_lists']);

      lists.forEach((list) {
        _items.add(DiscoverPodcastsModel.fromJson(list));
      });

      _hasNextPage = data['has_next'];
      _page = _page + 1;
      notifyListeners();
    } catch (e) {
      setLoading(false);
      // throw e;
      print(e);
    }
  }
}
