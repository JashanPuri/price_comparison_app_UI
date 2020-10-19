import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/techNews.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  int selectedIndex;
  BottomNavigationBarWidget(this.selectedIndex);
  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  List<String> widgetNameList = [HomeScreen.routeName,TechNews.routeName];
  @override
  Widget build(BuildContext context) {
    int currentTab = widget.selectedIndex;
    print('Current tab is $currentTab');
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).primaryColor,
      currentIndex: currentTab,
      onTap: (value) {
        setState(() {
          if(currentTab!=value){
            Navigator.of(context).pushReplacementNamed(widgetNameList[value]);
          }
          currentTab = value;
        });
      },
      items: [
        BottomNavigationBarItem(
          title: Text('Home'),
          icon: Icon(Icons.home)
        ),
        BottomNavigationBarItem(
            title: Text('Tech News'),
            icon: Icon(Icons.library_books)
        )
      ],
    );
  }
}
