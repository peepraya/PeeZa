import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pee_tpa/screens/show_list-video.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Explicit
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String nameString = '';

  // Method
  Widget showTitleAppBar() {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Text('My Service'),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              'Login by $nameString',
              style: TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    findName();
  }

  Future<void> findName() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    setState(() {
      nameString = firebaseUser.displayName;
    });
    print('name = $nameString');
  }

  Future<void> signOutExit() async {
    await firebaseAuth.signOut().then((response) {
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
              Icons.android,
              size: 36.0,
            ),
            title: Text(
              'QR Code',
              style: TextStyle(fontSize: 18.0),
            ),onTap: (){
              print('Click QR Code');
            },
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
        title: showTitleAppBar(),
        backgroundColor: Colors.orange[900],
      ),
      body: ShowListVideo(),
      drawer: myDrawerMenu(),
    );
  }
}
