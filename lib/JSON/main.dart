import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String fileContent = await rootBundle.loadString('lib/asset/json/user.json');
   Map<String, dynamic> data = jsonDecode(fileContent);
  List<dynamic> jsonData = data['users'];
  runApp(MyApp(jsonData));
}

class MyApp extends StatelessWidget {
  final List< dynamic> jsonData;

  MyApp(this.jsonData);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Data'),
        ),
        body: ListView.builder(
          itemCount: jsonData.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(jsonData[index]['id'].toString()),
              subtitle: Text(jsonData[index]['name']),
            );
          },
        ),
      ),
    );
  }
}