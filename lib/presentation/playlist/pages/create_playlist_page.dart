import 'package:flashcard/infrastructure/models/create_playlist_payload.dart';
import 'package:flashcard/infrastructure/models/playlist.dart';
import 'package:flashcard/infrastructure/routes/routes.dart';
import 'package:flashcard/presentation/playlist/bloc/create_playlist_bloc.dart';
import 'package:flashcard/presentation/playlist/pages/playlist_detail_page.dart';
import 'package:flashcard/ui_style_guides/widgets/image_picker.dart';
import 'package:flashcard/ui_style_guides/widgets/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class CreatePlaylistPage extends StatefulWidget {
  final CreatePlaylistBloc bloc = CreatePlaylistBloc();

  @override
  _CreatePlaylistState createState() => _CreatePlaylistState();
}

class _CreatePlaylistState extends State<CreatePlaylistPage> {
  late final CreatePlaylistBloc _bloc;
  final TextEditingController _controllerPlaylistName = TextEditingController();
  final TextEditingController _controllerPlaylistDescription =
      TextEditingController();
  ValueNotifier<bool> submited = ValueNotifier(false);
  ValueNotifier<String> imageURL = ValueNotifier(
      "https://storage.googleapis.com/flashcard-images/img_placeholder.png");

  @override
  void initState() {
    super.initState();
    _bloc = widget.bloc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      backgroundColor: backgroundColor,
      appBar: MyAppBar("Criar Playlist"),
      body: ValueListenableBuilder<bool>(
          valueListenable: submited,
          builder: (context, value, widget) =>
              value ? Loader() : _createPlaylistForm()),
    );
  }

  Widget _createPlaylistForm() {
    return Padding(
      padding: EdgeInsets.all(30),
      child: ListView(
        children: [
          Center(child: ImagePicker(imageURL: imageURL)),
          MyForm(_controllerPlaylistName, 'NOME DA PLAYLIST', 1, 30,
              TextInputType.text, false),
          MyForm(_controllerPlaylistDescription, 'DESCRIÇÃO(opcional)', 6, 150,
              TextInputType.text, true),
          ElevatedButton(
            child: Text("Confirmar"),
            onPressed: () => _createPlaylist(),
          )
        ],
      ),
    );
  }

  void _createPlaylist() {
    final String playlistName = _controllerPlaylistName.text;
    final String playlistDescription = _controllerPlaylistDescription.text;
    if ((playlistName != '') && playlistDescription != '') {
      CreatePlaylistPayload payload = CreatePlaylistPayload(
          name: playlistName, description: playlistDescription, imageURL: imageURL.value);
      Future<Playlist> responseFuture = _bloc.createPlaylist(payload);
      submited.value = true;
      responseFuture.then((value) {
        Navigator.pop(context);
        Navigator.pushNamed(context, playlistDetailRoute,
            arguments: PlaylistDetailPageArguments(playlistId: value.id));
      });
    }
  }
}
