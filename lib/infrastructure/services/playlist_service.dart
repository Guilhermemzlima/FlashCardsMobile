import 'package:http/http.dart' show Response;

import 'base_service.dart';

class PlaylistService extends BaseService {
  Future<Response> getPlaylistById(String playlistId) async =>
      await get(path: "flashcards/api/v1/playlists/$playlistId");

  Future<Response> getMyPlaylists() async =>
      await get(path: "flashcards/api/v1/playlists", params: {"limit": "10"});

  Future<Response> getPlaylists() async =>
      await get(path: "flashcards/api/v1/playlists/all", params: {"limit": "10"});
}
