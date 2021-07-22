import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class _ApiClient extends http.BaseClient {
  Map<String, String>? _defaultHeaders;
  final String _baseUrl;
  final http.Client _httpClient = http.Client();

  _ApiClient(this._baseUrl, this._defaultHeaders);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _httpClient.send(request);
  }

  @override
  Future<Response> get(url, {Map<String, String>? headers}) {
    return _httpClient.get(_mergedUrl(url), headers: _mergedHeaders(headers));
  }

  @override
  Future<Response> post(
    url, {
    Map<String, String>? headers,
    dynamic body,
    Encoding? encoding,
  }) {
    return _httpClient.post(_mergedUrl(url),
        headers: _mergedHeaders(headers), body: body, encoding: encoding);
  }

  Map<String, String> _mergedHeaders(Map<String, String>? headers) =>
      {...?_defaultHeaders, ...?headers};

  Uri _mergedUrl(Uri url) => Uri.parse(_baseUrl + url.toString());
}

final listenNotesApi = _ApiClient('https://listen-api.listennotes.com/api/v2', {
  'X-ListenAPI-Key': dotenv.env['LISTEN_NOTES_API_KEY']!,
});
