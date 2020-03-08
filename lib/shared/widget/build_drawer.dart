import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:ui_app/services/main.dart';
import 'package:ui_app/shared/ui_widget/list_tile.dart';
import 'package:ui_app/shared/ui_widget/theme_ui.dart';

class BuildDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _user = FirebaseAuth.instance.currentUser();

    return Drawer(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 30, left: 10, right: 10),
          color: ThemeUi.nearlyBlack,
          child: ListView(
            children: <Widget>[
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: ExactAssetImage('assets/avatar.png', scale: 0.1),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BuildListTile(
                'Mostafa',
                dir: TextAlign.center,
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                child: Container(
                  color: ThemeUi.grey,
                  child: Provider.value(
                    value: MainService,
                    child: ScopedModelDescendant<MainService>(builder:
                        (BuildContext context, Widget child,
                            MainService model) {
                      return ListTile(
                        trailing: FaIcon(
                          FontAwesomeIcons.signInAlt,
                          color: ThemeUi.lightText,
                        ),
                        onTap: () async {
                          dynamic user = await model.signInAnon();
                          if (user != null) {
                            print(user.uid);
                          }
                        },
                        leading: _user != null
                            ? Text(
                                'Sign In Ageust',
                                textAlign: TextAlign.right,
                                style: ThemeUi.headline,
                              )
                            : Text(''),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                child: Container(
                  color: ThemeUi.grey,
                  child: ListTile(
                    trailing: FaIcon(
                      FontAwesomeIcons.registered,
                      color: ThemeUi.lightText,
                    ),
                    onTap: () =>
                        Navigator.of(context).pushReplacementNamed('/signup'),
                    leading: Text(
                      'Sign up',
                      textAlign: TextAlign.right,
                      style: ThemeUi.headline,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Sign In With your Google Account',
                  style: ThemeUi.caption,
                ),
              ),
              SizedBox(height: 4),
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                child: Container(
                  color: ThemeUi.grey,
                  child: ListTile(
                    trailing: FaIcon(
                      FontAwesomeIcons.envelope,
                      color: ThemeUi.lightText,
                    ),
                    onTap: () => print("Contact Preses"),
                    leading: Text(
                      'Ask For help',
                      textAlign: TextAlign.right,
                      style: ThemeUi.headline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: ThemeUi.notWhite,
          padding: EdgeInsets.only(left: 20, right: 10, bottom: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: FaIcon(
                FontAwesomeIcons.facebook,
                color: ThemeUi.nearlyBlack,
                size: 30,
              )),
              SizedBox(width: 20),
              Expanded(
                  child: FaIcon(
                FontAwesomeIcons.whatsapp,
                color: ThemeUi.nearlyBlack,
                size: 30,
              )),
              SizedBox(width: 20),
              Expanded(
                  child: FaIcon(
                FontAwesomeIcons.facebookMessenger,
                color: ThemeUi.nearlyBlack,
                size: 30,
              )),
              SizedBox(width: 20),
              Expanded(
                  child: FaIcon(
                FontAwesomeIcons.twitter,
                color: ThemeUi.nearlyBlack,
                size: 30,
              )),
            ],
          ),
        ),
      ),
      elevation: 0,
    );
  }
}
