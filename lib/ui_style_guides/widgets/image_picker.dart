import 'package:flashcard/ui_style_guides/my_colors/my_colors.dart';
import 'package:flutter/material.dart';

class ImagePicker extends StatelessWidget {
  final ValueNotifier<String> imageURL;

  final List<String> _images = [
    "https://storage.googleapis.com/flashcard-images/img_placeholder.png",
    "https://storage.googleapis.com/flashcard-images/jslogo.png"
  ];

  ImagePicker({Key? key, required this.imageURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Card(
            color: mainColor,
            child: InkWell(
              onTap: () => _showMyDialog(context),
              child: SizedBox(
                width: 100,
                height: 100,
                child: Center(
                  child: ValueListenableBuilder<String>(
                    valueListenable: imageURL,
                    builder: (context, value, widget) =>
                        Image.network(value, height: 50, width: 50),
                  ),
                ),
              ),
            )));
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Escolha seu ícone'),
          content: Container(
            width: 300,
            height: 220,
            child: GridView.count(
              physics: ScrollPhysics(),
              crossAxisCount: 5,
              children: _images
                  .map((image) => _buildImageCard(context, image))
                  .toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildImageCard(BuildContext context, String image) {
    return Card(
        color: mainColor,
        child: InkWell(
          onTap: () {
            imageURL.value = image;
            Navigator.pop(context);
          },
          child: SizedBox(
            width: 40,
            height: 40,
            child: Center(
              child: Image.network(image, height: 30, width: 30),
            ),
          ),
        ));
  }
}
