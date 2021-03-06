import 'package:flutter/material.dart';
import 'package:hospitalclient/Model/customDrawyer.dart';
import 'package:hospitalclient/Model/doctorModel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController tabController;

  Future<bool> _Onbackpressed(){
    return showDialog(
        context: context,
      builder: (Context)=>AlertDialog(
        title:Text("Do you want to close the app?",style: TextStyle(color:Colors.red,fontSize: 20.0),),
        actions: <Widget>[
          FlatButton(
            onPressed: ()=> Navigator.pop(context,true),
            child: Text("Yes",style: TextStyle(color: Colors.redAccent,fontSize: 16.0,fontWeight: FontWeight.bold),),
          ),
          FlatButton(
              onPressed: ()=> Navigator.pop(context,false),
              child: Text("No",style: TextStyle(color: Colors.redAccent,fontSize: 16.0),),
          ),
        ],
      )
    );
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Material(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[800],
            title: Text("Healthcare"),
          ),
          drawer: Drawer(
            child: CustomDrawer(),
          ),
          body: Container(
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                NoticeBoard("Cardiology"),
                NoticeBoard("Orthopedic"),
                NoticeBoard("Opthalmology"),
                NoticeBoard("Nurology"),
                NoticeBoard("Darmatology")
              ],
            ),
          ),
          bottomNavigationBar: Container(
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.red,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.favorite, color: Colors.red,),
                  child: Text("Cardiology",style:TextStyle(color: Colors.grey[900])),
                ),
                Tab(
                  icon: Icon(Icons.accessible_forward, color: Colors.red,),
                  child: Text("Orthopaedics",style:TextStyle(color: Colors.grey[900])),
                ),
                Tab(
                  icon: Icon(Icons.remove_red_eye, color: Colors.red,),
                  child: Text("Ophthalmology",style:TextStyle(color: Colors.grey[900])),
                ),
                Tab(
                  icon: Icon(Icons.face, color: Colors.red,),
                  child: Text("Neurology",style:TextStyle(color: Colors.grey[900])),
                ),
                Tab(
                  child: Text("Dermatology",style:TextStyle(color: Colors.grey[900])),
                  icon: Icon(Icons.content_cut, color: Colors.red,),
                )
              ],
            ),
          ),
        ),
      ), onWillPop: _Onbackpressed,
    );
  }
}