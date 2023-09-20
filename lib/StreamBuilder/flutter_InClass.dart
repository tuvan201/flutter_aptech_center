import 'package:flutter/material.dart';
import 'dart:async';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: StreamBuilderExample(),
  ));
}

class StreamBuilderExample extends StatefulWidget {
  const StreamBuilderExample({Key? key}) : super(key: key);

  @override
  State<StreamBuilderExample> createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  Stream<int> _timerStream = Stream<int>.empty();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timerStream = Stream.periodic(const Duration(seconds: 1), (count) => 10 - count - 1)
        .take(10)
        .asBroadcastStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ví dụ Stream Builder"),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _timerStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final value = snapshot.data!;
              if (value > 0) {
                return Column(
                  children: [
                    const Text(
                      "Còn lại",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      value.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ],
                );
              } else {
                return const Text(
                  "Hết giờ!",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                );
              }
            } else if (snapshot.hasError) {
              return const Text("Đã xảy ra lỗi");
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}