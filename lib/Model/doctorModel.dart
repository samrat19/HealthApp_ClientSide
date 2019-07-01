import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'package:hospitalclient/Model/board.dart';
import 'package:hospitalclient/Outline/patientPage.dart';

class NoticeBoard extends StatefulWidget {
  String dept;
  NoticeBoard(this.dept);

  @override
  _NoticeBoardState createState() => _NoticeBoardState(this.dept);
}

class _NoticeBoardState extends State<NoticeBoard> {
  CollectionReference collectionReference;
  List<DocumentSnapshot> noticeList;
  StreamSubscription<QuerySnapshot> subscription;

  String dept;
  _NoticeBoardState(this.dept);

  @override
  void initState() {
    super.initState();
    collectionReference = Firestore.instance.collection(this.dept);
    subscription = collectionReference.snapshots().listen((data) {
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
        body: Container(
            child: noticeList != null
                ? Container(
                    child: ListView.builder(
                      itemCount: noticeList.length,
                      itemBuilder: (_, i) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.of(context)
                             .push(MaterialPageRoute (builder: (_)=>PatientDetail(
                               (noticeList[i])["name"], 
                               (noticeList[i])["days"]
                              )));
                          },
                          child: Board((noticeList[i])["name"],
                              (noticeList[i])["expo"], (noticeList[i])["days"]),
                        );
                      },
                    ),
                  )
                : Container(
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    ),
                  )));
  }
}
