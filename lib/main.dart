import 'package:client/tools/board.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

void main() => runApp(MaterialApp(home: NoticeBoard(),));

class NoticeBoard extends StatefulWidget {
  @override
  _NoticeBoardState createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {

  CollectionReference collectionReference;
  List<DocumentSnapshot> noticeList;
  StreamSubscription<QuerySnapshot> subscription; 

  @override
  void initState() {
    super.initState();
    collectionReference = Firestore.instance.collection("Notice_Board");
    subscription = collectionReference.snapshots().listen((data){
      setState(() {
       noticeList = data.documents; 
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notice Board"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: noticeList!=null?Container(
          child: ListView.builder(
            itemCount: noticeList.length,
            itemBuilder: (_,i){
              return Board((noticeList[i])["notice"],
              (noticeList[i])["notice_id"],
              (noticeList[i])["date"]);
            },
          ),
        ):Container(
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          ),
        )
      )
    );
  }
}
