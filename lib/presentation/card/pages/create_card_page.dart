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

class CreateCardPage extends StatefulWidget {
  final CreateDeckBloc bloc = CreateDeckBloc();

  @override
  _CreateCardState createState() => _CreateCardState();
}

class _CreateCardState extends State<CreateCardPage> {
  late final CreateDeckBloc _bloc;
  final TextEditingController _controllerFront = TextEditingController();
  final TextEditingController _controllerBack = TextEditingController();
  final List colors = [
    hoverMainColor,
    red,
    orange,
    yellow,
    lightGreen,
    green,
    blue,
    purple,
    pink
  ];
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
      appBar: MyAppBar("Criar Card"),
      body: ValueListenableBuilder<bool>(
          valueListenable: submitted,
          builder: (context, value, widget) =>
              value ? Loader() : _createPlaylistForm()),
    );
  }

  Widget _createPlaylistForm() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            MyForm(
                _controllerFront, 'FRENTE', 6, 300, TextInputType.text, true),
            MyForm(_controllerBack, 'VERSO', 6, 300, TextInputType.text, true),
            Align(
              alignment: Alignment.centerLeft,
              child: Titles('Cor do cartão'),
            ),
            Row(
              children: List.generate(colors.length,
                  (index) => Flexible(fit: FlexFit.tight,child: SquareColorPicker(colors[index]))),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: ElevatedButton(
                onPressed: () => _createCard(),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Text("CRIAR",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(black)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _createCard() {
    final String cardFront = _controllerFront.text;
    final String cardBack = _controllerBack.text;
    if ((cardFront != '') && cardBack != '') {
      CreateDeckPayload payload = CreateDeckPayload(
        name: cardFront,
        description: cardBack,
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
