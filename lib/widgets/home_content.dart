import 'package:flutter/material.dart';
import '../screens/display_products_screen.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: height*0.2,
          //color: Colors.blue,

          child: Stack(children: [
            Container(
              height: height*0.17,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Theme.of(context).primaryColor),
            ),
            Positioned(
              left: 30,
              top: 20,
              child: Text(
                'Let\'s Probe',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w500
                ),
                ),
              ),
            Positioned(
                bottom: 0,
                left: 20,
                child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 60,
                width: width*0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 25,
                        offset: Offset(0,1),
                        color: Theme.of(context).primaryColor.withOpacity(0.4)
                        ),
                        
                    ],
                    //color: Colors.grey,
                    //border: Border.all(color: Colors.grey)
                    ),
                child: Center(
                  child: TextField(
                    // controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Search Here',
                      suffixIcon: Icon(Icons.mic,size: 25,),
                      border: InputBorder.none,
                    ),
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) {
                      print('query = $value');
                      Navigator.of(context).pushNamed(
                        DisplayProductsScreen.routeName,
                        arguments: value,
                      );
                    },
                  ),
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
