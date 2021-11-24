import 'package:flashcard/infrastructure/models/deck.dart';
import 'package:flashcard/infrastructure/models/playlist.dart';
import 'package:flashcard/infrastructure/models/response_stream.dart';
import 'package:flashcard/infrastructure/repositories/deck_repository.dart';
import 'package:flashcard/infrastructure/repositories/playlist_repository.dart';

class PlaylistDetailBloc {
  final PlaylistRepository _playlistRepository = PlaylistRepository();
  final DeckRepository _deckRepository = DeckRepository();

  ResponseStream<Playlist> playlistDetail = ResponseStream<Playlist>();

  ResponseStream<List<Deck>> deckList = ResponseStream<List<Deck>>();

  void buildPlaylistById(String playlistId) => playlistDetail
      .handleFuture(_playlistRepository.getPlaylistById(playlistId));

  void buildDeckList(List<String> deckIds) =>
      deckList.handleFuture(_deckRepository.getDeckByIdBatch(deckIds));
}
