import 'package:flashcard/infrastructure/models/deck.dart';
import 'package:flashcard/infrastructure/models/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';
import 'package:shimmer/shimmer.dart';

class ListItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageURL;
  final bool isVerified;
  final Function() onTap;

  const ListItem(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.imageURL,
      required this.isVerified,
      required this.onTap})
      : super(key: key);

  static ListItem fromDeck(Deck deck, Function() onTap) {
    return ListItem(
      title: deck.name,
      subTitle: "${deck.description} - ${deck.cardsCount} card(s)",
      imageURL: deck.imageURL,
      isVerified: false,
      onTap: onTap,
    );
  }

  static ListItem fromSearchResult(
      SearchResult searchResult, Function() onTap) {
    return ListItem(
      title: searchResult.name,
      subTitle:
          searchResult.type == SearchResultType.DECK ? "Deck" : "Playlist",
      imageURL: searchResult.imageURL,
      isVerified: false,
      onTap: onTap,
    );
  }

  static Widget getShimmer() {
    return Shimmer.fromColors(
        child: ListItem(
            onTap: () => null,
            imageURL:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/1200px-Unofficial_JavaScript_logo_2.svg.png",
            isVerified: false,
            title: "Shimmer",
            subTitle: "This is a shimmer"),
        baseColor: mainColor,
        highlightColor: hoverMainColor);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          hoverColor: hoverMainColor,
          splashColor: actionMainColor,
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(imageURL, height: 40, width: 40),
              title: Row(children: [
                Expanded(child: Text(title, style: titleStyleBold)),
              ]),
              subtitle: Row(
                children: [
                  Expanded(child: Text(subTitle, style: subTitleStyle)),
                ],
              ),
              trailing: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
            ),
          ),
        ));
  }
}
