import 'package:flutter/material.dart';
import 'package:price_comparison_app_ui/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  ProductCard({this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(product.title),
            SizedBox(
              height: 20,
            ),
            Text(product.price)
          ],
        ),
      ),
    );
  }
}
