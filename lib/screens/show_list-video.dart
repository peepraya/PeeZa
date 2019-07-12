import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pee_tpa/models/pee_video_model.dart';
import 'package:pee_tpa/screens/play_video.dart';

class ShowListVideo extends StatefulWidget {
  @override
  _ShowListVideoState createState() => _ShowListVideoState();
}

//แสดงหน้าจอ
class _ShowListVideoState extends State<ShowListVideo> {
  // Explicit
  Firestore firestore = Firestore.instance;
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> sanpshots;
  List<PeeVideoModel> peeVideoModels = [];

  @override
  void initState() {
    super.initState();
    readFireStore();
  }

  Future<void> readFireStore() async {
    //อ่านข้อมูลทั้งหมด
    CollectionReference collectionReference =
        firestore.collection('PeeVideo'); //เรียกใช้ Firestore
    subscription = await collectionReference.snapshots().listen((response) {
      sanpshots = response.documents;

      for (var snapshot in sanpshots) {
        //ดึง Data
        String nameVideo = snapshot.data['Name'];
        String detailVideo = snapshot.data['Detail'];
        String pathImage = snapshot.data['PathImage'];
        String pathVideo = snapshot.data['PathVideo'];

        PeeVideoModel peeVideoModel =
            PeeVideoModel(nameVideo, detailVideo, pathImage, pathVideo);
        peeVideoModels.add(peeVideoModel);

        //print('nameVideo =$nameVideo');
      }
    });
  }

  Widget showImage(int index) {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: 180.0,
      height: 120.0,
      child: Image.network(
        peeVideoModels[index].pathImage,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget showText(int index) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              peeVideoModels[index].name,
              style: TextStyle(fontSize: 24.0, color: Colors.orange[900]),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(peeVideoModels[index].detail),
          )
        ],
      ),
    );
  }

  Widget myDivider() {
    //ใส่เส้นระหว่าง Row
    return Divider(
      height: 5.0,
      color: Colors.grey[600],
    );
  }

  // Method
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: ListView.builder(
        itemCount: peeVideoModels.length,
        itemBuilder: (context, int index) {
          return GestureDetector(
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[showImage(index), showText(index)],
                  ),
                  myDivider()
                ],
              ),
            ),
            onTap: () {
              
              print('index = $index');


              var playRoute = MaterialPageRoute(builder: (BuildContext context) => PlayVideo(peeVideoModel: peeVideoModels[index],));
              Navigator.of(context).push(playRoute);
            },
          );
        },
      ),
    );
  }
}
