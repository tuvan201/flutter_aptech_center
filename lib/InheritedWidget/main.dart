// ignore_for_file: use_key_in_widget_constructors, avoid_print

import  'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(
      isLoading: false,
      counter: 0,
      child: MyCenterWidget(),
      ),
  ));
}

class MyHomePage extends StatefulWidget {
  final bool isLoading;
  final int counter;
  final Widget child;
  const MyHomePage({
    required this.isLoading,
    required this.counter,
    required this.child
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late bool _isLoading;
  late int _counter;

  @override
  void initState() {
    super.initState();
    _isLoading = widget.isLoading;
    _counter = widget.counter;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyInheritedWidget(
        isLoading: _isLoading,
        counter: _counter,
        child: widget.child,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onFloattingButtonClicked,
      ),
      
    );
  }

  void onFloattingButtonClicked() {
    // ignore: avoid_print
    print("Button clicked!. Call setState method");
    setState(() {
      _counter++;
      if(_counter % 2==0){
        _isLoading = false;
      }
      else{
        _isLoading = true;
      }
    });
  }
}

class MyCenterWidget extends StatelessWidget {
  const MyCenterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print("rebuild MyCenterWidget");
    return  Center(
      child: MyCounterWidget(),
    );
  }
}

class MyCounterWidget extends StatelessWidget {
  const MyCounterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print("rebuild MyCounterWidget");
    final myInheritedWidget = MyInheritedWidget.of(context);
    if(myInheritedWidget == null){
      return const Text("MyInheritedWidget was not found");
    }
    return myInheritedWidget.isLoading 
    ? const CircularProgressIndicator() 
    : Text("${myInheritedWidget.counter}");

  }
}

class MyInheritedWidget extends InheritedWidget{
  final int counter;
  final bool isLoading;
  final Widget child;

  const MyInheritedWidget({
    required this.child,
    required this.isLoading,
    required this.counter,
  }) : super(child: child);
  
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
   return true;
  }
  
  static MyInheritedWidget? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }


 
}