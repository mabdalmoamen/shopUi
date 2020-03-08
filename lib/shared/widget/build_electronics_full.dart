import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_app/models/items.dart';
import 'package:ui_app/shared/ui_widget/theme_ui.dart';

class BuildElectronics extends StatefulWidget {
  final String image;
  final bool full;
  BuildElectronics({this.image, this.full = false});
  @override
  _BuildElectronicsState createState() => _BuildElectronicsState();
}

class _BuildElectronicsState extends State<BuildElectronics> {
  List items = Items.items;
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            color: ThemeUi.nearlyWhite,
            padding: EdgeInsets.only(left: 5.0),
            child: Card(
              color: ThemeUi.nearlyBlack,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                decoration: ThemeUi.decorationBox,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      width: _width / 4,
                      child: InkWell(
                        onTap: () => Navigator.of(context).pushNamed('/item'),
                        child: Image.asset(
                          'assets/${items[index]['img']}.jpg',
                          height: 100,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${items[index]['title']}',
                              style: ThemeUi.title,
                            ),
                            Text(
                              '${items[index]['desc']}',
                              style: ThemeUi.caption,
                            ),
                            Text(
                              'EGP :${items[index]['price']}',
                              style: ThemeUi.headline,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: ThemeUi.grey,
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                              ),
                              margin: EdgeInsets.all(0),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: ThemeUi.hotText,
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: FaIcon(
                                        FontAwesomeIcons.minus,
                                        color: ThemeUi.nearlyWhite,
                                      ),
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(12),
                                      alignment: Alignment.center,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: ThemeUi.nearlyWhite,
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                      ),
                                      child: Text('0')),
                                  Container(
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: ThemeUi.hotText,
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: FaIcon(
                                        FontAwesomeIcons.plus,
                                        color: ThemeUi.nearlyWhite,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
/*
InkWell(
                    onTap: () => {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: ThemeUi.nearlyWhite,
                        boxShadow: [
                          BoxShadow(
                              color: ThemeUi.nearlyBlack.withAlpha(70),
                              offset: const Offset(3.0, 10.0),
                              blurRadius: 15.0)
                        ],
                        image: DecorationImage(
                          image: ExactAssetImage(
                              'assets/${items[index]['img']}.jpg'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      height: _height / 2,
                      width: _width,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              decoration: ThemeUi.decorationBox,
                              height: 30.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '${items[index]['title']}',
                                    style: ThemeUi.title,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          widget.full
                              ? Positioned(
                                  top: 0,
                                  child: Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: ThemeUi.hotDecorationBox,
                                    child: Row(children: <Widget>[
                                      Text(
                                        '${items[index]['price']} EGP',
                                        style: ThemeUi.title,
                                      ),
                                    ]),
                                  ),
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                  ),
    */
