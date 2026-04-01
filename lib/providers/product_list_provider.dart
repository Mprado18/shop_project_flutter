import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shop/data/products_mock.dart';
import 'package:shop/models/product.dart';

class ProductListProvider with ChangeNotifier {
  List<Product> _products = productsMock;

  List<Product> get products => [..._products];
  List<Product> get favoriteProducts =>
      _products.where((product) => product.isFavorite).toList();

  int get itemsCount {
    return products.length;
  }

  void saveProduct(Map<String, Object> data) {
    bool hasId = data['id'] != null;

    final product = Product(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      name: data['name'] as String,
      description: data['description'] as String,
      price: data['price'] as double,
      imageUrl: data['imageUrl'] as String,
    );

    if (hasId) {
      updateProduct(product);
    } else {
      addProduct(product);
    }
  }

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void updateProduct(Product product) {
    int index = _products.indexWhere((p) => p.id == product.id);

    if (index >= 0) {
      _products[index] = product;
      notifyListeners();
    }
  }

  void removeProduct(Product product) {
    int index = _products.indexWhere((p) => p.id == product.id);

    if (index >= 0) {
      _products.removeWhere((p) => p.id == product.id);
      notifyListeners();
    }
  }
}
