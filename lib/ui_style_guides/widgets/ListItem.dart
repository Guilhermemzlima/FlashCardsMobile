import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class ListItem extends StatelessWidget {
  final ListItemProperties _items;

  ListItem(this._items);

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
                Text(_items.titleItem, style: titleStyleBold),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: _items.isVerifiedItem == true ? Icon(Icons.verified) : null,
                )
              ]),
              subtitle: Text(_items.subTitleItem, style: subTitleStyle),
              trailing: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
            ),
          ),
        ));
  }
}

class ListItemProperties {
  final String titleItem;
  final String subTitleItem;
  final bool isVerifiedItem;

  ListItemProperties(this.titleItem, this.subTitleItem, this.isVerifiedItem);

  @override
  String toString() {
    return 'Items{titleItem: $titleItem, subTitleItem: $subTitleItem, isVerifiedItem: $isVerifiedItem}';
  }
}
