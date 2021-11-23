class Deck {
  String id;
  String name;
  String description;
  String imageURL;

  Deck(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageURL});

  static Deck fromJson(Map<String, dynamic> json) => Deck(
      id: json["_id"],
      name: json["name"],
      description: json["description"],
      imageURL: json["imageURL"]);
}
