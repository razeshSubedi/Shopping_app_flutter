import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_appv2/providers/cart_provider.dart';

import 'package:shopping_appv2/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CartProvider())],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Playfair',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueGrey,
            primary: const Color.fromARGB(255, 22, 143, 241),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            prefixIconColor: Colors.black87,
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 35,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 15,
            ),
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontFamily: 'PlayFair',
              color: Colors.black,
            ),
            color: const Color.fromARGB(255, 129, 234, 224),
          ),
          useMaterial3: true,
        ),
        title: 'Shopping App',
        home: HomePage(),
      ),
    );
  }
}
