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

  @override
  Widget build(BuildContext context) {
    //Tool สำหรับการออกแบบ
    return Scaffold(
      // Container กำหนดตำแหน่งและขนาด
      body: Container(
        padding: EdgeInsets.only(top: 60.0), //กำหนดความห่างจาก Method
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[showLogo(), showText()],
        ), //child,children คำสั่งเรียกใช้ Method
      ),
    );
  }
}
