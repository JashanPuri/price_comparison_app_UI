import 'package:flutter/material.dart';
import '../widgets/bottomNavigationBarWidget.dart';

class TechNews extends StatelessWidget {
  static const routeName = '/tech_news_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Tech News Section'),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(1),
    );
  }
}
