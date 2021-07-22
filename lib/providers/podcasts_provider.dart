import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:podcast_player_app/models/podcast_model.dart';

final String apiKey = dotenv.env['LISTEN_NOTES_API_KEY']!;
const BASE_URL = 'https://listen-api.listennotes.com/api/v2';

class PodcastsProvider with ChangeNotifier {
  List<PodcastPreviewModel> _items = [];
  bool _loading = false;
  int _page = 1;
  bool _hasNextPage = true;

  List<PodcastPreviewModel> get items => _items;
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

      final res = await http.get(
        Uri.parse(BASE_URL + '/best_podcasts?page=$_page'),
        headers: {
          'X-ListenAPI-Key': apiKey,
        },
      );
      final data = jsonDecode(res.body) as Map<String, dynamic>;
      final List<dynamic> podcasts = data['podcasts'];

      podcasts.forEach((podcast) {
        _items.add(PodcastPreviewModel.fromJson(podcast));
      });

      _hasNextPage = data['has_next'];
      _page = _page + 1;

      setLoading(false);
    } catch (e) {
      setLoading(false);
      throw e;
    }
  }
}
