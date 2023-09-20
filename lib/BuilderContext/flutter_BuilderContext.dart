import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: MyFloattingButton(),
    );
  }
}

class MyFloattingButton extends StatelessWidget {
  const MyFloattingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: () {
      Scaffold.of(context).showBottomSheet(
        (context) =>const Text('Flutter From Zero to Hero'),
      );
    });
  }
}