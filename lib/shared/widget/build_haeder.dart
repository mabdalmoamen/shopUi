import 'package:flutter/material.dart';
import 'package:ui_app/shared/ui_widget/theme_ui.dart';

class BuildHeader extends StatelessWidget {
  final String title;
  BuildHeader(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: ThemeUi.notWhite,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: ListTile(
          onTap: () => Navigator.of(context).pushNamed(
              '/${(title.toLowerCase().replaceAll(RegExp(' '), '-'))}'),
          title: Text(title),
          trailing: Icon(Icons.more_vert),
        ));
  }
}
/*
 Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Text(
              title,
              style: ThemeUi.title,
            ),
          ),
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: IconButton(
                color: ThemeUi.nearlyBlack,
                onPressed: () => print('See more clicked'),
                icon: Icon(
                  Icons.more_vert,
                  color: ThemeUi.lightText,
                ),
              ),
            ),
          ),
        ],
      ),*/
