import "package:flutter/material.dart";

void main(List<String> args) {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InheritedHomeWidget(
        title: "Dependency Injection Text",
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Dependency Injection Demo",
            theme: ThemeData(primaryColor: Colors.red),
            home: Scaffold(
              body: MyHomePage(title: "Dependency"),
            )));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final title = InheritedHomeWidget.of(context);
    final subTitle = title?.replaceAll(RegExp(r'e'), 'u');
    return Scaffold(
      appBar: AppBar(
        title: Text("$subTitle"),
      ),
      body: Text("$title", style: const TextStyle(fontSize: 30)),
    );
  }
}

class InheritedHomeWidget extends InheritedWidget {
  const InheritedHomeWidget({Key? key, required this.title, required this.child})
      : super(key: key, child: child);

  final Widget child;
  final String title;

  static String? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedHomeWidget>()
        ?.title;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}
