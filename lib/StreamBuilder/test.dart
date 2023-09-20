import 'package:flutter/material.dart';
import 'dart:async';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: StreamBuilderExample(),
  ));
}

int i = 10;
Stream<String> fetchingTimer() async* {
  while (i > 0) {
    await Future.delayed(const Duration(seconds: 1));
    i--;
    yield i.toString();
  }
}

class StreamBuilderExample extends StatefulWidget {
  const StreamBuilderExample({super.key});

  @override
  State<StreamBuilderExample> createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: StreamBuilder<String>(
            stream: fetchingTimer(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                print("dang cho");
                return const CircularProgressIndicator();
              }
              if (snapshot.connectionState == ConnectionState.active) {
                print("dang hoat dong");
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      const Text("Time Ends In:"),
                      Text(snapshot.data!.toString())
                    ],
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.done) {
                print("da hoan thanh");
                return Column(
                  children: [
                    const Text("Time Up!"),
                    Text(snapshot.connectionState.toString()),
                  ],
                );
              }
              return Container();
            },
          ),
        ));
  }
}
