import 'package:flutter/material.dart';

class MyLikeScreen extends StatefulWidget {
  const MyLikeScreen({Key? key}) : super(key: key);

  @override
  State<MyLikeScreen> createState() => _MyLikeScreenState();
}

class _MyLikeScreenState extends State<MyLikeScreen> {
  // static List<String> animalName = [
  //   'cat',
  //   'cow',
  //   'dog',
  //   'horse',
  //   'lion',
  //   'monkey',
  //   'rabbit',
  //   'tiger',
  // ];
  //
  // static List<String> animalImagePath = [
  //   'image/cat.png',
  //   'image/cow.png',
  //   'image/dog.png',
  //   'image/horse.png',
  //   'image/lion.png',
  //   'image/monkey.png',
  //   'image/rabbit.png',
  //   'image/tiger.png',
  // ];
  //
  // static List<String> animalLocation = [
  //   'skhouse',
  //   'hongseong',
  //   'hongbuk',
  //   'farm',
  //   'zoo',
  //   'china',
  //   'sik',
  //   'russia',
  // ];
  //
  // final List<Animal> animalData = List.generate(
  //     animalLocation.length,
  //         (index) => Animal(
  //         animalName[index], animalLocation[index], animalImagePath[index]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: ListView.builder(
        itemCount: 5, //animalData.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('내장탕~'),      //animalData[index].name),
              leading: SizedBox(
                height: 50,
                width: 50,
                child: Image.network('https://recipe1.ezmember.co.kr/cache/rpt/2019/10/11/412cb0133ea7338ee3e51498bf1d5859.jpg.jpeg',fit: BoxFit.cover,),
              ),
              onTap: (){

              },
            ),
          );
        },
      ),
    );
  }
}
