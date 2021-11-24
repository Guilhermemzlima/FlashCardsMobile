import 'package:flashcard/infrastructure/models/playlist.dart';
import 'package:flashcard/infrastructure/routes/routes.dart';
import 'package:flashcard/presentation/playlist/pages/playlist_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class ImageCardListWidget extends StatelessWidget {
  final List<ImageCardContent> cards;

  const ImageCardListWidget({Key? key, required this.cards}) : super(key: key);

  static fromPlaylists(List<Playlist> playlist, BuildContext context) {
    return ImageCardListWidget(
        cards: playlist
            .map((it) => ImageCardContent(
                imageURL: it.imageURL,
                onTap: () => Navigator.pushNamed(context, playlistDetailRoute,
                    arguments: PlaylistDetailPageArguments(playlistId: it.id))))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 30,
      ),
      child: GridView.count(
          crossAxisCount: 2,
          children: cards
              .map((card) => Container(
                  child: Card(
                      color: mainColor,
                      child: InkWell(
                        onTap: card.onTap,
                        child: SizedBox(
                          width: 300,
                          height: 200,
                          child: Center(
                            child: Image.network(card.imageURL, height: 150),
                          ),
                        ),
                      ))))
              .toList()),
    );
  }
}

class ImageCardContent {
  final String imageURL;
  final Function() onTap;

  ImageCardContent({required this.imageURL, required this.onTap});
}
