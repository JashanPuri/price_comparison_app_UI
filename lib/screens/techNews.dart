import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/news_model.dart';
import '../widgets/news_card.dart';

class TechNews extends StatelessWidget {
  static const routeName = '/tech_news_screen';
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context, listen: false);
    return FutureBuilder(
      future: newsProvider.getAndFetchNews(),
      builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting
      ? Center(
        child: CircularProgressIndicator(),
      )
      : Consumer<NewsProvider>(
        builder: (context, newsItem, child) => Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: ListView.builder(
                              //scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return NewsCard(
                                  news: newsItem.news[index],
                                );
                              },
                              itemCount: newsItem.news.length,
                            ),
                          ),
        ),
    );
  }
}
