import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<List<dynamic>> fetchData() async {
    var url = Uri.parse('https://api.example.com/data');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('Yêu cầu thất bại với mã trạng thái: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('API Example'),
        ),
        body: FutureBuilder<List<dynamic>>(
          future: fetchData(),
          initialData: [],
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Đã xảy ra lỗi: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              // Hiển thị dữ liệu từ API
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index]['name']),
                    subtitle: Text(snapshot.data![index]['email']),
                  );
                },
              );
            } else {
              // Hiển thị các nội dung khác
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Không có dữ liệu từ API'),
                  const SizedBox(height: 16),
                  Image.asset('assets/image_placeholder.png'),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}