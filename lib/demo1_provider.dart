import 'package:flutter/cupertino.dart';

class prov with ChangeNotifier{

  bool func(bool n){

    n = !n;
    notifyListeners();
    return n;
  }

 }