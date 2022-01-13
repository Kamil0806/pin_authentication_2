import 'package:flutter/material.dart';
import 'package:pin_authentication_2/providers/pin_provider.dart';
import 'package:pin_authentication_2/screens/main_screen.dart';
import 'package:pin_authentication_2/screens/pin_auth_screen.dart';
import 'screens/pin_crt_screen.dart';
import 'package:provider/provider.dart';
import 'package:pin_authentication_2/providers/address_push_provider.dart';

void main() {
  runApp(

    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AddressPush()),
        ChangeNotifierProvider(create: (_) => PinProvider()),
      ],
      child: const PinAuthApp(),
    ),
  );
}

class PinAuthApp extends StatelessWidget {
  const PinAuthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/pin-create': (context) => PinCrtScreen(),
        '/pin-auth': (context) => PinAuthScreen(),
      }
    );
  }
}

