import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: MyHomePage2(),
  ));
}

class MyHomePage2 extends StatelessWidget {
  const MyHomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF185E20),
      body: Scaffold(
        backgroundColor: Color(0xffe91e63),
        floatingActionButton: Builder(builder: (context){
          return FloatingActionButton(
            onPressed: (){
              print(Scaffold.of(context).widget.backgroundColor);
            }
          );
        }),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
          onPressed: () {
            Scaffold.of(context).showBottomSheet(
              (context) => const Text('Flutter From Zero to Hero'),
            ); 
          },
        );
      }),
    );
  }
}
