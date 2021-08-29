import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:podcast_player_app/apiClient.dart';

final ApiClient _client =
    ApiClient('https://listen-api.listennotes.com/api/v2', {
  'X-ListenAPI-Key': dotenv.env['LISTEN_NOTES_API_KEY']!,
});

abstract class ListenNotesApi {
  static Future<http.Response> fetchPodcasts(int page) {
    return _client.get(Uri.parse('/best_podcasts?page=$page'));
  }

  static Future<http.Response> fetchDiscoverPodcasts(int page) {
    return _client.get(Uri.parse('/curated_podcasts?page=$page'));
  }

  static Future<http.Response> searchPodcasts(String searchTerm) {
    return _client.get(Uri.parse('/typeahead?q=$searchTerm&show_podcasts=1'));
  }
}
