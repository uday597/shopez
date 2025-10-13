import 'package:flutter/material.dart';
import 'package:shopease/project/account_page.dart';

class OrdersProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _orderList = [];
  List<Map<String, dynamic>> get orderList => _orderList;
  Future<void> loadItems() async {
    final user = supabase.auth.currentUser;
    if (user == null) return;
    final response = await supabase
        .from('orders')
        .select('product(*)')
        .eq('user_id', user.id);

    final neworder = await response.map((item) {
      final product = item['product'];
      return {
        'id': product['id'],
        'name': product['name'],
        'url': product['url'],
        'price': product['price'],
        'category': product['category'],
      };
    }).toList();
    final ids = <dynamic>{};
    _orderList = neworder.where((item) => ids.add(item['id'])).toList();
    notifyListeners();
  }

  Future<void> additem(Map<String, dynamic> product) async {
    final user = supabase.auth.currentUser;
    if (user == null) return;
    final alreadyexists = _orderList.any((item) => item['id'] == product['id']);
    if (alreadyexists) {
      return;
    }
    await supabase.from('orders').insert({
      'user_id': user.id,
      'product_id': product['id'],
    });
    _orderList.add({
      'id': product['id'],
      'name': product['name'],
      'url': product['url'],
      'price': product['price'],
      'category': product['category'],
    });
    notifyListeners();
  }

  Future<void> removeitem(Map<String, dynamic> product) async {
    final user = supabase.auth.currentUser;
    if (user == null) return;
    _orderList.removeWhere((item) => item['id'] == product['id']);
    await supabase.from('orders').delete().match({
      'user_id': user.id,
      'product_id': product['id'],
    });
    notifyListeners();
  }
}
