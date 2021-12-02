class CreateCardPayload {
  String front;
  String back;
  String color;

  CreateCardPayload({
    required this.front,
    required this.back,
    this.color = "",
  });

  Map<String, dynamic> toJson() {
    return {
      "front": front,
      "back": back,
      "color": color,
    };
  }
}
