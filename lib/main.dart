import 'package:flutter/material.dart'; //1
import 'package:pee_tpa/screens/authen.dart';

main() {
  runApp(MyApp());
}  //2

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Authen(),
    );
  }
}  //3
