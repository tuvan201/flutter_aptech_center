import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyModel with ChangeNotifier {
  String text = 'abc';
  int count = 1;

  void doSomeThing() {
    count++;
    if (count % 2 == 1) {
      text = "world";
    } else {
      text = "hello";
    }
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('My App')),
          backgroundColor: Colors.grey,
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: ElevatedButton(
                    child: Text('Do something'),
                    onPressed: () {
                     Provider.of<MyModel>(context,listen: false).doSomeThing();
                    },
                  )),
              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel>(
                  builder: (context, mymodel, child) {
                    return Text(mymodel.text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
