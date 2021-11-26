class SearchResult {
  String id;
  String name;
  String imageURL;
  SearchResultType type;

  SearchResult({required this.id, required this.name, required this.type, required this.imageURL});

  static SearchResult fromJson(Map<String, dynamic> json) => SearchResult(
      id: json["_id"],
      name: json["name"],
      imageURL: json["imageURL"],
      type: json.containsKey("cardsCount")
          ? SearchResultType.DECK
          : SearchResultType.PLAYLIST);
}

enum SearchResultType { PLAYLIST, DECK }
