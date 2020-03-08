import 'package:flutter/material.dart';
import 'package:ui_app/models/items.dart';
import 'package:ui_app/shared/ui_widget/theme_ui.dart';

class BuildCard extends StatefulWidget {
  final String image;
  final bool full;
  BuildCard({this.image, this.full = false});
  @override
  _BuildCardState createState() => _BuildCardState();
}

class _BuildCardState extends State<BuildCard> {
  List items = Items.items;
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Wrap(
          direction: Axis.vertical,
          // alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 2.0,
          children: <Widget>[
            InkWell(
              child: Container(
                width: _width / 2 - 4,
                height: 200,
                decoration: ThemeUi.decorationBox.copyWith(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/${items[index]['img']}.jpg'),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Positioned(
                        bottom: 0,
                        child: Container(
                          color: ThemeUi.nearlyBlack,
                          height: 30,
                          width: _width / 2 - 4,
                          child: Text(
                            '${items[index]['title']}',
                            style: ThemeUi.title,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      itemCount: items.length,
    );
  }
}
/*
 
    */
