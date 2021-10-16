import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class ListItem extends StatelessWidget {
  final String titulo;
  final String subTitulo;

  ListItem(this.titulo, this.subTitulo);

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
          onTap: () {
            print('List tapped.');
          },
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListTile(
              leading: FlutterLogo(size: 35),
              title: Row(children: [
                Text(titulo, style: titleStyleBold),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(Icons.verified),
                )
              ]),
              subtitle: Text(subTitulo, style: subTitleStyle),
              trailing: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
            ),
          ),
        ));
  }
}
