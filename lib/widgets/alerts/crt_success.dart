import 'package:flutter/material.dart';
import 'package:pin_authentication_2/providers/address_push_provider.dart';
import 'package:pin_authentication_2/providers/pin_provider.dart';
import 'package:provider/provider.dart';

crtSuccessAlertDialog(BuildContext context, String text) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(text),
          actions: [
            TextButton(
                onPressed: () {
                  context.read<AddressPush>().push(context, '/');
                  context.read<PinProvider>().reset();
                },
                child: Text('Ok'))
          ],
        );
      });
}