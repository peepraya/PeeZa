import 'package:flutter/material.dart'; //1
import 'package:pee_tpa/screens/authen.dart';

//ตั้งค่าจอ
import 'package:flutter/services.dart';

main() {
  runApp(MyApp());
} //2

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        // กำหนด App ให้เป็นแนวตั้ง
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
        // กำหนด App ให้เป็นแนวนอน
        // [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return MaterialApp(debugShowCheckedModeBanner: false, //ปิด Dubug
      home: Authen(),
    );
  }
} //3
