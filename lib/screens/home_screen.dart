import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_app/shared/ui_widget/inner_nav.dart';
import 'package:ui_app/shared/ui_widget/theme_ui.dart';
import 'package:ui_app/shared/widget/build_cart.dart';
import 'package:ui_app/shared/widget/build_cats.dart';
import 'package:ui_app/shared/widget/build_drawer.dart';
import 'package:ui_app/shared/widget/build_haeder.dart';
import 'package:ui_app/shared/widget/build_list_view.dart';
import 'package:ui_app/shared/widget/build_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bool _isSearch = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              title: _isSearch ? TextField() : Text('Phone-Ui'),
              backgroundColor: ThemeUi.nearlyBlack,
              centerTitle: true,
              actions: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _isSearch
                        ? IconButton(
                            onPressed: () {},
                            icon: FaIcon(FontAwesomeIcons.closedCaptioning),
                          )
                        : IconButton(
                            onPressed: () {},
                            icon: FaIcon(FontAwesomeIcons.search),
                          ),
                    SizedBox(
                      width: 20,
                    ),
                    FaIcon(FontAwesomeIcons.shoppingBag),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
            drawer: BuildDrawer(),
            backgroundColor: ThemeUi.darkGrey,
            body: Container(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ListView(
                      // mainAxisSize: MainAxisSize.max,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 250.0,
                          child: BuildSlider(),
                        ),
                        BuildHeader('Accessories'),
                        Divider(),
                        Container(
                            alignment: Alignment.center,
                            height: 200,
                            child: BuildCard()),
                        Divider(),
                        // BuildCard(),
                        Divider(),
                        BuildHeader('Sale of day'),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 300.0,
                            child: BuildListView()),
                        BuildHeader('Electronics'),
                        BuildCarts(),
                        Divider(),
                        BuildCarts(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BuildInnerNav(),
          ),
        ],
      ),
    );
  }
}
