import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_authentication_2/globals.dart' as globals;
import 'package:provider/provider.dart';
import 'package:pin_authentication_2/providers/pin_provider.dart';

class PinPadCells extends StatelessWidget {
  const PinPadCells({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height / 1.2;
    String code = context.watch<PinProvider>().code;
    int selectedIndex = context.watch<PinProvider>().selectedIndex;
    return Container(
      width: width,
      height: height,
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PinCell(selectedIndex: selectedIndex, width: width, index: 0, code: code),
              PinCell(selectedIndex: selectedIndex, width: width, index: 1, code: code),
              PinCell(selectedIndex: selectedIndex, width: width, index: 2, code: code),
              PinCell(selectedIndex: selectedIndex, width: width, index: 3, code: code)
            ]
          ),

          Spacer(),

          Container(
            width: width,
            height: height / 1.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PinBtn(value: '1'),
                    PinBtn(value: '2'),
                    PinBtn(value: '3'),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PinBtn(value: '4'),
                    PinBtn(value: '5'),
                    PinBtn(value: '6'),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PinBtn(value: '7'),
                    PinBtn(value: '8'),
                    PinBtn(value: '9'),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    PinBtn(value: '0'),
                    const Expanded(
                        child: PinDltBtn()
                    )
                  ],
                ),
              ]
            )
          )
        ],
      )
    );
  }
}

class PinBtn extends StatelessWidget {

  final String value;
  PinBtn({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextButton(
          onPressed: () {
            context.read<PinProvider>().tap(context, value);
          },
          child: Text(
              value,
              style: const TextStyle(
                  fontSize: 25,
                  color: globals.fontColor)
          )
        )
    );
  }
}

class PinDltBtn extends StatelessWidget {
  const PinDltBtn({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextButton(
            onPressed: () {
              context.read<PinProvider>().dltTap();
            },
            child: const Icon(Icons.backspace, color: globals.fontColor)
        )
    );
  }
}

class PinCell extends StatelessWidget {

  final int selectedIndex;
  final int index;
  final String code;
  const PinCell({
    required this.selectedIndex,
    Key? key,
    required this.width,
    required this.index,
    required this.code,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: width * 0.04,
      width: width * 0.04,
      margin: const EdgeInsets.only(right: 20, left: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: globals.fontColor),
          shape: BoxShape.circle,
      ),
      child: code.length > index
          ? Container(
        width: width * 0.04,
        height: width * 0.04,
        decoration: const BoxDecoration(
          color: globals.fontColor,
          shape: BoxShape.circle,
        ),
      )
          : Container(),
    );
  }
}



