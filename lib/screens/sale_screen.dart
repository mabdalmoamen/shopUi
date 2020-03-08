import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_app/models/items.dart';
import 'package:ui_app/shared/ui_widget/inner_nav.dart';
import 'package:ui_app/shared/ui_widget/theme_ui.dart';

class HaveSale extends StatefulWidget {
  @override
  _HaveSaleState createState() => _HaveSaleState();
}

class _HaveSaleState extends State<HaveSale> {
  List items = Items.items;
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sale Of Day '),
          backgroundColor: ThemeUi.nearlyBlack,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(1),
              child: InkWell(
                onTap: () => Navigator.of(context).pushNamed('/item'),
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Container(
                        child: Stack(
                          children: <Widget>[
                            Card(
                              child: Container(
                                constraints: BoxConstraints(
                                    minWidth: _width, maxWidth: _width),
                                child: Image.asset(
                                    'assets/${items[index]['img']}.jpg',
                                    width: _width),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: ThemeUi.hotDecorationBox,
                                child: items[index]['sale'] != null
                                    ? Text(
                                        '${items[index]['sale']}',
                                        style: ThemeUi.hot,
                                      )
                                    : SizedBox(),
                              ),
                            ),
                            Positioned(
                              bottom: 50,
                              left: 0,
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                color: ThemeUi.nearlyBlue,
                                child: items[index]['sale'] != null
                                    ? Text(
                                        '${items[index]['title']}',
                                        style: ThemeUi.hot,
                                      )
                                    : SizedBox(),
                              ),
                            ),
                            Positioned(
                              bottom: 50,
                              right: 0,
                              child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: ThemeUi.hotDecorationBox,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        '15',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            letterSpacing: 2.0),
                                      ),
                                      Text(
                                        '${items[index]['price']}',
                                        style: ThemeUi.hot,
                                      ),
                                    ],
                                  )),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: 30,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                decoration: ThemeUi.hotDecorationBox,
                                constraints: BoxConstraints(
                                    minWidth: _width, maxWidth: _width),
                                child: Row(children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Book Now',
                                      style: ThemeUi.hot,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                          child: Image.asset(
                                            'assets/payment/master_card.png',
                                          ),
                                        ),
                                        Expanded(
                                          child: Image.asset(
                                            'assets/payment/cash.png',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      children: <Widget>[
                                        FaIcon(FontAwesomeIcons.phone),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '01002208627',
                                          style: ThemeUi.hot,
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            Divider()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          scrollDirection: Axis.vertical,
          itemCount: items.length,
        ),
        bottomNavigationBar: BuildInnerNav(),
      ),
    );
  }
}
