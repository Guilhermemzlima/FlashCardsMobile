import 'package:flashcard/infrastructure/models/create_deck_payload.dart';
import 'package:flashcard/infrastructure/models/deck.dart';
import 'package:flashcard/infrastructure/routes/routes.dart';
import 'package:flashcard/presentation/deck/bloc/create_deck_bloc.dart';
import 'package:flashcard/presentation/deck/pages/deck_detail_page.dart';
import 'package:flashcard/ui_style_guides/widgets/image_picker.dart';
import 'package:flashcard/ui_style_guides/widgets/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class CreateDeckPage extends StatefulWidget {
  final CreateDeckBloc bloc = CreateDeckBloc();

  @override
  _CreateDeckState createState() => _CreateDeckState();
}

class _CreateDeckState extends State<CreateDeckPage> {
  late final CreateDeckBloc _bloc;
  final TextEditingController _controllerDeckName = TextEditingController();
  final TextEditingController _controllerDeckDescription =
      TextEditingController();
  ValueNotifier<bool> submitted = ValueNotifier(false);
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
      appBar: MyAppBar("Criar Deck"),
      body: ValueListenableBuilder<bool>(
          valueListenable: submitted,
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
          MyForm(_controllerDeckName, 'NOME DO DECK', 1, 30, TextInputType.text,
              false),
          MyForm(_controllerDeckDescription, 'DESCRIÇÃO', 6, 150,
              TextInputType.text, true),
          ElevatedButton(
            child: Text("Confirmar"),
            onPressed: () => _createDeck(),
          )
        ],
      ),
    );
  }

  void _createDeck() {
    final String deckName = _controllerDeckName.text;
    final String deckDescription = _controllerDeckDescription.text;
    if ((deckName != '') && deckDescription != '') {
      CreateDeckPayload payload = CreateDeckPayload(
        name: deckName,
        description: deckDescription,
        imageURL: imageURL.value,
      );
      Future<Deck> responseFuture = _bloc.createDeck(payload);
      submitted.value = true;
      responseFuture.then((value) {
        Navigator.pop(context);
        Navigator.pushNamed(context, deckDetailRoute,
            arguments: DeckDetailPageArguments(deckId: value.id));
      });
    }
  }
}
