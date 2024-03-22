// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:minimalshopapp/components/my_button.dart';
import 'package:minimalshopapp/models/product.dart';
import 'package:minimalshopapp/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({
    super.key,
    required this.product
    });

    // Add to art button pressed
    void addToCart(BuildContext context) {
      // Show a dialog bbox to ask user to confirm to add to cart
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
                context.read<Shop>().addToCart(product);
              },
              child: Text("Yes"),
              ),
          ],
        )
        );
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12)
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
            ),
            width: double.infinity,
            padding: EdgeInsets.all(25),
            child: Icon(Icons.favorite),
            ),
        ),

        SizedBox(height: 25),

        // Product Name
        Text(
          product.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
            ),
          ),

        SizedBox(height: 10),

        // Product description
        Text(
          product.description,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary
            ),
          ),
            ],
          ),

        SizedBox(height: 25),

        // Product Price + Button to Add product to Cart
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(product.price.toStringAsFixed(2)),

            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12)
              ),
              child: IconButton(
                onPressed: () => addToCart(context),
                icon: Icon(Icons.add)
                ),
            )
          ],
        ),

        ],
      ),
    );
  }
}