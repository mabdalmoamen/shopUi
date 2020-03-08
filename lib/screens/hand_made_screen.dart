import 'package:flutter/material.dart';
import 'package:ui_app/shared/ui_widget/inner_nav.dart';
import 'package:ui_app/shared/ui_widget/theme_ui.dart';
import 'package:ui_app/shared/widget/build_electronics_full.dart';

class HandMade extends StatefulWidget {
  @override
  _HandMadeState createState() => _HandMadeState();
}

class _HandMadeState extends State<HandMade> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hand Made'),
          backgroundColor: ThemeUi.nearlyBlack,
        ),
        body: Container(
          alignment: Alignment.center,
          child: BuildElectronics(
            full: true,
          ),
        ),
        bottomNavigationBar: BuildInnerNav(),
      ),
    );
  }
}
