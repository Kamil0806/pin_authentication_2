import 'package:flutter/material.dart';
import 'package:pin_authentication_2/widgets/menu_btn.dart';
import 'package:pin_authentication_2/providers/pin_provider.dart';
import 'package:provider/provider.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PinProvider>().setPin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomBtn(path: '/pin-create', text: 'Create PIN'),

            const SizedBox(height: 15),

            CustomBtn(path: '/pin-auth', text: 'PIN auth'),
          ],
        )
      ),
    );
  }
}
