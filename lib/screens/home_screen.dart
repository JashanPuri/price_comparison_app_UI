import 'package:flutter/material.dart';

import '../screens/display_products_screen.dart';
import '../widgets/bottomNavigationBarWidget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final  textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Python Project'),
      ),
      body: Padding(
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
            )),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(0),
    );
  }
}
