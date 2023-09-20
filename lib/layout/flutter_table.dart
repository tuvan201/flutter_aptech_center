import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter demo table',
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            // columnWidths:const {
            //   0: FlexColumnWidth(20),
            //   1: FlexColumnWidth(80),
            //   2: FlexColumnWidth(50),
            //   3: FlexColumnWidth(50),
            //   4: FlexColumnWidth(50),
            //   5: FlexColumnWidth(100),
            //   6: FlexColumnWidth(50)
            // },
            border: TableBorder.all(
              color: Colors.black,
              width: 1
            ),
            children: const [
              TableRow(
                children: [
                  Center(child: Text('STT',)),
                  Center(child: Text('Name')),
                  Center(child: Text('GK Score')),
                  Center(child: Text('CK Score')),
                  Center(child: Text('Total Score')),
                  Center(child: Text('Note')),
                ]
              ),
              TableRow(
                children: [
                  Center(child: Text('1')),
                  Center(child: Text('Nguyen Van A')),
                  Center(child: Text('10')),
                  Center(child: Text('10')),
                  Center(child: Text('20')),
                  Center(child: Text('')),
                ]
              ),
               TableRow(
                children: [
                  Center(child: Text('2')),
                  Center(child: Text('Nguyen Van B')),
                  Center(child: Text('10')),
                  Center(child: Text('10')),
                  Center(child: Text('20')),
                  Center(child: Text('')),
                ]
              ),
               TableRow(
                children: [
                  Center(child: Text('3')),
                  Center(child: Text('Nguyen Van C')),
                  Center(child: Text('10')),
                  Center(child: Text('10')),
                  Center(child: Text('20')),
                  Center(child: Text('')),
                ]
              ),
               TableRow(
                children: [
                  Center(child: Text('4')),
                  Center(child: Text('Nguyen Van D')),
                  Center(child: Text('10')),
                  Center(child: Text('10')),
                  Center(child: Text('20')),
                  Center(child: Text('')),
                ]
              ),
               TableRow(
                children: [
                  Center(child: Text('5')),
                  Center(child: Text('Nguyen Van E')),
                  Center(child: Text('10')),
                  Center(child: Text('10')),
                  Center(child: Text('20')),
                  Center(child: Text('')),
                ]
              ),
              TableRow(
                children:[
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Text(
                    'abc'
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Text(
                    'abc'
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Text(
                    'abc'
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Text(
                    'abc'
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Text(
                    'abc'
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Text(
                    'abc'
                  ),
                ),
                ] 
              )
            ]
          )
        ),
      ),
    );
  }
}