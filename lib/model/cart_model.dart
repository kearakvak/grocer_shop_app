import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //list of items on sale
  final List _shopItems = [
    //[ itemName, itemPrice, imagePath, color]
    ["CocaCola", "3.00", "assets/images/1-40.png", Colors.red],
    ["Vital", "0.50", "assets/images/1.png", Colors.blue],
    ["FANTA", "0.50", "assets/images/1256x800-fanta-330ml.webp", Colors.yellow],
    ["Sprite", "0.75", "assets/images/sprite-0.5-newest.png", Colors.green],
    [
      "Big Sprite",
      "1.00",
      "assets/images/Sprite-Original-282x700.webp",
      Colors.brown
    ],
    [
      "PePsi",
      "1.50",
      "assets/images/10140868EA-checkers515Wx515H.png",
      Colors.pink
    ],
    [
      "Small CocaCola",
      "0.25",
      "assets/images/coca-cola-original-20oz.png",
      Colors.purple
    ],
  ];
//List of cart items
  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
