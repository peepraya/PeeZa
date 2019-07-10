import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  //ถ่ายเทข้อมูล
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explict

  // Method
  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {},
    ); //ดึงมาจาก Material.IO
  }

  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name :',
        labelStyle: TextStyle(
            color: Colors.blue, //กำหนดสีแของ label
            fontSize: 30.0, //กำหนดขนาดของ label
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans'),
        helperText: 'FirstName and LastName', //สำหรับทำหมายเหตุตอนกรอก
        helperStyle: TextStyle(
            color: Colors.blue[200],
            fontSize: 14.0,
            fontStyle: FontStyle.italic),
        icon: Icon(
          Icons.account_circle,
          size: 36.0, //กำหนดขนาดของ Icon
          color: Colors.blue, //กำหนดสีของ Icon
        ),
      ),
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email :',
        labelStyle: TextStyle(
            color: Colors.green, //กำหนดสีแของ label
            fontSize: 30.0, //กำหนดขนาดของ label
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans'),
        helperText: 'Email Format', //สำหรับทำหมายเหตุตอนกรอก
        helperStyle: TextStyle(
            color: Colors.green[200],
            fontSize: 14.0,
            fontStyle: FontStyle.italic),
        icon: Icon(
          Icons.alternate_email,
          size: 36.0, //กำหนดขนาดของ Icon
          color: Colors.green, //กำหนดสีของ Icon
        ),
      ),
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password :',
        labelStyle: TextStyle(
            color: Colors.purple, //กำหนดสีแของ label
            fontSize: 30.0, //กำหนดขนาดของ label
            fontWeight: FontWeight.bold ,
            fontFamily: 'OpenSans'),
        helperText: 'More 6 Charactor', //สำหรับทำหมายเหตุตอนกรอก
        helperStyle: TextStyle(
            color: Colors.purple[200],
            fontSize: 14.0,
            fontStyle: FontStyle.italic),
        icon: Icon(
          Icons.lock_outline,
          size: 36.0, //กำหนดขนาดของ Icon
          color: Colors.purple, //กำหนดสีของ Icon
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        actions: <Widget>[uploadButton()], //ใส่ Icon ลง AppBar
        backgroundColor: Colors.orange[700], //เปลี่ยนสี background
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        //ทำให้อยู่ตรงกลาง
        alignment: Alignment.topCenter,
        child: Container(
          //กำหนดความกว้าง
          width: 250.0,
          child: Column(
            children: <Widget>[ //เรียกใช้ Widget
              nameText(), 
              emailText(), 
              passwordText()],
          ),
        ),
      ),
    );
  }
}
