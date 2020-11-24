import 'package:flutter/material.dart';
import 'package:share/share.dart';
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

  _shareNews(String newsUrl, context) async {
    final RenderBox box = context.findRenderObject();

    if (newsUrl.isNotEmpty) {
      await Share.share(
        newsUrl,
        subject: 'Check out this new!', // used only when user shares through mail.
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
      );
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
              // height: 230,
              width: double.infinity,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                          height: 150,
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                              child: Image.network(
                                news.imageUrl,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ))),
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          // height: 80,
                          child: Text(
                            news.title,
                            overflow: TextOverflow.clip,
                            // maxLines: 3,
                            textScaleFactor: 1.2,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        // color: Colors.black12,
                      ),
                      child: PopupMenuButton(
                        color: Colors.white,
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 30,
                        ),
                        onSelected: (value) {
                          if (value == 0) {
                            _shareNews(news.more, context);
                          }
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.share_rounded,size: 25,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 1),
                                  child: Text('Share',style: TextStyle(fontSize: 17),),
                                )
                              ],
                            ),
                            value: 0,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
          //onTap: () => _launchUrl(news.more),
          //leading: Image.network(news.imageUrl,),

          //title: Text(news.title),
        ),
      ),
    );
  }
}
