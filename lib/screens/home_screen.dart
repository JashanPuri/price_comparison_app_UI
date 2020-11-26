import 'package:flutter/material.dart';

import 'techNews.dart';
import '../widgets/home_content.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final  textEditingController = TextEditingController();
  List<Widget> tabPages = [HomeContent(), TechNews()];
  var currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentTab == 0
          ? Colors.grey[300]
          : Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: currentTab == 1 ? Text('We\'ve got some news for you!') : null,
        elevation: 0,
      ),
      body: tabPages[currentTab],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: currentTab,
        onTap: (value) {
          setState(() {
            currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            title: Text('Tech News'),
            icon: Icon(
              Icons.library_books,
            ),
          )
        ],
      ),
    );
  }
}
