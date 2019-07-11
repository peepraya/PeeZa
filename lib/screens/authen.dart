import 'package:flutter/material.dart';
import 'package:pee_tpa/screens/my_service.dart';
import 'package:pee_tpa/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

//ออกแบบหน้าจอ
class _AuthenState extends State<Authen> {
  // Explicit ประกาศ Varible
  final formkey = GlobalKey<FormState>();
  String emailString, passwordString;
  final scaffoldkey = GlobalKey<ScaffoldState>();

  // Method การเอา Statement มารวมกัน

  void mySnackBar(String messageString) {
    SnackBar snackBar = SnackBar(
      content: Text(messageString),
      duration: Duration(seconds: 8), //ตั้งเวลาให้หายเอง
      backgroundColor: Colors.orange[600], //ตั้ง backgroundColor ให้ Snackbar
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
    );
    scaffoldkey.currentState.showSnackBar(snackBar);
  }

  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser != null) {
      moveToService();
    }
  }

  void moveToService() {
    var serviceRoute =
        MaterialPageRoute(builder: (BuildContext context) => MyService());
    Navigator.of(context)
        .pushAndRemoveUntil(serviceRoute, (Route<dynamic> route) => false);
  }

  Widget showLogo() {
    // ดึงรูปภาพ
    return Container(
      // กำหนดความกว้างความสูงของรูปภาพ
      width: 150.0,
      height: 150.0, child: Image.asset('images/logo.png'),
    );
  }

  Widget showText() {
    //การประกาศ Method
    return Text(
      'PeeZa',
      // กำหนด Font
      style: TextStyle(
          fontSize: 30.0, // กำหนดขนาด
          color: Colors.orange[800], // กำหนดสี Font
          fontWeight: FontWeight.bold, // กำหนดความหนา
          fontFamily: 'OpenSans'), // กำหนด Font Family
    );
  }

  Widget emailText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        // กำหนดประเภทของคีย์บอร์ด
        keyboardType: TextInputType.emailAddress,
        //สำหรับให้กรอก
        decoration:
            InputDecoration(labelText: 'Email :', hintText: 'you@email.com'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Fill Email';
          }
        },
        onSaved: (String value) {
          emailString = value;
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true, //เปิดใช้ . แทน Text
        decoration: InputDecoration(
          labelText: 'Password :',
          hintText: 'More 6 Charactor',
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Fill Password';
          }
        },
        onSaved: (String value) {
          passwordString = value;
        },
      ),
    );
  }

  Widget signInButton() {
    return RaisedButton(
      color: Colors.orange[800], //สีพื้นหลังปุ่ม
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ), //สีตัวหนังสือในปุ่ม
      onPressed: () {
        if (formkey.currentState.validate()) {
          formkey.currentState.save();
          checkAuthen();
        }
      }, //ทำให้ปุ่มกดได้
    );
  }

  Future<void> checkAuthen() async {
    print('email = $emailString,password = $passwordString');
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      moveToService();
    }).catchError((response) {
      String messageString = response.message;
      print('message = $messageString');
      mySnackBar(messageString);
    });
  }

  Widget signUpButton() {
    return RaisedButton(
      color: Colors.orange[200],
      child: Text('Sign Up'),
      onPressed: () {
        print('You Click Sign up'); //แสดงข้อความหลังจากกดปุ่ม

        // Create Route เคลื่อนย้ายการทำงาน
        var registerRoute =
            // context เชื่อมต่อ Object
            // ไปหน้า Register() = register.dart
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRoute);
      },
    );
  }

  Widget showButton() {
    return Container(
      width: 250.0,
      //เรียงจากซ้ายไปขวา
      child: Row(
        children: <Widget>[
          //แบ่งขนาดให้เท่ากัน
          Expanded(
            child: signInButton(),
          ),
          mySizeBox(),
          Expanded(
            child: signUpButton(),
          )
        ],
      ),
    );
  }

  Widget mySizeBox() {
    return SizedBox(
      width: 8.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    //Tool สำหรับการออกแบบ
    return Scaffold(
      key: scaffoldkey,
      resizeToAvoidBottomPadding: false, //อนุญาติให้คีย์บอร์ดทับ Widget
      // Container กำหนดตำแหน่งและขนาด
      body: Container(
        decoration: BoxDecoration(
          // กำหนดพื้นหลังไล่เฉดสี
          gradient: RadialGradient(
            colors: [Colors.white, Colors.orange[600]],
            radius: 1.0, // กำหนดรัศมีตรงกลาง
            center: Alignment.center,
          ),
        ),
        padding: EdgeInsets.only(top: 60.0), //กำหนดความห่างจาก Method
        alignment: Alignment.topCenter,
        child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              showLogo(),
              showText(),
              emailText(),
              passwordText(),
              showButton(),
            ],
          ),
        ), //child,children คำสั่งเรียกใช้ Method
      ),
    );
  }
}
