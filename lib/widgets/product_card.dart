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
            Container(
              width: 120,
              height: 60,
              child: Text(
                product.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                // overflow: TextOverflow.ellipsis,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              product.price,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
