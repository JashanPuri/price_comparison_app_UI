import 'package:flutter/material.dart';
import 'package:price_comparison_app_ui/models/product_model.dart';
import 'package:price_comparison_app_ui/widgets/product_card.dart';
import 'package:provider/provider.dart';

class DisplayProductsScreen extends StatelessWidget {
  static const routeName = '/display_products_screen';

  @override
  Widget build(BuildContext context) {
    final String query = ModalRoute.of(context).settings.arguments as String;
    final productsProvider = Provider.of<ProductProvider>(context);
    final flipkartProducts = productsProvider.flipkartProducts;
    final amazonProducts = productsProvider.amazonProducts;
    final relianceProducts = productsProvider.relianceProducts;

    return Scaffold(
      appBar: AppBar(
        title: Text('Results showing for: $query'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: flipkartProducts[index],
                  );
                },
                itemCount: flipkartProducts.length,
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: amazonProducts[index],
                  );
                },
                itemCount: amazonProducts.length,
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: relianceProducts[index],
                  );
                },
                itemCount: relianceProducts.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
