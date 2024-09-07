import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final List<Map<String, String>> products = [
    {'name': 'Tomatoes', 'price': '20/kg', 'quantity': '50 kg'},
    {'name': 'Potatoes', 'price': '15/kg', 'quantity': '100 kg'},
    {'name': 'Onions', 'price': '25/kg', 'quantity': '30 kg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Products'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.agriculture),
            title: Text(products[index]['name']!),
            subtitle: Text('Price: ${products[index]['price']}'),
            trailing: Text('Qty: ${products[index]['quantity']}'),
          );
        },
      ),
    );
  }
}
