// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:minimalshopapp/models/shop.dart';
import 'package:minimalshopapp/pages/cart_page.dart';
import 'package:minimalshopapp/pages/intro_page.dart';
import 'package:minimalshopapp/pages/shop_page.dart';
import 'package:minimalshopapp/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
      )
    );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightMode, // Making a theme in a seperate file without calling the theme in the MaterialApp() wilk result to other widgets using the default theme
      routes: {
        '/intro_page':(context) => IntroPage(),
        '/shop_page':(context) => ShopPage(),
        '/cart_page':(context) => CartPage(),
      },
    );
  }
}