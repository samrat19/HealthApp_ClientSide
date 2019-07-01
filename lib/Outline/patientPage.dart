import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

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
  TextEditingController patientSyntom = TextEditingController();
  TextEditingController appointmentDay = TextEditingController();

  CollectionReference collectionReference;
  DocumentReference databaseRefference;
  List<DocumentSnapshot> patientDetails;
  StreamSubscription<QuerySnapshot> streamSubscription;

  String pName;
  String pSyn;
  String dName;
  String pDay;

  // @override
  // void initState() {
  //   super.initState();
  //   collectionReference = Firestore.instance.collection("Appointments");
  //   streamSubscription = collectionReference.snapshots().listen((data) {
  //     setState(() {
  //       patientDetails = data.documents;
  //     });
  //   });
  // }

  @override
  void dispose() {
    super.dispose();
    streamSubscription.cancel();
  }

  void uploadnotice() {
    pName = patientName.text;
    pSyn = patientSyntom.text;
    dName = this.d_name;
    pDay = appointmentDay.text;

    Map<String, String> patientData = <String, String>{
      "patient_name": pName,
      "patient_syntom": pSyn,
      "doctor_name": dName,
      "appointment_day": pDay,
    };
    DocumentReference user =
        Firestore.instance.document("AppointmentData/$pName+$pDay");
    user.setData(patientData).whenComplete(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient Regestration"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.red,
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
                  Divider(height: 100.0,),
                  Column(
                    children: <Widget>[
                      TextFormField(
                        controller: patientName,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Patient Name",
                            hintText: "Enter the patient Name",
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
                            labelText: "Patient Syntom",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                    style: BorderStyle.solid, width: 4.0))),
                      ),
                      Divider(),
                      TextFormField(
                        controller: appointmentDay,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Choose Day",
                            hintText: "choose from ${this.doc_date}",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                    style: BorderStyle.solid, width: 4.0))),
                      ),
                      Divider(),
                      Divider(height: 100.0,),
                      RaisedButton(
                        child: Text("Upload"),
                        onPressed: uploadnotice
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
