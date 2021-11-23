import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

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
              leading: Image.network(imageURL, height: 30, width: 30),
              title: Row(children: [
                Text(title, style: titleStyleBold),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: isVerified == true ? Icon(Icons.verified) : null,
                )
              ]),
              subtitle: Text(subTitle, style: subTitleStyle),
              trailing: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
            ),
          ),
        ));
  }
}
