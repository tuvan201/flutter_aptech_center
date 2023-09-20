import 'package:flutter/material.dart';


void main(List<String> args) {
  runApp(MaterialApp(
    title:"Named routes demo",
    initialRoute: '/',
    routes: {
      '/':(context) => const FirstRoute(),
      '/second':(context) => const SecondRoute(),  
    },
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Open route"),
          onPressed: (){
            Navigator.pushNamed(
              context,
              '/second'
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go back !"),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}