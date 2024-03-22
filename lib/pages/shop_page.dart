// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:minimalshopapp/components/my_drawer.dart';
import 'package:minimalshopapp/components/my_product_tile.dart';
import 'package:minimalshopapp/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    
    // Access products in ShopPage
  final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Shop Page"),
        actions: [
          // Go to cart
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_page'), 
            icon: Icon(Icons.shopping_cart_outlined)
            )
        ],
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [

          // Shop subtitle
          Center(
            child: Text(
              "Where all your apparel needs are met",
              style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
              )
            ),

          // product List
          SizedBox(
          height: 550,
          child: ListView.builder(
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(15),
          itemBuilder: (context, index) {
            // get each individual product from the shop
            final product = products[index];
            // return as a product tile UI
            return MyProductTile(product: product);
        }),
      ),
        ],
      ),
    );
  }
}