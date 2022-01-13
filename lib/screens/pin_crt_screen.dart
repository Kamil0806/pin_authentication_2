import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pin_authentication_2/providers/pin_provider.dart';
import 'package:pin_authentication_2/providers/address_push_provider.dart';
import 'package:pin_authentication_2/globals.dart' as globals;
import 'package:pin_authentication_2/widgets/pin_pad_cells.dart';

class PinCrtScreen extends StatelessWidget {
  const PinCrtScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String enterText = context.watch<PinProvider>().enterText;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  context.read<AddressPush>().push(context, '/');
                  context.read<PinProvider>().reset();
                  context.read<PinProvider>().isCrtEnable();
                },
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20)
            ),

            Spacer(),

            const SizedBox(width: 55),
            const Text(
                'Setup PIN',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
            ),

            Spacer(),

            const Text(
                'Use 6-digit PIN',
                style: TextStyle(color: globals.fontColor, fontSize: 14)
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Spacer(),
            Text(
                enterText,
                style: const TextStyle(
                    fontSize: 25,
                    color: globals.fontColor)),

            Spacer(),

            PinPadCells(),
          ],
        ),
      ),
    );
  }
}