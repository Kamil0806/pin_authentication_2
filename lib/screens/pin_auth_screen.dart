import 'package:flutter/material.dart';
import 'package:pin_authentication_2/widgets/pin_pad_cells.dart';
import 'package:pin_authentication_2/globals.dart' as globals;

class PinAuthScreen extends StatelessWidget {
  const PinAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    double width = size.width * 0.99;
    double height = size.height;

    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: width,
              height: height * 0.08,
            ),
            Text('Enter your PIN', style: TextStyle(fontSize: 25, color: globals.fontColor)),

            Spacer(),
            PinPadCells(),
          ],
        )
      )
    );
  }
}