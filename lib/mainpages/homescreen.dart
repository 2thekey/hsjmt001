import 'package:flutter/material.dart';
import 'package:hsjmt001/cards/postcard.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children:[
        Container(
        child: ListView.separated(
            itemCount: 30,
            itemBuilder: (BuildContext context, int index){
              return PostCard(
                number: index,
              );
            },
          separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 10,);
          },
            )
      ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
    ]
    );

  }
}
