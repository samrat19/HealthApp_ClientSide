import 'package:flutter/material.dart';
import 'package:hospitalclient/Model/about.dart';

class About extends StatefulWidget {

  final String dept;

  About(this.dept);

  @override
  _AboutState createState() => _AboutState(this.dept);
}

class _AboutState extends State<About> {

  final String dept;
  _AboutState(this.dept);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.dept),
        backgroundColor: Colors.red[800],
      ),
      backgroundColor: Colors.red[50],
      body: ListView(
        children: <Widget>[
          CustomAbout("Shoili Chowdhury", "181001001181", ''),
          CustomAbout("Debkanta Bhattacharya", "181001101035", ''),
        ],
      ),
    );
  }
}