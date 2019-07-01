import 'package:flutter/material.dart';
import 'package:hospitalclient/Drawerpages/about.dart';
import 'package:hospitalclient/Drawerpages/departments.dart';
import 'package:hospitalclient/Drawerpages/hospitality.dart';
import 'package:hospitalclient/Drawerpages/location.dart';
import 'package:hospitalclient/Drawerpages/partners.dart';

class CustomDrawer extends StatelessWidget {
  static const _fontSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: ListView(
        children: <Widget>[
          Container(
            color: Colors.grey[800],
            height: 200.0,
          ),
          ListTile(
            title: Text(
              "Departments",
              style: TextStyle(
                fontSize: _fontSize,
                color: Colors.white
              ),
            ),
            leading: Icon(Icons.chevron_right, color: Colors.white),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Department("Departments")));
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              "Hospitality",
              style: TextStyle(
                  fontSize: _fontSize,
                  color: Colors.white
              ),
            ),
            leading: Icon(Icons.chevron_right, color: Colors.white,),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Hospitality("Hospitality")));
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              "Location",
              style: TextStyle(
                  fontSize: _fontSize,
                  color: Colors.white
              ),
            ),
            leading: Icon(Icons.chevron_right, color: Colors.white,),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Location("Location")));
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              "Parters",
              style: TextStyle(
                  fontSize: _fontSize,
                  color: Colors.white
              ),
            ),
            leading: Icon(Icons.chevron_right, color: Colors.white,),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Branches("Partners")));
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              "About",
              style: TextStyle(
                  fontSize: _fontSize,
                  color: Colors.white
              ),
            ),
            leading: Icon(Icons.chevron_right, color: Colors.white,),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => About("About US")));
            },
          )
        ],
      ),
    );
  }
}