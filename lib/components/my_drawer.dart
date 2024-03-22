// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:minimalshopapp/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // Drawer header: : Logo
            DrawerHeader(
              child: Icon(
                Icons.shopping_bag,
                size: 72,
                color: Theme.of(context).colorScheme.inversePrimary,
                )
              ),

              SizedBox(height: 25),
        
            // Shop tile
            MyListTile(
              text: "Shop", 
              icon: Icons.home, 
              onTap: () => Navigator.pop(context),
              ),
        
            // Cart tile
            MyListTile(
              text: "Cart", 
              icon: Icons.shopping_cart, 
              onTap: () {
                // Pop drawer first
                Navigator.pop(context);

                // Navigate to cart page
                Navigator.pushNamed(context, '/cart_page');
              },
              ),
              ],
            ),
        
            // Exit shop tile
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: MyListTile(
                text: "Exit", 
                icon: Icons.logout, 
                onTap: () {
                  // Pop drawer first
                  Navigator.pop(context);

                  // Navigate back to intro page
                  Navigator.pushNamedAndRemoveUntil(context, '/intro_page', (route) => false);
                },
                ),
            ),

          ],
        ),
      ),
    );
  }
}