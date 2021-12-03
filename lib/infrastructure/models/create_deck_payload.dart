class CreateDeckPayload {
  String name;
  String description;
  String imageURL;
  bool isPrivate;
  List<String> studySuggestions = List.empty();

  CreateDeckPayload(
      {required this.name,
      required this.description,
      this.imageURL = "https://picsum.photos/200/300",
      this.isPrivate = false});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "imageURL": imageURL,
      "isPrivate": isPrivate,
      "studySuggestions": studySuggestions
    };
  }
}
