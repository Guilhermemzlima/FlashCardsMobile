class Playlist {
  String id;
  String name;
  String description;
  String imageURL;
  List<String>? decks;

  Playlist(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageURL,
      this.decks});

  static Playlist fromJson(Map<String, dynamic> json) {
    List? decks = json["decks"];
    return Playlist(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        imageURL: json["imageURL"],
        decks: decks?.map((it) => it as String).toList());
  }
}
