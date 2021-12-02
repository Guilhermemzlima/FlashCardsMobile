import 'package:flashcard/infrastructure/models/deck.dart';
import 'package:flashcard/infrastructure/models/playlist.dart';
import 'package:flashcard/infrastructure/models/response_stream.dart';
import 'package:flashcard/infrastructure/models/search_result.dart';
import 'package:flashcard/infrastructure/repositories/deck_repository.dart';
import 'package:flashcard/infrastructure/repositories/search_repository.dart';

class AddDeckToPlaylistBloc {
  final DeckRepository _deckRepository = DeckRepository();

  ResponseStream<List<Deck>> decksResult = ResponseStream<List<Deck>>();

  void searchDecks(String query) =>
      decksResult.handleFuture(_deckRepository.searchDecks(query));

  void buildInitialDeckList() =>
      decksResult.handleFuture(_deckRepository.getPopularDecks());

  Future<Playlist> addDeckToPlaylist(String playlistId, String deckId) =>
      _deckRepository.addDeckToPlaylist(playlistId, deckId);
}
