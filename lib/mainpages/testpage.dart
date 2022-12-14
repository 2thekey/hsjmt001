import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'makepostpage.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  FirebaseFirestore firestore=FirebaseFirestore.instance;

  var name='https://d12zq4w4guyljn.cloudfront.net/300_300_20200201015101139_photo_86f87df7782f.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('테스트페이지'),),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 100,),

              SizedBox(
                height: 300,
                child: Image.network(name,fit: BoxFit.cover,),
              ),

              ElevatedButton(
                  onPressed: () async{
                    DocumentSnapshot test1docData=await firestore.collection('Test').doc('test1doc').get();
                    setState(() {
                      name=test1docData['foodimage'];

                    });

                  },
                  child: Text('데이터 불러오기'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(MakePostPage());
                  },



                child: Text('포스팅 올리기 페이지로'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
