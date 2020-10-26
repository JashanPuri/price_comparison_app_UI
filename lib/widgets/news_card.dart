import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url;

import '../models/news_model.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;
  NewsCard({this.news});

  _launchUrl(String urlString) async {
    if (await url.canLaunch(urlString)) {
      await url.launch(urlString);
    } else {
      throw 'Counld not launch URL $urlString';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
          child: ListTile(
            onTap: () => _launchUrl(news.more),
        leading: Image.network(news.imageUrl,),
        
        title: Text(news.title),
      ),
    );
  }
}
