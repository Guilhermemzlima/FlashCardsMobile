class Deck {
  String id;
  String name;
  String description;
  String imageURL;
  int cardsCount;
  String userid;

  Deck(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageURL,
      required this.cardsCount,
      required this.userid
      });

  static Deck fromJson(Map<String, dynamic> json) => Deck(
      id: json["_id"],
      name: json["name"],
      description: json["description"],
      imageURL: json["imageURL"],
      cardsCount: json["cardsCount"],
      userid: json["userId"]
  );
}
