import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import "user.dart";

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<User> users = [];

  Future<void> loadData() async{
   final response = await rootBundle.loadString('lib/asset/json/user.json');
   final data = jsonDecode(response);
   final listusers = Users.fromJson(data);
   setState(() {
     users = listusers.users!;
   });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    debugPrint(users.length.toString());  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("JSON")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
              onPressed: (){
                debugPrint(users.length.toString());
                loadData();
              },
              child: const Text("Display data user"),
            ),
            users.isNotEmpty  ? SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    key: ValueKey(users[index].id),
                    margin: const EdgeInsets.all(8.0),
                    color: Colors.amber.shade100,
                    child: ListTile(
                      leading: Text(users[index].id.toString()),
                      title: Text(users[index].name!),
                      subtitle: Text(users[index].email!),
                    ),
                  );
                }
              ),
            )
            :  Container(),
          ],
        ),
      ),
    );
  }
}