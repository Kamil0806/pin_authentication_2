import 'package:flutter/cupertino.dart';

class AddressPush with ChangeNotifier{

  void push(BuildContext context, String path){
    Navigator.pushNamed(context, path);
    notifyListeners();
  }

}