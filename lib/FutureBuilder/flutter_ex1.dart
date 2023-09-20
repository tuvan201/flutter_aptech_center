import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: FutureBuilderExample(),
  ));
}

/// Example widget that demonstrates the usage of FutureBuilder.
class FutureBuilderExample extends StatefulWidget {
  const FutureBuilderExample({Key? key}) : super(key: key);

  @override
  State<FutureBuilderExample> createState() => _FutureBuilderExampleState();
}

/// Asynchronous function that simulates fetching the current time.
Future<String> fetchTime() async {
  await Future.delayed(const Duration(seconds: 1));
  var date = DateTime.now();
  return '${date.hour}:${(date.minute).toString().padLeft(2, '0')}:${(date.second).toString().padLeft(2, '0')}';
}

class _FutureBuilderExampleState extends State<FutureBuilderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future Builder Example"),
      ),
      body: Center(
        child: FutureBuilder(
          future: fetchTime(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show a loading indicator if the future is not yet complete.
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // Show an error message if the future completed with an error.
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
              } else if (snapshot.hasData) {
                // Show the fetched time if the future completed successfully.
                final data = snapshot.data.toString();
                return Text(
                  "Time now \n $data",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                );
              }
              // Show a fallback loading indicator if the future completed with no data.
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            // Show the data as a plain text widget if the future is still loading.
            return const Text("Lauching app");
          },
        ),
      ),
    );
  }
}