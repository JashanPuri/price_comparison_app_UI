import 'package:flutter/material.dart';
import './models/news_model.dart';
import 'package:price_comparison_app_ui/models/product_model.dart';
import 'package:provider/provider.dart';

import './screens/display_products_screen.dart';
import './screens/home_screen.dart';
import 'screens/techNews.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewsProvider(),
          
          )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          TechNews.routeName: (context) => TechNews(),
          DisplayProductsScreen.routeName: (context) => DisplayProductsScreen()
        },
      ),
    );
  }
}
