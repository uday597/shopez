import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WishlistProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _wishlist = [];
  List<Map<String, dynamic>> get wishlist => _wishlist;
  bool _isloading = true;
  bool get isloading => _isloading;

  Future<void> fatchdata() async {
    final supabase = Supabase.instance.client;
    final response = await supabase.from('product').select();
    _isloading = false;
    _wishlist = response;
    notifyListeners();
  }

  void removeproduct(Map<String, dynamic> product) {
    _wishlist.remove(product);
    notifyListeners();
  }

  void addproduct(Map<String, dynamic> product) {
    _wishlist.add(product);
    notifyListeners();
  }
}
