import 'package:flutter/material.dart';

import '../project/account_page.dart';

class WishlistProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _wishlist = [];
  List<Map<String, dynamic>> get wishlist => _wishlist;

  Future<void> loadItems() async {
    final user = supabase.auth.currentUser;
    if (user == null) return;
    final response = await supabase
        .from('wishlist')
        .select('product(*)')
        .eq('user_id', user.id);

    final newWishlist = response.map((item) {
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
    _wishlist = newWishlist.where((item) => ids.add(item['id'])).toList();
    notifyListeners();
  }

  Future<void> additem(Map<String, dynamic> product) async {
    final user = supabase.auth.currentUser;
    if (user == null) return;
    final alreadyexist = _wishlist.any((item) => item['id'] == product['id']);
    if (alreadyexist) {
      return;
    }
    await supabase.from('wishlist').insert({
      'user_id': user.id,
      'product_id': product['id'],
    });
    _wishlist.add({
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
    _wishlist.removeWhere((item) => item['id'] == product['id']);
    await supabase.from('wishlist').delete().match({
      'user_id': user.id,
      'product_id': product['id'],
    });
    notifyListeners();
  }

  bool isInWishlist(String id) {
    return _wishlist.any((item) => item['id'].toString() == id);
  }
}
