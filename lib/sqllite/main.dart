// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const MyApp());
}
class DatabaseService{
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;
  Future<Database> get database async{
    if(_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async{
    final getDirectory = await getApplicationDocumentsDirectory();
    String path = getDirectory.path + 'users.db';
    print(path);
    return await openDatabase(path, onCreate: _onCreate, version:  1);
  }

  void _onCreate(Database db, int version) async{
    await db.execute(
      'Create table Users(name TEXT, password TEXT)'
    );
    log('TABLE CREATED');
  }

  Future<void> insert(UserModel user) async{  
    final db = await _databaseService.database;
    var data = await db.rawInsert('INSERT INTO Users(name, password) VALUES (?,?)',
        [user.name, user.password]
    );
  }

  Future<void> update(UserModel user) async{
    final db = await _databaseService.database;
    var data = await db.update('Users', user.toMap(),
        where: 'name = ?', whereArgs: [user.name]);
  }

  Future<void> delete(UserModel user) async{
    final db = await _databaseService.database;
    var data = await db.delete('Users', where: 'name = ?', whereArgs: [user.name]);
  }
  //void insert
}

class UserModel{
  UserModel({required this.name, required this.password});
  String name, password;

  Map<String, dynamic> toMap() => {
    'name' : name,
    'password' : password
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
class _MyHomePageState extends State<MyHomePage> {

  int? countUser;
  DatabaseService dbService = DatabaseService();
  @override
  void initState(){
    super.initState();
    dbService.initDatabase();
    countUser =0;
  }

  UserModel user = UserModel(name: '', password: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldMessengerKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Builder(
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    width: 320,
                    height: 80,
                    child:
                    Padding(
                        padding:const EdgeInsets.all(10),
                        child: TextFormField(
                          //controller: tv,
                          decoration:const InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(),
                            //contentPadding: EdgeInsets.symmetric(horizontal: 30)
                          ),
                          style:const TextStyle(fontSize: 20),
                          onChanged: (value) => setState(() => user.name = value),
                        )
                    )
                ),
                SizedBox(
                    width: 320,
                    height: 80,
                    child:  Padding(
                        padding:const EdgeInsets.all(10),
                        child: TextField(
                          //controller: passController,
                          obscureText: true,
                          decoration:const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            //contentPadding: EdgeInsets.symmetric(horizontal: 30)
                          ),
                          style:const TextStyle(fontSize: 20),
                          onChanged: (value) => setState(() => user.password = value),
                        )
                    )
                )
                ,
                ElevatedButton(onPressed: (){
                  Future<void> re =dbService.delete(user);
                  setState(() {
                    countUser=countUser!-1;
                    var snackBar = const SnackBar(content: Text('User deleted!'));
                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                }, child: const Text(
                  'Delete'
                ))
                ,
                ElevatedButton(onPressed: () {
                  Future<void> re = dbService.insert(user);
                  setState(() {
                    countUser=countUser!+1;
                    var snackBar =const SnackBar(
                    content: Text('User inserted!'),
                    duration: Duration(seconds: 2),
              );
                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                },
                    child: const Text(
                      'Insert',
                    )),
                ElevatedButton(onPressed: () {
                  Future<void> re = dbService.update(user);
                   var snackBar =const SnackBar(
                    content: Text('User updated!'),
                    duration: Duration(seconds: 2),
              );
                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                    child: const Text(
                      'Update',
                    )),
                ElevatedButton(onPressed: (){
                    var snackBar = SnackBar(
                    content: Text('Total user: $countUser!'),
                    duration:const Duration(seconds: 2),
              );
                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }, 
                child: const Text(
                  "Display quantity of user"
                ))
              ],
            );
          }
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
