import 'package:flutter/material.dart';
import 'package:shopease/modal/modal_class.dart';
import 'package:shopease/project/account_page.dart';

class CartProviders with ChangeNotifier {
  List<Product> _itemList = [];

  List<Product> get itemList => _itemList;

  Future<void> loadItems() async {
    final user = supabase.auth.currentUser;
    if (user == null) return;
    final response = await supabase
        .from('cart')
        .select('quantity,product(*)')
        .eq('user_id', user.id);

    _itemList = (response as List).map((item) {
      final product = Product.fromMap(item['product']);
      product.quantity = item['quantity'];
      return product;
    }).toList();
    // _itemList = response.map((item) {
    //   final product = item['product'];
    //   return {
    //     'id': product['id'],
    //     'name': product['name'],
    //     'url': product['url'],
    //     'price': product['price'],
    //     'quantity': item['quantity'],
    //   };
    // }).toList();

    notifyListeners();
  }

  Future<void> removeItem(Product product) async {
    final user = supabase.auth.currentUser;
    if (user == null) return;
    _itemList.remove(product);
    await supabase.from('cart').delete().match({
      'user_id': user.id,
      'product_id': product.id,
    });
    notifyListeners();
  }

  void clearItem() {
    _itemList.clear();
    notifyListeners();
  }

  Future<void> addItem(Product product) async {
    final user = supabase.auth.currentUser;
    if (user == null) return;
    final index = _itemList.indexWhere((item) => item.name == product.name);

    if (index != -1) {
      _itemList[index].quantity++;
      await supabase
          .from('cart')
          .update({'quantity': _itemList[index].quantity})
          .match({'user_id': user.id, 'product_id': product.id});
    } else {
      product.quantity = 1;
      _itemList.add(product);

      await supabase.from('cart').insert({
        'user_id': user.id,
        'product_id': product.id,
        'quantity': 1,
      });
    }

    notifyListeners();
  }

  Future<void> incrementQuantity(Product producsts) async {
    final user = supabase.auth.currentUser;
    if (user == null) return;
    final index = _itemList.indexWhere((item) => item.name == producsts.name);
    _itemList[index].quantity++;
    await supabase
        .from('cart')
        .update({'quantity': _itemList[index].quantity})
        .match({'user_id': user.id, 'product_id': producsts.id});
    notifyListeners();
  }

  Future<void> decrementQuantity(Product products) async {
    final user = supabase.auth.currentUser;
    if (user == null) return;
    final index = _itemList.indexWhere((item) => item.name == products.name);

    if (index != -1) {
      int currentQuantity = _itemList[index].quantity;

      if (currentQuantity > 1) {
        _itemList[index].quantity = currentQuantity - 1;
      } else {
        _itemList.removeAt(index);
      }
    }
    await supabase
        .from('cart')
        .update({'quantity': _itemList[index].quantity})
        .match({'user_id': user.id, 'product_id': products.id});
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
