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
          child: GestureDetector(
            onTap: () => _launchUrl(news.more),
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
              child: Container(
                //height: 230,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                        child: Image.network(news.imageUrl,fit:BoxFit.cover,width: double.infinity,)
                        )
                      ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      //height: 80,
                      child: Text(
                        news.title,
                        overflow: TextOverflow.clip,
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          fontWeight: FontWeight.w500
                        ),
                        )
                      ),
                ],),
              ),
              //onTap: () => _launchUrl(news.more),
        //leading: Image.network(news.imageUrl,),
        
        //title: Text(news.title),
      ),
          ),
    );
  }
}
