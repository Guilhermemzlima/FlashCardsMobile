import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';
import 'package:shimmer/shimmer.dart';

class SuggestedPlaylistCard extends StatelessWidget {
  final String imageURL;
  final Function() onTap;

  const SuggestedPlaylistCard(
      {Key? key, required this.imageURL, required this.onTap})
      : super(key: key);

  static Widget getShimmer() {
    return Shimmer.fromColors(
      child: SuggestedPlaylistCard(
        onTap: () => null,
        imageURL: "",
      ),
      baseColor: mainColor,
      highlightColor: hoverMainColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          hoverColor: hoverMainColor,
          splashColor: actionMainColor,
          onTap: onTap,
          child: SizedBox(
            width: 280,
            height: 280,
            child: Center(
              child: Image.network(imageURL, width: 200, height: 200,),
            ),
          ),
        ));
  }
}
