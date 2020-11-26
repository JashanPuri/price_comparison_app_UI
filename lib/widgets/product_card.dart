import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url;

import 'package:price_comparison_app_ui/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  ProductCard({this.product});

  _launchUrl(String urlString) async {
    if (await url.canLaunch(urlString)) {
      await url.launch(urlString);
    } else {
      throw 'Counld not launch URL $urlString';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchUrl(product.url),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 150,
                width: 130,
                child: product.imgUrl == null
                    ? Image.asset(
                        'assets/flipkart_placeholder.jpg',
                        fit: BoxFit.contain,
                      )
                    : CachedNetworkImage(
                        imageUrl: product.imgUrl,
                        fit: BoxFit.contain,
                        errorWidget: (context, url, error) => Center(
                          child: Text('Sorry could not load!'),
                        ),
                        placeholder: (context, url) => Center(
                          child: Text('Loading...'),
                        ),
                      ),
                // color: Colors.blue,
              ),
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
                height: 8,
              ),
              Text(
                product.price,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
