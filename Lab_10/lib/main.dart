import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/user_provider.dart';
import 'providers/product_provider.dart';
import 'providers/cart_provider.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(const FirstShopApp());
}

class FirstShopApp extends StatelessWidget {
  const FirstShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "First Shop",

        theme: ThemeData(
          fontFamily: "Georgia",

          scaffoldBackgroundColor: const Color(0xffF5F5F7),

          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff4A44B2),
          ),

          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
          ),

          cardTheme: CardThemeData(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),

        home: const LoginScreen(),
      ),
    );
  }
}