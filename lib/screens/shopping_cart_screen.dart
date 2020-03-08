import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_app/shared/ui_widget/inner_nav.dart';
import 'package:ui_app/shared/ui_widget/theme_ui.dart';
import 'package:ui_app/shared/widget/build_electronics_full.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Shopping Cart'),
          textTheme: ThemeUi.textTheme,
          backgroundColor: ThemeUi.nearlyBlack,
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.blue[300],
                      ),
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.shoppingCart,
                      size: 35,
                      color: Colors.blue[300],
                    ),
                    color: Colors.white,
                  ),
                  Positioned(
                    top: 8,
                    left: 25,
                    child: Text(
                      '10',
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        body: Wrap(
          children: <Widget>[
            Container(
              height: _height - 120,
              child: BuildElectronics(),
            ),
          ],
        ),
        bottomNavigationBar: BuildInnerNav(),
      ),
    );
  }
}
