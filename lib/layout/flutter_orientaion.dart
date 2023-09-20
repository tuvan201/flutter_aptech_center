import 'package:flutter/material.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
	const appTitle = 'Demo Orientaion App';

	return MaterialApp(
	title: appTitle,
	home: OrientationList(
		title: appTitle,
	),
	);
}
}

class OrientationList extends StatelessWidget {
final String title;

OrientationList({Key? key,required this.title});

@override
Widget build(BuildContext context) {
	return Scaffold(
		body: OrientationBuilder(
			builder: (context, orientation) =>

					GridView.builder(
//gridDelegate is where we specify the spacing,
// count and aspect ratio..

						gridDelegate:

						SliverGridDelegateWithFixedCrossAxisCount(
//change count according to orientation
								crossAxisCount: orientation ==

										Orientation.portrait ? 2 : 3,

//change aspect ratio as per orientation

								childAspectRatio:
								orientation == Orientation.portrait ? 1 : 16
										/ 9,

								mainAxisSpacing: 10,
								crossAxisSpacing: 10),
						itemBuilder: (context, index) => Container(
							color: Colors.blue,
						), ), ), );
}
}
