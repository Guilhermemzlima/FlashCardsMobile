import 'dart:convert';

import 'package:flashcard/infrastructure/models/playlist.dart';
import 'package:flashcard/infrastructure/services/playlist_service.dart';
import 'package:http/http.dart';

class PlaylistRepository {
  final PlaylistService _playlistService = PlaylistService();

  Future<Playlist> getPlaylistById(String deckId) async {
    Response response = await _playlistService.getPlaylistById(deckId);
    return Playlist.fromJson(json.decode(response.body));
  }

  Future<List<Playlist>> getPlaylistList() async {
    Response response = await _playlistService.getMyPlaylists();
    return _parsePlaylistList(response);
  }

  List<Playlist> _parsePlaylistList(Response response) {
    List body = json.decode(response.body);
    return body.map((e) => Playlist.fromJson(e)).toList();
  }
}
