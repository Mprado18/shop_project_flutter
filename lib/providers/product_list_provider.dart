import 'package:flutter/material.dart';
import 'package:shop/data/products_mock.dart';
import 'package:shop/models/product.dart';

class ProductListProvider with ChangeNotifier {
  List<Product> _products = productsMock;

  List<Product> get products => [..._products];
  List<Product> get favoriteProducts =>
      _products.where((product) => product.isFavorite).toList();

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }
}
