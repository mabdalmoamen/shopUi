import 'package:flutter/material.dart';
import 'package:ui_app/authentication/signup.dart';
import 'package:ui_app/screens/accessories_screen.dart';
import 'package:ui_app/screens/electronics_screen.dart';
import 'package:ui_app/screens/hand_made_screen.dart';
import 'package:ui_app/screens/home_screen.dart';
import 'package:ui_app/screens/item.dart';
import 'package:ui_app/screens/sale_screen.dart';
import 'package:ui_app/screens/shopping_cart_screen.dart';

class ThemeUi {
  ThemeUi._();
  static Color notWhite = Color(0xFFEDF0F2);
  static Color nearlyWhite = Color(0xFFFEFEFE);
  static Color white = Color(0xFFFFFFFF);
  static Color nearlyBlack = Color(0xFF212233);
  // static Color nearlyBlack = Color(0xFF213333);
  static Color grey = Color(0xFF3A5160);
  static Color darkGrey = Color(0xFF313A44);
  static Color nearlyBlue = Color(0xFF00B6F0);
  static Color background = Color(0xFFF2F3F8);
  static Color nearlyDarkBlue = Color(0xFF2633C5);

  static Color darkText = Color(0xFF253840);
  static Color hotText = Colors.amber;
  static Color darkerText = Color(0xFF17262A);
  static Color lightText = Color(0xFF4b9972);
  static Color deactivatedText = Color(0xFF767676);
  static Color dismissibleBackground = Color(0xFF364A54);
  static Color chipBackground = Color(0xFFEEF1F3);
  static Color spacer = Color(0xFFF2F2F2);
  static String fontName = 'Oswald-Bold';
  static BoxDecoration decorationBox = BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    color: nearlyBlack,
    boxShadow: [
      BoxShadow(
          color: hotText.withAlpha(70),
          offset: Offset(3.0, 10.0),
          blurRadius: 15.0,
          spreadRadius: 2.2)
    ],
  );
  static BoxDecoration hotDecorationBox = BoxDecoration(
    borderRadius: BorderRadius.circular(50.0),
    color: hotText,
    boxShadow: [
      BoxShadow(
          color: hotText.withAlpha(70),
          offset: Offset(3.0, 10.0),
          blurRadius: 15.0)
    ],
  );
  static InputDecoration inputDecorationBox = InputDecoration(
    icon: Icon(Icons.email),
    hintText: 'Enter a email address',
    labelText: 'Email',
  );

  static TextTheme textTheme = TextTheme(
    display1: display1,
    headline: headline,
    title: title,
    subtitle: subtitle,
    body2: body2,
    body1: body1,
    caption: caption,
  );

  static TextStyle display1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static TextStyle headline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: 20,
    letterSpacing: 0.27,
    color: white,
  );
  static TextStyle hot = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: 18,
    letterSpacing: 0.27,
    color: white,
  );

  static TextStyle title = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: white,
  );

  static TextStyle subtitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static TextStyle body2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static TextStyle body1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static TextStyle caption = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w900,
    fontSize: 15,
    letterSpacing: 0.2,
    color: nearlyWhite,
  );
  static dynamic routes = {
    '/': (context) => SafeArea(child: HomeScreen()),
    '/signup': (context) => Signup(),
    '/shopping-cart': (context) => ShoppingCart(),
    '/electronics': (context) => Electronics(),
    '/accessories': (context) => Accessories(),
    '/hand-made': (context) => SafeArea(child: HandMade()),
    '/sale-of-day': (context) => HaveSale(),
    '/item': (context) => Item(),
  };

  static RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
}
