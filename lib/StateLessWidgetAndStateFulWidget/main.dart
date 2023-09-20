import  'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home:MyHomePage(title: "demo app",isLoading: false,counter: 1),
  ));
}

class MyHomePage extends StatefulWidget {
  final String title;
  final bool isLoading;
  final int counter;
  const MyHomePage({
    required this.isLoading,
    required this.counter,
    required this.title
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: CounterWidget(
          isLoading:_isLoading,
          counter:  _counter,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleFloatingButton();
        },
        child: const Text("click"),
        
      ),
    );
  }

  void toggleFloatingButton(){
    print("button clicked, call setState method !");
    setState(() {
      _counter++;
      if(_counter %2 ==0){
        _isLoading = true;
      }
      else{
        _isLoading = false;
      }

    });

  }
}

class CounterWidget extends StatelessWidget {
  final int counter;
  final bool isLoading;
  
   const CounterWidget({
    required this.isLoading,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading ? const CircularProgressIndicator() : Text("$counter");
  }
}