import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

class PatientDetail extends StatefulWidget {
  final String d_name;
  final String doc_date;

  PatientDetail(this.d_name, this.doc_date);

  @override
  _PatientDetailState createState() =>
      _PatientDetailState(this.d_name, this.doc_date);
}

class _PatientDetailState extends State<PatientDetail> {
  final String d_name;
  final String doc_date;

  _PatientDetailState(this.d_name, this.doc_date);

  TextEditingController patientName = TextEditingController();
  TextEditingController patientNum = TextEditingController();
  TextEditingController patientSyntom = TextEditingController();

  CollectionReference collectionReference;
  DocumentReference databaseRefference;
  List<DocumentSnapshot> patientDetails;
  StreamSubscription<QuerySnapshot> streamSubscription;

  String pName;
  String pSyn;
  String dName;
  String pDay;
  String numb;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final snackBar = SnackBar(content: Text('Appointment Done'));

  @override
  void dispose() {
    super.dispose();
    streamSubscription.cancel();
  }

  void uploadnotice() {
    pName = patientName.text;
    pSyn = patientSyntom.text;
    dName = this.d_name;

    Map<String, String> patientData = <String, String>{
      "patient_name": pName,
      "patient_syntom": pSyn,
      "doctor_name": dName,
      "appointment_day": this.doc_date,
    };
    DocumentReference user =
        Firestore.instance.document("AppointmentData/$pName+$dName");
    user.setData(patientData).whenComplete(() {});

    SnackBar snackBar = SnackBar(
        content: Text(
            "Your appointment is ready with ${this.d_name} on ${this.doc_date}"));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Appointment",
          style: TextStyle(fontSize: 18.0),
        ),
        backgroundColor: Colors.red[800],
      ),
      body: Container(
          color: Colors.red[800],
          padding: EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            clipBehavior: Clip.hardEdge,
            child: Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.white,
              child: Form(
                child: ListView(
                  children: <Widget>[
                    Text(
                      "Appointment with Dr. ${this.d_name} on ${this.doc_date}",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.red[800]),
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      height: 80.0,
                    ),
                    Column(
                      children: <Widget>[
                        TextFormField(
                          controller: patientName,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Patient's Name",
                              hintText: "Enter the patient's name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      style: BorderStyle.solid, width: 4.0))),
                        ),
                        Divider(),
                        TextFormField(
                          controller: patientSyntom,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Patient's Symptom(s)",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      style: BorderStyle.solid, width: 4.0))),
                        ),
                        Divider(),
                        Divider(
                          height: 100.0,
                        ),
                        RaisedButton(
                            elevation: 80.0,
                            splashColor: Colors.white,
                            color: Colors.red[800],
                            child: Text(
                              "Upload",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: uploadnotice)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
