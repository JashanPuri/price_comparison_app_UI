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

class ProductProvider with ChangeNotifier{
  List<ProductModel> _flipkartProducts = [];
  List<ProductModel> _amazonProducts = [];
  List<ProductModel> _relianceProducts = [];

  // Here we will fetch from api and do all the logical stuff needed
  
}
