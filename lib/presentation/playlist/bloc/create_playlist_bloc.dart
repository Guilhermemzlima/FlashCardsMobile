import 'package:flashcard/infrastructure/models/create_playlist_payload.dart';
import 'package:flashcard/infrastructure/models/playlist.dart';
import 'package:flashcard/infrastructure/repositories/playlist_repository.dart';

class CreatePlaylistBloc {
  final PlaylistRepository _playlistRepository = PlaylistRepository();

  Future<Playlist> createPlaylist(CreatePlaylistPayload payload) {
    return _playlistRepository.createPlaylist(payload);
  }
}
