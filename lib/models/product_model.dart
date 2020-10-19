import 'package:flutter/material.dart';

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
    ProductModel(title: 'Iphone 11', price: '59000', siteName: 'Flipkart'),
    ProductModel(title: 'Iphone 11', price: '59000', siteName: 'Flipkart'),
    ProductModel(title: 'Iphone 11', price: '59000', siteName: 'Flipkart'),
    ProductModel(title: 'Iphone 11', price: '59000', siteName: 'Flipkart'),
    ProductModel(title: 'Iphone 11', price: '59000', siteName: 'Flipkart')
  ]; //dummy data

  
  List<ProductModel> _amazonProducts = [
    ProductModel(title: 'Iphone 11', price: '59000', siteName: 'Amazon')
  ];


  List<ProductModel> _relianceProducts = [
    ProductModel(title: 'Iphone 11', price: '59000', siteName: 'Reliance')
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
}
