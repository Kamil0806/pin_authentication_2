import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_authentication_2/widgets/alerts/auth_success.dart';
import 'package:pin_authentication_2/widgets/alerts/auth_failure.dart';
import 'package:pin_authentication_2/widgets/alerts/crt_failure.dart';
import 'package:pin_authentication_2/widgets/alerts/crt_success.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pin_authentication_2/globals.dart' as globals;

class PinProvider with ChangeNotifier{



  int selectedIndex = 0;
  String code = '';
  String checkCode = '';
  String enterText = 'Create PIN';
  bool isCrt = false;

  void setPin() async{
    final prefs = await SharedPreferences.getInstance();
    globals.pinCode = prefs.getString('pin')!;
    print(prefs.getString('pin'));
  }

  void savePin(String pin) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('pin', pin);
    globals.pinCode = pin;
  }

  void tap(BuildContext context, String digit){
    if (!isCrt) {
      if (code.length < 4) {
        code += digit;
        selectedIndex = code.length;
      }

      if (code.length == 4) {
        if (code == globals.pinCode) {
          authSuccessAlertDialog(context, 'Authentication success');
        } else {
          authFailAlertDialog(context, 'Authentication failed');
        }
      }
    } else {
      if (code.length < 4) {
        code += digit;
        selectedIndex = code.length;
      }

      if (code.length == 4 && checkCode.isNotEmpty){
        if (code == checkCode){
          savePin(code);
          crtSuccessAlertDialog(context, 'Your PIN code is successfully created');
          isCrt = false;
          reset();
        } else{
          crtFailAlertDialog(context, 'PINs differ. Try again');
          reset();
        }
      }

      if (code.length == 4) {
        checkCode = code;
        code = '';
        selectedIndex = 0;
        enterText = 'Re-enter PIN';
      }

    }
    notifyListeners();
  }

  void dltTap() {
    if (code.isNotEmpty) {
      code = code.substring(0, code.length - 1);
    }
    notifyListeners();
  }

  void isCrtEnable(){
    isCrt = !isCrt;
    notifyListeners();
  }

  void reset(){
    code = '';
    checkCode = '';
    selectedIndex = 0;
    enterText = 'Create PIN';

    notifyListeners();
  }

}