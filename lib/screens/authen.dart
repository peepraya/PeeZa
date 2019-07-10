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

  Widget signInButton() {
    return RaisedButton(
      color: Colors.orange[800], //สีพื้นหลังปุ่ม
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ), //สีตัวหนังสือในปุ่ม
      onPressed: () {}, //ทำให้ปุ่มกดได้
    );
  }

  Widget signUpButton() {
    return RaisedButton(
      color: Colors.orange[200],
      child: Text('Sign Up'),
      onPressed: () {},
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
      resizeToAvoidBottomPadding: false, //อนุญาติให้คีย์บอร์ดทับ Widget
      // Container กำหนดตำแหน่งและขนาด
      body: Container(
        decoration: BoxDecoration(
          // กำหนดพื้นหลังไล่เฉดสี
          gradient: RadialGradient(
              colors: [Colors.white, Colors.orange[600]], 
              radius: 1.0 , // กำหนดรัศมีตรงกลาง
              center: Alignment.center,),
        ),
        padding: EdgeInsets.only(top: 60.0), //กำหนดความห่างจาก Method
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showLogo(),
            showText(),
            emailText(),
            passwordText(),
            showButton(),
          ],
        ), //child,children คำสั่งเรียกใช้ Method
      ),
    );
  }
}
