import 'package:chef_leon_app/radial_menu/radial_menu.dart';
import 'package:chef_leon_app/radial_menu/radial_menu_item.dart';
import 'package:chef_leon_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:chef_leon_app/generated/i18n.dart';

enum MenuOptions { email, facebook, instagram, website }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<RadialMenuState> _menuKey = new GlobalKey<RadialMenuState>();

  final List<RadialMenuItem<MenuOptions>> items = <RadialMenuItem<MenuOptions>>[
    new RadialMenuItem<MenuOptions>(
      value: MenuOptions.email,
      child: const Icon(Icons.email),
    ),
    new RadialMenuItem<MenuOptions>(
      value: MenuOptions.facebook,
      child: const Icon(Icons.email),
    ),
    new RadialMenuItem<MenuOptions>(
      value: MenuOptions.instagram,
      child: const Icon(Icons.beach_access),
    ),
    new RadialMenuItem<MenuOptions>(
      value: MenuOptions.website,
      child: const Icon(Icons.web),
    )
  ];

  void _onItemSelected(MenuOptions value) {}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: new AppBar(
        title: CircleAvatar(
            radius: 25.0,
            backgroundColor: Theme.of(context).primaryColor,
            child: Image.asset(AppConstants.logo_path)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_library),
            onPressed: () => Navigator.of(context).pushNamed("/recipies"),
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            //decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                          radius: 100.0,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: new RadialMenu(
                              key: _menuKey,
                              items: items,
                              onSelected: _onItemSelected,
                              image: Image.asset(AppConstants.logo_path))
                      ),
                      Text(
                        S.of(context).home_welcome_text,
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: Theme.of(context).textTheme.title.fontSize
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
