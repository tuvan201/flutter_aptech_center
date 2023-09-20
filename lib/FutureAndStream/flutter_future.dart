import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp( MaterialApp(
    title: "future demo",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home:MyHomePage(title : "future demo"),
  ));
}
class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(
          future: Future.delayed(const Duration(seconds:3), ()=> "Cà phê sữa đá"),
          builder: ((context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const CircularProgressIndicator();
            }
            else{
              return Text("đã nhận được order: ${snapshot.data}");
            }
          })
        ),
      ),
    );
  }
}