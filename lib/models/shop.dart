
// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:minimalshopapp/models/product.dart';

class Shop extends ChangeNotifier {
  // List of products for sale
  List<Product> _shop = [
    //Product 1
    Product(
      name: "Product 1", 
      price: 149.99, 
      //description: "The most premium product you'll need in your daily endevours",
      description: "The most premium..." 
      //imagePath: icon
      ),

      //Product 2
    Product(
      name: "Product 2", 
      price: 149.99, 
      //description: "The most premium product you'll need in your daily endevours", 
      description: "The most premium..." 
      //imagePath: icon
      ),

      //Product 3
    Product(
      name: "Product 3", 
      price: 149.99, 
      //description: "The most premium product you'll need in your daily endevours", 
      description: "The most premium..." 
      //imagePath: icon
      ),

      //Product 4
    Product(
      name: "Product 4", 
      price: 149.99, 
      //description: "The most premium product you'll need in your daily endevours", 
      description: "The most premium..." 
      //imagePath: icon
      ),

      //Product 5
    Product(
      name: "Product 5", 
      price: 149.99, 
      //description: "The most premium product you'll need in your daily endevours",
      description: "The most premium..."  
      //imagePath: icon
      )
  ];

  // List of products in cart
  List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  // get user cart list
  List<Product> get cart => _cart;

  // add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  } 

  // remove item from cart
  void removeFromCart(Product item){
    _cart.remove(item);
    notifyListeners();
  }
}