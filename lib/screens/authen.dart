import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

//ออกแบบหน้าจอ
class _AuthenState extends State<Authen> {
  // Explicit ประกาศ Varible

  // Method การเอา Statement มารวมกัน
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Tool สำหรับการออกแบบ
    return Scaffold(
      resizeToAvoidBottomPadding: false, //อนุญาติให้คีย์บอร์ดทับ Widget
      // Container กำหนดตำแหน่งและขนาด
      body: Container(
        padding: EdgeInsets.only(top: 60.0), //กำหนดความห่างจาก Method
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showLogo(),
            showText(),
            emailText(),
            passwordText()
          ],
        ), //child,children คำสั่งเรียกใช้ Method
      ),
    );
  }
}
