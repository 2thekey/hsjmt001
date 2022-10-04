import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hsjmt001/landingpage.dart';
import 'package:firebase_core/firebase_core.dart';

// void main()async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp().catchError(onError);
//   runApp(MyApp());
// }

bool isFirebaseReady = true;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().catchError((e) {
    isFirebaseReady = false;
    //print(e);
  });
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);  //화면세로고정
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: ThemeData(fontFamily: 'DongleRegular'),
      home: LandingPage(),
    );
  }
}
