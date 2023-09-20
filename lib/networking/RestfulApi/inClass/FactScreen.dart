import 'package:flutter/material.dart';
import 'ApiCall.dart';

class FactScreen extends StatelessWidget {
  const FactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Example'),
      ),
      body: Center(
        child: FutureBuilder<String?>(
            future: ApiCall().getRandomFact(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                if (snapshot.data == null) {
                  return const Text('No fact found');
                }
                return Text(
                  snapshot.data!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                );
              }
              return Container();
            }),
      ),
    );
  }
}
