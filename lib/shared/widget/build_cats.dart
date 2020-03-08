import 'package:flutter/material.dart';
import 'package:ui_app/models/items.dart';
import 'package:ui_app/shared/ui_widget/theme_ui.dart';

class BuildCarts extends StatefulWidget {
  final bool single;
  BuildCarts({this.single = false});
  @override
  _BuildCartsState createState() => _BuildCartsState();
}

class _BuildCartsState extends State<BuildCarts> {
  final items = Items.items;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => Navigator.of(context).pushNamed('/item'),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: ThemeUi.nearlyWhite,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withAlpha(70),
                        offset: const Offset(3.0, 10.0),
                        blurRadius: 15.0)
                  ],
                  image: DecorationImage(
                    image: ExactAssetImage('assets/${items[1]['img']}.jpg'),
                    fit: BoxFit.contain,
                  ),
                ),
                height: 200.0,
                // width: 200.0,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: ThemeUi.decorationBox,
                        height: 30.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '${items[1]['title']}',
                              style: TextStyle(color: Colors.white),
                            ),
                            widget.single
                                ? Container(
                                    child: Column(
                                      children: <Widget>[
                                        Text('test sssss'),
                                        Text('100'),
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: InkWell(
              onTap: () => Navigator.of(context).pushNamed('/item'),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: ThemeUi.nearlyWhite,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withAlpha(70),
                        offset: const Offset(3.0, 10.0),
                        blurRadius: 15.0)
                  ],
                  image: DecorationImage(
                    image: ExactAssetImage('assets/${items[2]['img']}.jpg'),
                    fit: BoxFit.contain,
                  ),
                ),
                height: 200.0,
                // width: 200.0,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: ThemeUi.decorationBox,
                        height: 30.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '${items[2]['title']}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*

    */
