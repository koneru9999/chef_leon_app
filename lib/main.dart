import 'package:chef_leon_app/generated/i18n.dart';
import 'package:chef_leon_app/pages/home_screen.dart';
import 'package:chef_leon_app/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:chef_leon_app/pages/book/recipies_list.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => new HomeScreen(),
  "/recipies": (BuildContext context) => new RecipiesList()
};

void main() {
  runApp(new MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.brown,
      accentColor: Color(0xFFFDE9B6)
    ),
    home: new SplashScreen(),
    debugShowCheckedModeBanner: false,
    routes: routes,
    localizationsDelegates: [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ],
    supportedLocales: S.delegate.supportedLocales,
    localeResolutionCallback: S.delegate.resolution(fallback: Locale("en", "")),
  ));
}
