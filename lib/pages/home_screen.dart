import 'package:chef_leon_app/radial_menu/radial_menu.dart';
import 'package:chef_leon_app/radial_menu/radial_menu_item.dart';
import 'package:chef_leon_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:chef_leon_app/generated/i18n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:io';

enum MenuOptions { email, facebook, instagram, website }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Instance of WebView plugin
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  GlobalKey<RadialMenuState> _menuKey = new GlobalKey<RadialMenuState>();

  void _onItemSelected(MenuOptions value) async {
    print(value);
    switch (value) {
      case MenuOptions.email:
        break;
      case MenuOptions.facebook:
        _launchURL(AppConstants.facebook_url);
        break;
      case MenuOptions.instagram:
        _launchURL(AppConstants.instagram_url);
        break;
      case MenuOptions.website:
        _launchURL(AppConstants.website_url);
        break;
    }
  }

  void _launchURL(url) {
    flutterWebviewPlugin.launch(url);
  }

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.close();
  }

  @override
  void dispose() {
    super.dispose();
    flutterWebviewPlugin.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        elevation: AppConstants.app_bar_elevation,
        title: CircleAvatar(
            radius: 25.0,
            backgroundColor: Theme.of(context).primaryColor,
            child: Image(
              image: AssetImage(AppConstants.logo_path),
            )),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_library),
            onPressed: () => Navigator.of(context).pushNamed("/recipies"),
          ),
          IconButton(
            icon: Icon(Icons.collections_bookmark),
            onPressed: () => Navigator.of(context).pushNamed("/gallery"),
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[_getRadialMenu(), _getCaptionText()],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  CircleAvatar _getRadialMenu() {
    return CircleAvatar(
        radius: 100.0,
        backgroundColor: Colors.white,
        child: new RadialMenu(
            key: _menuKey,
            items: _getRadialMenuItems(),
            onSelected: _onItemSelected,
            image: AssetImage(AppConstants.logo_path)));
  }

  _getCaptionText() {
    return Text(
      S.of(context).home_welcome_text,
      style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: Theme.of(context).textTheme.title.fontSize),
    );
  }

  List<RadialMenuItem<MenuOptions>> _getRadialMenuItems() {
    return <RadialMenuItem<MenuOptions>>[
      new RadialMenuItem<MenuOptions>(
        value: MenuOptions.email,
        child: const Icon(Icons.email),
      ),
      new RadialMenuItem<MenuOptions>(
        value: MenuOptions.facebook,
        child: const Icon(FontAwesomeIcons.facebook),
      ),
      new RadialMenuItem<MenuOptions>(
        value: MenuOptions.instagram,
        child: const Icon(FontAwesomeIcons.instagram)
      ),
      new RadialMenuItem<MenuOptions>(
        value: MenuOptions.website,
        child: Platform.isAndroid
            ? const Icon(FontAwesomeIcons.chrome)
            : const Icon(FontAwesomeIcons.safari),
      )
    ];
  }
}
