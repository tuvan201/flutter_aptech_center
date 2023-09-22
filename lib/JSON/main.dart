import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'user_model.dart';


const jsonPath = '../asset/json/user_model.json';

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: 'JSON Demo',
      ),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User>? users;

  @override
  void initState() {
    super.initState();
    _loadJsonData();
  }

  Future<void> _loadJsonData() async {
    final json = await rootBundle.loadString(jsonPath);
    setState(() {
      final result = jsonDecode(json);
      final data = Result.fromJson(result);
      users = data.results;
    });
    debugPrint('Data loaded from file');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: users != null
          ? ListView.builder(
              key: UniqueKey(),
              itemCount: users!.length,
              itemBuilder: (context, index) {
                User user = users![index];
                return Text(user.toString());
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}