import 'package:flutter/material.dart';
import 'package:shopease/modal/modal_class.dart';
import 'package:shopease/project/account_page.dart';

class SupaProvider extends ChangeNotifier {
  List<Product> _list = [];
  List<Product> get list => _list;

  bool _isloading = true;
  bool get isloading => _isloading;
  Future<void> fatchdata() async {
    final response = await supabase.from('product').select();
    if (response.isNotEmpty) {
      _list = (response as List)
          .map((item) => Product.fromMap(item as Map<String, dynamic>))
          .toList();
    }
    _isloading = false;

    notifyListeners();
  }
}
