import 'package:flutter/material.dart';



void main(List<String> args) {
  runApp(const MyApp());  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        ExtractArgumentsSreen.routeNamed : (context) => const ExtractArgumentsSreen(),
        
      },
      onGenerateRoute: (setting){
        if(setting.name == PassArgumentsScreen.routeName){
          final args = setting.arguments as ScreenArguments;

          return MaterialPageRoute(
            builder: (context){
              return PassArgumentsScreen(
                message: args.message,
                title: args.title
              );
            }
          );
        }
        assert(false, 'Need to implment ${setting.name}');
        return null;
      },
      title: 'Navigation with arguments',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Home Screen"),
      ),
      body:Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(
                  context,
                  ExtractArgumentsSreen.routeNamed,
                  arguments: ScreenArguments("extreact argument sreen", "this message is extraced in the builder method")
                );
              },
              child: const Text("Navigation to sreen that extracts arguments"),
            ),
             ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(
                  context,
                  PassArgumentsScreen.routeName,
                  arguments: ScreenArguments("accept argument sreen", "this message is extraced in the onGenerateRoute function")
                );
              },
              child: const Text("Navigation to a named that accepts argument"),
            )
          ]
          ),
      )
    );
  }
}
class ScreenArguments{
  final String title;
  final String message;

  ScreenArguments(this.title,this.message);
}

class ExtractArgumentsSreen extends StatelessWidget {
  const ExtractArgumentsSreen({super.key});

  static const routeNamed = '/etractArguments';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
       body:Center(
          child: Text(args.message),
        )
    );
  }
}
class PassArgumentsScreen extends StatelessWidget {
  const PassArgumentsScreen({super.key,required this.message, required this.title});

  static const routeName = '/passArguments';
  final String title;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}