import 'package:flutter/material.dart';
import 'package:price_comparison_app_ui/models/product_model.dart';
import 'package:price_comparison_app_ui/widgets/product_card.dart';
import 'package:provider/provider.dart';

class DisplayProductsScreen extends StatelessWidget {
  static const routeName = '/display_products_screen';

  @override
  Widget build(BuildContext context) {
    final String query = ModalRoute.of(context).settings.arguments as String;
    final productsProvider =
        Provider.of<ProductProvider>(context, listen: false);
    // final flipkartProducts = productsProvider.flipkartProducts;
    // final amazonProducts = productsProvider.amazonProducts;
    // final relianceProducts = productsProvider.relianceProducts;

    return Scaffold(
      appBar: AppBar(
        title: Text('Results showing for: $query'),
      ),
      body: FutureBuilder(
        future: productsProvider.getAndFetchData(query),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<ProductProvider>(
                    builder: (context, products, child) => Container(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text('Amazon'),
                            Container(
                              height: 310,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return ProductCard(
                                    product: products.amazonProducts[index],
                                  );
                                },
                                itemCount: products.amazonProducts.length,
                              ),
                            ),
                            Text('Reliance'),
                            Container(
                              height: 310,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return ProductCard(
                                    product: products.relianceProducts[index],
                                  );
                                },
                                itemCount: products.relianceProducts.length,
                              ),
                            ),
                            Text('Flipkart'),
                            Container(
                              height: 310,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return ProductCard(
                                    product: products.flipkartProducts[index],
                                  );
                                },
                                itemCount: products.flipkartProducts.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
