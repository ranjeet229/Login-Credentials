import 'package:flutter/material.dart';

class MarketPricesScreen extends StatelessWidget {
  final List<Map<String, String>> marketPrices = [
    {'name': 'Tomatoes', 'price': '18/kg'},
    {'name': 'Potatoes', 'price': '16/kg'},
    {'name': 'Onions', 'price': '26/kg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Market Prices'),
      ),
      body: ListView.builder(
        itemCount: marketPrices.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.pie_chart),
            title: Text(marketPrices[index]['name']!),
            subtitle: Text('Current Price: ${marketPrices[index]['price']}'),
          );
        },
      ),
    );
  }
}
