import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newproject/modal/modal_class.dart';

class CartProviders with ChangeNotifier {
  final List<Product> _itemList = [];

  List<Product> get itemList => _itemList;

  Future<void> loadItems() async {
    // final storage = await Hive.openBox('myBox');
    // final List<dynamic>? savedItems = storage.get('items');

    // if (savedItems != null) {
    //   _itemList.clear();
    // }
    notifyListeners();
  }

  void removeItem(Product product) {
    _itemList.remove(product);
    notifyListeners();
  }

  void clearItem() {
    _itemList.clear();
    notifyListeners();
  }

  void addItem(Product product) async {
    final storage = await Hive.openBox('myBox');

    final index = _itemList.indexWhere((item) => item.name == product.name);

    if (index != -1) {
      _itemList[index].quantity++;
    } else {
      product.quantity = 1;
      _itemList.add(product);
    }
    storage.put('items', _itemList);

    notifyListeners();
  }

  void incrementQuantity(Product producsts) {
    final index = _itemList.indexWhere((item) => item.name == producsts.name);
    _itemList[index].quantity++;
    notifyListeners();
  }

  void decrementQuantity(Product products) {
    final index = _itemList.indexWhere((item) => item.name == products.name);

    if (index != -1) {
      int currentQuantity = _itemList[index].quantity;

      if (currentQuantity > 1) {
        _itemList[index].quantity = currentQuantity - 1;
      } else {
        _itemList.removeAt(index);
      }
    }
    notifyListeners();
  }

  double get totalPrice {
    double total = 0.0;
    for (var item in _itemList) {
      double price = item.price;
      int quantity = item.quantity;
      total += price * quantity;
    }
    return double.parse(total.toStringAsFixed(2));
  }
}
