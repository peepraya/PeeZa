import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pee_tpa/screens/my_service.dart'; // เอา Firebase มาใช้

class Register extends StatefulWidget {
  //ถ่ายเทข้อมูล
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explict
  final formKey = GlobalKey<FormState>(); // สามารถเก็บข้อมูลได้หลายประเภท
  String nameString, emailString, passwordString; // ประกาศตัวแปร
  FirebaseAuth firebaseAuth = FirebaseAuth.instance; // Call Library มาทำงาน

  // Method
  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload), //ดึงมาจาก Material.IO ของ Google
      onPressed: () {
        print('Click Upload');
        if (formKey.currentState.validate()) {
          // ตรวจสอบว่าข้อมูลถูกต้องหรือไม่
          formKey.currentState.save(); // บันทึก
          print(//นำค่าที่กรอกมาแสดงผ่านตัวแปรที่บรรทัด 12
              'Name = $nameString , Email = $emailString , Password = $passwordString');
          registerFirebase();
        }
      },
    );
  }

  Future<void> registerFirebase() async {
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Regsiter Success');
      setupDisplayName();
    }).catchError((response) {
      // ตรวจสอบค่าซ้ำ
      print('Error = ${response.toString()}');

      String title = response.code;
      String message = response.message;
      myAlert(title, message);
    });
  }

  Future<void> setupDisplayName() async {
    // ตรวจสอบการใช้
    await firebaseAuth.currentUser().then((response) {
      UserUpdateInfo userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = nameString;
      response.updateProfile(userUpdateInfo);

      // Move To Service
      var myServiceRoute =
          MaterialPageRoute(builder: (BuildContext context) => MyService());

      //ไม่มีการย้อนกลับตรง AppBar
      Navigator.of(context).pushAndRemoveUntil(myServiceRoute, (Route<dynamic> route) => false);
    });
  }

  void myAlert(String titleString, String messageString) {
    // Alert ในกรณีที่ catchError ในบรรทัด 42
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            titleString,
            style: TextStyle(color: Colors.red),
          ),
          content: Text(messageString),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
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
      validator: (String value) {
        if (value.isEmpty) {
          //ตรวจสอบว่ามีข้อมูลหรือไม่
          return 'Please Fill in the Blank'; // ถ้าไม่มัให้ขึ้นข้อความนี้
        }
      },
      onSaved: (String value) {
        nameString = value; //นำค่า value = ค่าที่กำหนด
      },
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
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Email Format Fail';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password :',
        labelStyle: TextStyle(
            color: Colors.purple, //กำหนดสีแของ label
            fontSize: 30.0, //กำหนดขนาดของ label
            fontWeight: FontWeight.bold,
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
      validator: (String value) {
        if (value.length <= 5) {
          return 'Password Fail';
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
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
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                //เรียกใช้ Widget
                nameText(),
                emailText(),
                passwordText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
