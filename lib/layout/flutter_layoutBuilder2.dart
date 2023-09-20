import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);

    return MaterialApp(
      title: "LayoutBuider demo app",
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          //widget
          Expanded(
            flex: 1,
            child: LayoutBuilder(
              builder: (context, constrains) 
              => Container(
                color: Colors.yellow,
                child: Center(
                  child: Text("widget width \n"+constrains.maxWidth.toStringAsFixed(2)),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: LayoutBuilder(
              builder: (context, constrains) 
              => Container(
                color: Colors.green,
                child: Center(
                  child: Text("widget width \n"+constrains.maxWidth.toStringAsFixed(2)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}