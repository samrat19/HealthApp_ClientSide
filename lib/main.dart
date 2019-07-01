import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:hospitalclient/Outline/homePage.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.red[700],
        seconds: 4,
        imageBackground: AssetImage("asset/logo.png"),
        title: Text("Health Care",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 46.0,
                color: Colors.white,
                )),
        navigateAfterSeconds: HomePage(),
        loaderColor: Colors.white70);
  }
}
