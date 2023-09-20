import 'dart:math';

import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  Tile({Key? key}) : super(key : key);
  @override
  State<Tile> createState() => _TileState();

  static Color generateRandomColor() {
    final Random random = Random();


    //Mau sac duoc chon tu RGA voi random ngau nhien
    return Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
  }
}

class _TileState extends State<Tile> {
  //Tao 1 bien color voi 1 mau sac co dinh khong the thay doi
  final Color color = Tile.generateRandomColor(); 

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 100,
      height: 100,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var listTile =<Widget>
  [Padding(
    key: UniqueKey(),
    padding: const EdgeInsets.all(8.0),
    child: Tile(),
    ),Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: Tile()
      )];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Row(
          children: listTile,
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTwoTileWidget,
        child:const Icon(Icons.swap_horiz),
      ),
    );
  }

  void swapTwoTileWidget() {
    setState(() {
      listTile.add(listTile[0]);
      listTile.removeAt(0);
    });
  }
}

void main(List<String> args) {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}