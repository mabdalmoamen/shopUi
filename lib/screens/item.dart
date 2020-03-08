import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_app/models/items.dart';
import 'package:ui_app/shared/ui_widget/inner_nav.dart';
import 'package:ui_app/shared/ui_widget/theme_ui.dart';

class Item extends StatefulWidget {
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    final List items = Items.items;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Single View Items'),
          backgroundColor: ThemeUi.nearlyBlack,
        ),
        body: Container(
          padding: EdgeInsets.all(5),
          color: ThemeUi.grey,
          child: ListView(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '${items[1]['title']}',
                      style: ThemeUi.title,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Price: ${items[1]['price']} EGP ',
                      style: ThemeUi.title,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              Divider(),
              Container(
                child: Image.asset(
                  'assets/${items[2]['img']}.jpg',
                ),
              ),
              Divider(),
              Text(
                '${items[1]['desc']} Add More Discrption For the Product ',
                style: ThemeUi.caption,
              ),
              Divider(),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Made In: Egypt ',
                      style: ThemeUi.caption,
                    ),
                  ),
                  Divider(),
                  Expanded(
                    child: Text(
                      'SiZe: 10 ',
                      style: ThemeUi.caption,
                    ),
                  ),
                ],
              ),
              Divider(),
              Text(
                'Colors: Red , Blue ,White ',
                style: ThemeUi.caption,
              ),
              Divider(),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ThemeUi.hotText,
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.minus,
                          color: ThemeUi.nearlyWhite,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                        padding: EdgeInsets.all(12),
                        alignment: Alignment.center,
                        width: 100,
                        decoration: BoxDecoration(
                          color: ThemeUi.nearlyWhite,
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: Text('0')),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: ThemeUi.hotText,
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.plus,
                          color: ThemeUi.nearlyWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      onPressed: null,
                      child: Text(
                        'See More Products ',
                        style: ThemeUi.headline,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: BuildInnerNav(),
      ),
    );
  }
}
