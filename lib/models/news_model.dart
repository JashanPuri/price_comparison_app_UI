import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsModel {
  String title;
  String description;
  String more;
  String imageUrl;
  String content;
  DateTime publishedAt;

  NewsModel(
      {@required this.title,
      @required this.description,
      this.more,
      this.imageUrl,
      this.content,
      this.publishedAt});
}

class NewsProvider with ChangeNotifier {
  List<NewsModel> _news = [];

  List<NewsModel> get news {
    return [..._news];
  }

  Future getAndFetchNews() async {
    try {
      final newsUrl =
          'https://contextualwebsearch-websearch-v1.p.rapidapi.com/api/search/NewsSearchAPI?toPublishedDate=null&fromPublishedDate=null&pageSize=50&q=tech%20news&autoCorrect=true&pageNumber=1&withThumbnails=true';
      final header = <String, String>{
        "x-rapidapi-host": "contextualwebsearch-websearch-v1.p.rapidapi.com",
        "x-rapidapi-key": "e1e455cd49mshd0fc70f7025559bp10674ajsnfca72e09a027",
      };
      final _newsResponse = await http.get(newsUrl, headers: header);
      //print(_newsResponse.body);
      //print("Here");
      final _newsBody = json.decode(_newsResponse.body);
      //print("after body");
      //print('news body $_newsBody');
      final _newsList = _newsBody['value'] as List<dynamic>;
      print(_newsList);
      _news = _newsList.map((news) => NewsModel(
            description: news['description'],
            title: news['title'],
            content: news['body'],
            imageUrl: news['image']['url'],
            more: news['url']
          )).toList();
    } catch (e) {
      print('Error = $e');
    }
  }
}
