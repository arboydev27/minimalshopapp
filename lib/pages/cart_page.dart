// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:minimalshopapp/components/my_button.dart';
import 'package:minimalshopapp/models/product.dart';
import 'package:minimalshopapp/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // Remove item from the cart
  void removeFromCart(BuildContext context, Product product){
    // Show a dialog bbox to ask user to remove from to cart
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          content: Text("Add this item to your cart?"),
          actions: [
            // Cancel
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
              ),

            // Yes
            MaterialButton(
              onPressed: () {
                // pop box
                Navigator.pop(context);

                // Add to cart
                context.read<Shop>().removeFromCart(product);
              },
              child: Text("Yes"),
              ),
          ],
        )
        );
  }

  // user pressed pay button
  void payButtonPressed(BuildContext context){
    // Show a dialog bbox to ask user to remove from to cart
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          content: Text("Add payment capabilities"),
        )
        );
  }

  @override
  Widget build(BuildContext context) {

    // Access the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // Cart list
          Expanded(
            child: cart.isEmpty ? Center(child: Text("Your cart is empty")) 
            : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                // get individual items in the cart
                final item = cart[index];

                // return as a cart tile UI
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: IconButton(
                    onPressed: () => removeFromCart(context, item), 
                    icon: Icon(Icons.remove)
                    ),
                );
              }
              )
            ),

          // Pay button at the bottom
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: MyButton(
              onTap: () => payButtonPressed(context), 
              child: Text(
                "Pay now",
                style: TextStyle(fontWeight: FontWeight.bold),
                )
              ),
          ),
          
        ],),
    );
  }
}