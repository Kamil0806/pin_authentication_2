import 'package:flutter/material.dart';
import 'package:pin_authentication_2/providers/pin_provider.dart';
import 'package:provider/provider.dart';


crtFailAlertDialog(BuildContext context, String text) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(text),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<PinProvider>().reset();
                },
                child: Text('Ok'))
          ],
        );
      });
}