import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StreamBuilderExampleState(),
  ));
}

Stream<DateTime> timeStream() async* {
  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    yield DateTime.now();
  }
}

class StreamBuilderExampleState extends StatefulWidget {
  const StreamBuilderExampleState({super.key});

  @override
  State<StreamBuilderExampleState> createState() => _StreamBuilderExampleStateState();
}

class _StreamBuilderExampleStateState extends State<StreamBuilderExampleState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Builder Example"),
      ),
      body: Center(
        child: StreamBuilder<DateTime>(
          stream: timeStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final time = snapshot.data;
              final formattedTime =
                  '${time?.hour}:${time?.minute.toString().padLeft(2, '0')}:${time?.second.toString().padLeft(2, '0')}';

              return Text(
                "Time now \n $formattedTime",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              );
            } else if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Error',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    snapshot.error.toString(),
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  )
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}