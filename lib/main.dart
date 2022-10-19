import 'package:exercise_e7/model/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model/cart.dart';
import 'pages/product_page.dart';

void main() {
  runApp(const MyApp());
}

final selectedState = StateProvider<String?>((ref) {
  return "";
});

final cartState = StateProvider<Cart>((ref) {
  return Cart();
});

/// Entrypoint for the application
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
          title: 'Exercise E7',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const ProductPage(),
        ),
    );
  }
}
