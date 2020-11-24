import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductModel {
  final String title;
  final String price;
  final String url;
  final String siteName;
  final String imgUrl;

  ProductModel(
      {@required this.title,
      @required this.price,
      this.url,
      this.siteName,
      this.imgUrl});
}

class ProductProvider with ChangeNotifier {
  List<ProductModel> _flipkartProducts = [];

  List<ProductModel> _amazonProducts = [];

  List<ProductModel> _relianceProducts = [];

  List<ProductModel> get flipkartProducts {
    return [..._flipkartProducts];
  }

  List<ProductModel> get amazonProducts {
    return [..._amazonProducts];
  }

  List<ProductModel> get relianceProducts {
    return [..._relianceProducts];
  }

  // Here we will fetch from api and do all the logical stuff needed
  Future<void> getAndFetchData(query) async {
    try {
      final staticUrl = 'http://10.0.2.2:5000'; //call to local host

      final flipkartUrl = staticUrl + '/api/flipkart?query=' + query;
      final amazonUrl = staticUrl + '/api/amazon?query=' + query;
      final relianceUrl = staticUrl + '/api/reliance?query=' + query;
      print(flipkartUrl);
      print(relianceUrl);
      print(amazonUrl);

      //FLIPKART
      final _flipkartResponse = await http.get(flipkartUrl);
      final _flipkartBody =
          jsonDecode(_flipkartResponse.body) as Map<String, dynamic>;
      // print(_flipkartBody);
      final _flipkartList = _flipkartBody['flipkart'] as List<dynamic>;
      _flipkartProducts = mapProducts(_flipkartList);

      //AMAZON
      final _amazonResponse = await http.get(amazonUrl);
      final _amazonBody =
          jsonDecode(_amazonResponse.body) as Map<String, dynamic>;
      final _amazonList = _amazonBody['amazon'] as List<dynamic>;
      if (_amazonList != null) {
        _amazonProducts = mapProducts(_amazonList);
      }

      //RELIANCE
      final _relianceResponse = await http.get(relianceUrl);
      final _relianceBody =
          jsonDecode(_relianceResponse.body) as Map<String, dynamic>;
      final _relianceList = _relianceBody['reliance'] as List<dynamic>;
      _relianceProducts = mapProducts(_relianceList);

      notifyListeners();
    } catch (e) {
      print('Error = $e');
    }
  }

  List<ProductModel> mapProducts(List<dynamic> products) {
    return products
        .map(
          (product) => ProductModel(
              title: product['title'],
              price: product['price'],
              url: product['link'],
              // siteName: 'reliance',
              ),
        )
        .toList();
  }
}
