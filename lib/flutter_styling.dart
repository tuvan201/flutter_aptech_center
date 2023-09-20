
import "package:flutter/material.dart";


void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  
  @override
  State<MyApp> createState() => _MyAppState();
}
final AppTheme appTheme = AppTheme();
class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    appTheme.addListener((){
      setState(() {
        
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: "stylingApp demo",
    debugShowCheckedModeBanner: false,
    theme:AppTheme.lightTheme,
    darkTheme: AppTheme.darkTheme,
    //ThemeMode
    themeMode: AppTheme.currentTheme,
    home: MyStyling(),
    );
  }
}

class MyStyling extends StatefulWidget {
  const MyStyling({super.key});

  @override
  State<MyStyling> createState() => _MyStylingState();
}

class _MyStylingState extends State<MyStyling> {

  double rating = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Styling app demo"),
        actions: [
          IconButton(
            onPressed: (){
              appTheme.toggleTheme();
            }, 
            icon:const Icon(Icons.brightness_4)
            )
        ],
      ),
      body: Center(
        child: Column(
          children: [
             Text("Heading 4", style: Theme.of(context).textTheme.headlineLarge,),
             Slider(
              value: rating,
              onChanged: (newRating){
                setState(() {
                  rating = newRating;
                });
              print(rating);
              },
              label: "$rating",
              min: 2,
              max: 20,
              ),
              const Icon(Icons.collections_sharp),
              Checkbox(value: true, onChanged: (s){},),
              TextButton(onPressed: (){}, child: const Text("Text Button")),
              ElevatedButton(onPressed: (){}, child:const Text("Elevated Button")),
          ],
        ),
      ),
    );
  }
}

class AppTheme extends ChangeNotifier{

  static bool _isDarkTheme = true;
  static ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme(){
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData darkTheme = ThemeData(
    //scaffold background color
    scaffoldBackgroundColor: Colors.black54,
    //appbar theme color
    appBarTheme: const AppBarTheme(
      color: Colors.purple,
    ),
    //elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary:Colors.red,
      )
    ),
    //icon
    iconTheme:const IconThemeData(
      color: Colors.white
    ),
    //text theme
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.w500,
      )
    )

  );

  static ThemeData lightTheme = ThemeData(

    //scaffold background color
    scaffoldBackgroundColor: Colors.white70,
    //appbar color theme
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
    ),
    //elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
      )
    ),
    //text theme - medium font size
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: Colors.blueGrey,
        fontWeight: FontWeight.w500,
      )
    )

  );
}