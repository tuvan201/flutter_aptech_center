
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    title: "Test routes Named",
    debugShowCheckedModeBanner: false,
    home: const Screen1(),
    routes: {
      '/screen1': (context) => const Screen1(),
      '/screen2': (context) => const Screen2(),
      '/screen3': (context) => const Screen3(),
      '/screen4': (context) => const Screen4(),
      '/screen5': (context) => const Screen5(),
    },
  ));
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Screen1"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context,'/screen2');
            },
            child: const Text("go to Screen2"),
          ),
        ));
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen2"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              const Text("Welcome to the Screen 2"),
              ElevatedButton(
                onPressed: () {
                  bool canGoBack =  Navigator.canPop(context);
                  if(canGoBack){
                    Navigator.maybePop(context);
                    print(context);
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Cant go back !"), 
                      )
                    );
                  }
                },
                child:const Text("Go back"),
              )
            ]),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
