import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Explicit
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;


  // Method

Future<void> signOutExit()async{
  await firebaseAuth.signOut().then((response){
    exit(0); //ปิด App
  });


}

  Widget showAppName() {
    return Text(
      'PeeZa',
      style: TextStyle(fontSize: 24.0),
    );
  }

  Widget showLogo() {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget myDrawerMenu() {
    //สไลด์หน้าจอซ้ายขวา
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.orange[400]),
            child: Container(
              child: Column(
                children: <Widget>[showLogo(), showAppName()],
              ),
            ),
          ),
          ListTile(
              leading: Icon(
                Icons.exit_to_app,
                size: 36.0,
              ),
              title: Text(
                'Sign Out & Exit',
                style: TextStyle(fontSize: 18.0),
              ),
              onTap: () {
                signOutExit();
                Navigator.of(context).pop();
              })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
      ),
      body: Text('Body'),
      drawer: myDrawerMenu(),
    );
  }
}
