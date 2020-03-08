import 'package:flutter/material.dart';
import 'package:ui_app/models/items.dart';
import 'package:ui_app/shared/ui_widget/theme_ui.dart';

class BuildListView extends StatefulWidget {
  final String image;
  final String title;
  BuildListView({this.image, this.title});
  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  final items = Items.items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        EdgeInsets padding = index == 0
            ? EdgeInsets.only(left: 20.0, right: 10.0, top: 4.0, bottom: 30.0)
            : EdgeInsets.only(left: 10.0, right: 10.0, top: 4.0, bottom: 30.0);

        return Padding(
          padding: padding,
          child: InkWell(
            onTap: () => Navigator.of(context).pushNamed('/item'),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.lightGreen,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ],
                image: DecorationImage(
                  image: ExactAssetImage('assets/${items[index]['img']}.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),
//                                    height: 200.0,
              width: 200.0,
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
                            '${items[index]['title']}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: ThemeUi.hotDecorationBox,
                      // height: 30.0,
                      child: items[index]['sale'] != null
                          ? Text(
                              '${items[index]['sale']}',
                              style: ThemeUi.hot,
                            )
                          : SizedBox(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
    );
  }
}
