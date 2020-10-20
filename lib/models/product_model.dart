import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductModel {
  String title;
  String price;
  String url;
  String siteName;

  ProductModel({
    @required this.title,
    @required this.price,
    this.url,
    this.siteName,
  });
}

class ProductProvider with ChangeNotifier {
  List<ProductModel> _flipkartProducts = [
    // ProductModel(title: 'Iphone 11', price: '59000', siteName: 'Flipkart'),
    // ProductModel(title: 'Iphone 11', price: '59000', siteName: 'Flipkart'),
    // ProductModel(title: 'Iphone 11', price: '59000', siteName: 'Flipkart'),
    // ProductModel(title: 'Iphone 11', price: '59000', siteName: 'Flipkart'),
    // ProductModel(title: 'Iphone 11', price: '59000', siteName: 'Flipkart')
  ]; //dummy data

  List<ProductModel> _amazonProducts = [
    // ProductModel(title: 'Iphone 11', price: '59000', siteName: 'Amazon')
  ];

  List<ProductModel> _relianceProducts = [
    // ProductModel(title: 'Iphone 11', price: '59000', siteName: 'Reliance')
  ];

  // Here we will fetch from api and do all the logical stuff needed
  List<ProductModel> get flipkartProducts {
    return [..._flipkartProducts];
  }

  List<ProductModel> get amazonProducts {
    return [..._amazonProducts];
  }

  List<ProductModel> get relianceProducts {
    return [..._relianceProducts];
  }

  Future<void> getAndFetchData(query) async {
    try {
      final static_url = 'http://10.0.2.2:5000';

      //FLIPKART
      final flipkart_url = static_url + '/api/flipkart?query=' + query;
      print(flipkart_url);

      final _flipkartResponse = await http.get(flipkart_url);
      final _flipkartBody =
          jsonDecode(_flipkartResponse.body) as Map<String, dynamic>;
      // print(_flipkartBody);
      final _flipkartList = _flipkartBody['flipkart'] as List<dynamic>;
      _flipkartProducts = _flipkartList
          .map(
            (product) => ProductModel(
                title: product['title'],
                price: product['price'],
                url: product['link'],
                siteName: 'flipkart'),
          )
          .toList() as List<ProductModel>;

      //AMAZON
      final amazon_url = static_url + '/api/amazon?query=' + query;
      print(amazon_url);

      final _amazonResponse = await http.get(amazon_url);
      final _amazonBody =
          jsonDecode(_amazonResponse.body) as Map<String, dynamic>;
      // print(_flipkartBody);
      final _amazonList = _amazonBody['amazon'] as List<dynamic>;
      if (_amazonList != null)
      {
        _amazonProducts = _amazonList
          .map(
            (product) => ProductModel(
              title: product['title'],
              price: product['price'],
              url: product['link'],
              siteName: 'reliance',
            ),
          )
          .toList() as List<ProductModel>;
      }
      

      //RELIANCE
      final reliance_url = static_url + '/api/reliance?query=' + query;
      print(reliance_url);

      final _relianceResponse = await http.get(reliance_url);
      final _relianceBody =
          jsonDecode(_relianceResponse.body) as Map<String, dynamic>;
      // print(_flipkartBody);
      final _relianceList = _relianceBody['reliance'] as List<dynamic>;
      _relianceProducts = _relianceList
          .map(
            (product) => ProductModel(
              title: product['title'],
              price: product['price'],
              url: product['url'],
              siteName: 'reliance',
            ),
          )
          .toList() as List<ProductModel>;

      notifyListeners();
    } catch (e) {
      print('Error = $e');
    }
  }
}
