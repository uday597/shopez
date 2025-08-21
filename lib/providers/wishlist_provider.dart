import 'package:flutter/material.dart';

import 'package:newproject/modal/modal_class.dart';

class WishlistProvider extends ChangeNotifier {
  final List<Product> _wishlist = [];
  List<Product> get wishlist => _wishlist;

  void removeproduct(Product product) {
    _wishlist.remove(product);
    notifyListeners();
  }

  void addproduct(Product product) {
    if (!_wishlist.contains(product)) {
      _wishlist.add(product);
      notifyListeners();
    }
  }
}
