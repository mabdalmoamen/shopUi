import 'package:flutter/material.dart';
import 'package:ui_app/shared/ui_widget/inner_nav.dart';
import 'package:ui_app/shared/ui_widget/theme_ui.dart';
import 'package:ui_app/shared/widget/build_electronics_full.dart';

class Electronics extends StatefulWidget {
  @override
  _ElectronicsState createState() => _ElectronicsState();
}

class _ElectronicsState extends State<Electronics> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Phone , Computers & Laptop'),
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
