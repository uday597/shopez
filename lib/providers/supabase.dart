import 'package:flutter/material.dart';
import 'package:newproject/project/account_page.dart';

class SupaProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _list = [];
  List<Map<String, dynamic>> get list => _list;

  bool _isloading = true;
  bool get isloading => _isloading;
  Future<void> fatchdata() async {
    final response = await supabase.from('product').select();
    _isloading = false;
    _list = response;
    notifyListeners();
  }
}
