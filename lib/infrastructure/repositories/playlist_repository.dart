import 'dart:convert';

import 'package:flashcard/infrastructure/models/create_playlist_payload.dart';
import 'package:flashcard/infrastructure/models/playlist.dart';
import 'package:flashcard/infrastructure/services/playlist_service.dart';
import 'package:http/http.dart';

class PlaylistRepository {
  final PlaylistService _playlistService = PlaylistService();

  Future<Playlist> getPlaylistById(String deckId) async {
    Response response = await _playlistService.getPlaylistById(deckId);
    return Playlist.fromJson(json.decode(response.body));
  }

  Future<List<Playlist>> getMyPlaylistList() async {
    Response response = await _playlistService.getMyPlaylists();
    return _parsePlaylistList(response);
  }

  Future<List<Playlist>> getPlaylistList() async {
    Response response = await _playlistService.getPlaylists();
    return _parsePlaylistList(response);
  }

  Future<Playlist> createPlaylist(CreatePlaylistPayload payload) async {
    Response response = await _playlistService.createPlaylist(payload);
    return Playlist.fromJson(json.decode(response.body));
  }

  List<Playlist> _parsePlaylistList(Response response) {
    List body = json.decode(response.body);
    return body.map((e) => Playlist.fromJson(e)).toList();
  }
}
