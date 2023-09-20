// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedWidget{
  final String username;
  final int age;

  MyInheritedWidget({
    required this.username,
    required this.age,
    required Widget child
  }) :super(child: child);

  static MyInheritedWidget? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }


}

class AgeDisplay extends StatelessWidget {

  const AgeDisplay({super.key,});

  @override
  Widget build(BuildContext context) {
    final myInheritedWidget = MyInheritedWidget.of(context);
    return Text(
      myInheritedWidget?.age.toString() ?? ''
      );
  }
}

class UsernameDisplay extends StatelessWidget {
  const UsernameDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final myInheritedWidget = MyInheritedWidget.of(context);
    return Text(
      myInheritedWidget?.username.toString() ?? ''
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final myInheritedWidet = MyInheritedWidget.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("InheritedWidget Example"),
      ),
      body: MyColumnWidget(),
    );
  }
}

class MyColumnWidget extends StatelessWidget {
  const MyColumnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print("rebuild Column Widget");
    return Column(
      children: [
        UsernameDisplay(),
        AgeDisplay(),
      ],
    );
  }
}