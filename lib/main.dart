import 'package:flutter/material.dart';
import 'package:quizzler/landing_page.dart';

import 'dart:io';
//TODO: Step 2 - Import the rFlutter_Alert package here.
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'quiz_brain.dart';

import 'homepage.dart';
import 'models/appstate.dart';
import 'models/theme.dart';
import 'package:frideos/frideos.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  AppState appState;

  @override
  void initState() {
    super.initState();
    appState = AppState();
  }

  @override
  Widget build(BuildContext context) {
    return AppStateProvider<AppState>(
      appState: appState,
      child: MaterialPage(),
    );
  }
}

class MaterialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = AppStateProvider.of<AppState>(context).currentTheme;

    return ValueBuilder<MyTheme>(
        stream: theme,
        builder: (context, snapshot) {
          return MaterialApp(
              title: "Manners Matters",
              debugShowCheckedModeBanner: false,
              theme: _buildThemeData(snapshot.data),
              home: LandingPage());
        });
  }

  _buildThemeData(MyTheme appTheme) {
    return ThemeData(
      brightness: appTheme.brightness,
      backgroundColor: appTheme.backgroundColor,
      scaffoldBackgroundColor: appTheme.scaffoldBackgroundColor,
      primaryColor: appTheme.primaryColor,
      primaryColorBrightness: appTheme.primaryColorBrightness,
      accentColor: appTheme.accentColor,
    );
  }
}
