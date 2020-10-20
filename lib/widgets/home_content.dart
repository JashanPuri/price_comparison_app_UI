import 'package:flutter/material.dart';
import '../screens/display_products_screen.dart';

class HomeContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            //color: Colors.grey,
            border: Border.all(color: Colors.grey)),
        child: Center(
          child: TextField(
            // controller: textEditingController,
            decoration: InputDecoration(
              hintText: 'Search',
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
    );
  }
}