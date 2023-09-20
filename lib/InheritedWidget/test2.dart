import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserData extends ChangeNotifier {
  String username;
  int age;

  UserData({required this.username, required this.age});

  increaseAge(){
    age++;
    notifyListeners();
  }
}

class UsernameDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('UsernameDisplay build');
    final userData = Provider.of<UserData>(context, listen: false);
    return Text(userData.username);
  }
}

class AgeDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('AgeDisplay build');
    final userData = Provider.of<UserData>(context);
    return Text(userData.age.toString());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('MyApp build');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Provider Example'),
        ),
        body: MyColumn(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
             Provider.of<UserData>(context, listen: false).increaseAge();

          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class MyColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('MyColumn build');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UsernameDisplay(),
        AgeDisplay(),
      ],
    );
  }
}

void main() {
  runApp(
    ChangeNotifierProvider<UserData>(
      create: (context) => UserData(username: 'John Doe', age: 25),
      child: MyApp(),
    ),
  );
}