import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_app/shared/ui_widget/theme_ui.dart';

class BuildInnerNav extends StatefulWidget {
  @override
  _BuildInnerNavState createState() => _BuildInnerNavState();
}

class _BuildInnerNavState extends State<BuildInnerNav> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Expanded(
        child: IconButton(
          color: Colors.lightBlue,
          onPressed: () => Navigator.of(context).pushNamed('/'),
          icon: FaIcon(FontAwesomeIcons.home),
        ),
      ),
      Expanded(
        child: IconButton(
          color: ThemeUi.hotText,
          onPressed: () => Navigator.of(context).pushNamed('/sale-of-day'),
          icon: FaIcon(FontAwesomeIcons.fire),
        ),
      ),
      Expanded(
        child: IconButton(
          onPressed: () => Navigator.of(context).pushNamed('/shopping-cart'),
          icon: FaIcon(FontAwesomeIcons.cartPlus),
        ),
      ),
      Expanded(
        child: IconButton(
          onPressed: null,
          icon: FaIcon(FontAwesomeIcons.bell),
        ),
      ),
      Expanded(
        child: IconButton(
          onPressed: null,
          icon: FaIcon(FontAwesomeIcons.heart),
        ),
      ),
      Expanded(
        child: IconButton(
          onPressed: null,
          icon: Icon(FontAwesomeIcons.signOutAlt),
        ),
      ),
    ]);
  }
}
