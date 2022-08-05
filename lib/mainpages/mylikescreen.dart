import 'package:flutter/material.dart';

class MyLikeScreen extends StatefulWidget {
  const MyLikeScreen({Key? key}) : super(key: key);

  @override
  State<MyLikeScreen> createState() => _MyLikeScreenState();
}

class _MyLikeScreenState extends State<MyLikeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("마이라이크스크린입니다."),
    );
  }
}
