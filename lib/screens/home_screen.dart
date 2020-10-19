import 'package:flutter/material.dart';
import '../widgets/bottomNavigationBarWidget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Python Project'),
      ),
      body:  Padding(
        padding: EdgeInsets.symmetric(vertical: 30,horizontal: 30),
        child: Container(
              padding: EdgeInsets.all(10),
              width: 320,
              height: 52,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  //color: Colors.grey,
                  border: Border.all(color: Colors.grey)
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none
                    ),
                  ),
                ],
              )
            ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(0),
    );
  }
}