import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:ui_app/services/main.dart';
import 'package:ui_app/shared/ui_widget/theme_ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final MainService _model = MainService();
    return ScopedModel<MainService>(
      model: _model,
      child: MaterialApp(
        theme: ThemeData(
          textTheme: ThemeUi.textTheme,
//        platform: TargetPlatform.android,
        ),
        routes: ThemeUi.routes,
      ),
    );
  }
}
