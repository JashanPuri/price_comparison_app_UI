import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../widgets/search_bar.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 170,
          // color: Colors.blue,
          child: Stack(children: [
            Container(
              height: 140,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: width * 0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Let\'s Probe',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Positioned(
            //   left: 30,
            //   top: 20,
            //   child: Text(
            //     'Let\'s Probe',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 40,
            //       fontWeight: FontWeight.w500
            //     ),
            //     ),
            //   ),
            Positioned(
              bottom: 0,
              left: width * 0.05,
              child: SearchBar(width: width),
            ),
          ]),
        ),
        // SizedBox.expand(),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(50),
              // color: Colors.white,
              child: Image.asset(
                'assets/bg2.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
