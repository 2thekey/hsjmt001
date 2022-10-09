import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MakePostPage extends StatefulWidget {
  const MakePostPage({Key? key}) : super(key: key);

  @override
  State<MakePostPage> createState() => _MakePostPageState();
}

class _MakePostPageState extends State<MakePostPage> {

  FirebaseFirestore firestore=FirebaseFirestore.instance;
  TextEditingController titleController=TextEditingController();
  TextEditingController contentController=TextEditingController();
  String postTitle="";
  String content="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('포스트 업로드 테스트'),),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '메뉴명',
              ),
              onChanged: (value){
                setState(() {
                  postTitle=value;
                });
              },
            ),
            TextField(
              controller: contentController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '가게이름',
              ),
              maxLines: 3,
              onChanged: (value){
                setState(() {
                  content=value;
                });
              },
            ),
            ElevatedButton(
                onPressed: (){
                  firestore.collection('hs_jmt').doc().set({
                    "jmt_main" : postTitle,
                    "jmt_name" : content,
                    "jmt_hanjul" : "",
                    "jmt_image" : "",
                    "jmt_joayo" : 1,
                    "jmt_location" : "",
                    "jmt_num" : 1,
                    "jmt_price" : "10,000",
                    "jmt_tel1" : "041-630-1894",
                    "jmt_time" : "09~06",
                    "jmt_time2" : "매주 일요일 휴무",
                    "jmt_tv" : "6시 내고향",

                  });
                },
                child: Text('업로드 하기')
            ),

          ],
        ),
      ),
    );
  }
}
