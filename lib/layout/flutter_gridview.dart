import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}

class MyApp extends StatelessWidget {
  final List<Product> products = [
    Product('Product 1', 10.0),
    Product('Product 2', 20.0),
    Product('Product 3', 30.0),
    Product('Product 4', 40.0),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView Example',
      home: Scaffold(
        appBar: AppBar(
          title:const Text('GridView Example'),
        ),
        body: GridView.builder(
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Số cột
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.blue,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      products[index].name,
                      style:const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Price: \$${products[index].price.toStringAsFixed(2)}',
                      style:const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
