import 'package:flashcard/infrastructure/models/deck.dart';
import 'package:flashcard/infrastructure/models/playlist.dart';
import 'package:flashcard/infrastructure/models/response_stream.dart';
import 'package:flashcard/infrastructure/repositories/deck_repository.dart';
import 'package:flashcard/infrastructure/repositories/playlist_repository.dart';

class LibraryBloc {
  final DeckRepository _deckRepository = DeckRepository();
  final PlaylistRepository _playlistRepository = PlaylistRepository();

  ResponseStream<List<Deck>> myDeckList = ResponseStream<List<Deck>>();

  ResponseStream<List<Playlist>> myPlaylists = ResponseStream<List<Playlist>>();

  void buildDeckList() =>
      myDeckList.handleFuture(_deckRepository.getMyDeckList());

  void buildPlaylists() =>
      myPlaylists.handleFuture(_playlistRepository.getPlaylistList());
}
