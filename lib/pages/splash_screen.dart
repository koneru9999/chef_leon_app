import 'dart:async';

import 'package:chef_leon_app/pages/home_screen.dart';
import 'package:chef_leon_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:chef_leon_app/generated/i18n.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: (BuildContext context) => new HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
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
                        backgroundColor: Colors.white,
                        child: Image.asset(AppConstants.logo_path)
                      ),
                      Text(
                        S.of(context).splash_screen_title,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: Theme.of(context).textTheme.headline.fontSize,
                          fontStyle: FontStyle.italic
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
