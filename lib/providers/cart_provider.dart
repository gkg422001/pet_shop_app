import 'package:flutter/material.dart';
import 'package:pet_shop_app/products_list.dart';

class CartProvider extends ChangeNotifier {
  final List<Cat> _items = [];

  List<Cat> get items => _items;

  void add(Cat item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(Cat item) {
    _items.remove(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  List<Cat> getAllCats() {
    return _items;
  }

  // double getCartTotal() {
  //   return _items.fold(0, (previousValue, item) => previousValue + item.price);
  // }
}
