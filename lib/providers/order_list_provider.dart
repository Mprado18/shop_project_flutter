import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shop/models/order.dart';
import 'package:shop/providers/cart_provider.dart';

class OrderListProvider with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void addNewOrder(CartProvider cart) {
    _items.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        total: cart.totalAmout,
        products: cart.items.values.toList(),
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
