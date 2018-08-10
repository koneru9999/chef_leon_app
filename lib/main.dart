import 'package:chef_leon_app/generated/i18n.dart';
import 'package:chef_leon_app/pages/home_screen.dart';
import 'package:chef_leon_app/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:chef_leon_app/pages/book/recipies_list.dart';
import 'package:chef_leon_app/pages/book/data.dart';
import 'package:chef_leon_app/pages/book/recipe_detail.dart';
import 'package:chef_leon_app/pages/gallery.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => new HomeScreen(),
  "/recipies": (BuildContext context) => new RecipiesList(),
  "/gallery": (BuildContext context) => new Gallery()
};

void main() => runApp(new ChefLeonApp());

class ChefLeonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.brown, accentColor: Color(0xFFFDE9B6)),
      home: new SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: routes,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback:
          S.delegate.resolution(fallback: Locale("en", "")),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }

  ///Generate parameterized route --> e.g: recipies/detail/{id}
  generateRoute(RouteSettings settings) {
    if (settings.name.startsWith("recipies/detail/")) {
      final path = settings.name.split('/');
      final id = int.parse(path[2]);

      Recipe book = recipies.firstWhere((it) => it.id == id);
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => RecipeDetail(book),
      );
    }
  }
}
