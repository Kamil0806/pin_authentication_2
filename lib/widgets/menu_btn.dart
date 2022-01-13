import 'package:flutter/material.dart';
import 'package:pin_authentication_2/providers/pin_provider.dart';
import 'package:provider/provider.dart';
import 'package:pin_authentication_2/providers/address_push_provider.dart';
import 'package:pin_authentication_2/globals.dart' as globals;

class CustomBtn extends StatelessWidget {

  String text;
  String path;

  CustomBtn({required this.path, required this.text});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = size.width / 2.5;
    double height = size.height / 15;
    return Container(
      alignment: Alignment.center,
      child:
        RawMaterialButton(
          padding: const EdgeInsets.all(0.0),
          constraints: BoxConstraints.tight(Size(width, height)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: const BorderSide(color: globals.fontColor, width: 2)
          ),
          onPressed: () {

            if (globals.pinCode.isEmpty && text == 'PIN auth') {
              return;
            }else{
              if (text == 'Create PIN') {
                context.read<PinProvider>().isCrtEnable();
              }
              context.read<AddressPush>().push(context, path);
            }
          },
          child: Text(
              text,
              style: const TextStyle(fontSize: 12, color: globals.fontColor),
          )
        )
    );
  }

}
