import 'package:flutter/material.dart';
import '../screens/display_products_screen.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 60,
      width: width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 25,
              offset: Offset(0, 1),
              color: Theme.of(context).primaryColor.withOpacity(0.4)),
        ],
        //color: Colors.grey,
        //border: Border.all(color: Colors.grey)
      ),
      child: Center(
        child: TextField(
          // controller: textEditingController,
          decoration: InputDecoration(
            hintText: 'Search Here',
            suffixIcon: Icon(
              Icons.mic,
              size: 25,
            ),
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
    );
  }
}