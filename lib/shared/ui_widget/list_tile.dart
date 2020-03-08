import 'package:flutter/material.dart';
import 'package:ui_app/shared/ui_widget/theme_ui.dart';

class BuildListTile extends StatelessWidget {
  final String title;
  final String desc;
  final Widget icon;
  final dir;
  final Function func;

  BuildListTile(this.title,
      {this.func, this.icon, this.desc = '', this.dir = TextAlign.left});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: func,
      title: Text(
        title,
        textScaleFactor: 1,
        textAlign: dir,
        style: ThemeUi.headline,
      ),
      subtitle: Text(
        desc,
        style: ThemeUi.caption,
      ),
      trailing: icon,
    );
  }
}
