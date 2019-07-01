import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  String notice;
  String notice_id;
  String date;
  String degree;
  Board(this.notice, this.notice_id, this.date, this.degree);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
          child: Card(
        elevation: 50.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
                  child: Container(
              color: Colors.red[800],
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.fromLTRB(12, 30, 12, 30),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text("Dr. "+
                      notice,
                      style: TextStyle(color: Colors.white,
                       fontSize: 25.0,
                       fontWeight: FontWeight.w800
                      ),
                    ),
                  ),
                  Divider(color: Colors.transparent,),
                  FittedBox(
                                      child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.star,color: Colors.yellow,),
                          Text(
                            degree,
                            style: TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Colors.transparent,),
                  Text("Experience : "+notice_id,
                      style:
                          TextStyle(color: Colors.white, fontSize: 15.0)),
                  Divider(color: Colors.transparent,),
                  Text("Available Day : "+
                    date,
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  Divider(),
                  
                ],
              )),
        ),
      ),
    );
  }
}
