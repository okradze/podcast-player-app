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

  List<PodcastPreviewModel> get items => _items;
  bool get isLoading => _loading;

  void setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> fetchPodcasts() async {
    try {
      setLoading(true);

      final res = await http.get(
        Uri.parse(BASE_URL + '/best_podcasts?page=1'),
        headers: {
          'X-ListenAPI-Key': apiKey,
        },
      );
      final List<dynamic> podcasts = jsonDecode(res.body)['podcasts'];

      podcasts.forEach((podcast) {
        _items.add(PodcastPreviewModel.fromJson(podcast));
      });

      setLoading(false);
    } catch (e) {
      setLoading(false);
      throw e;
    }
  }
}
