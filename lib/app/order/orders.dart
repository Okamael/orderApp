import 'package:flutter/material.dart';
import 'package:order_app/app/model/product.dart';

class Orders with ChangeNotifier {
  List<Product> _productsList = [];

  List<Product> get products {
    return [..._productsList];
  }

  int get itemsCount => _productsList.length;

  Product productByIndex(int index) => _productsList[index];

  void addProduct(Product product) {
    _productsList.add(product);

    notifyListeners();
  }
}
