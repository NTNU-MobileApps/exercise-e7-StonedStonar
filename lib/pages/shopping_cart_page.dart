import 'package:exercise_e7/main.dart';
import 'package:exercise_e7/model/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/cart.dart';
import '../widgets/cart_item_card.dart';

/// Represents the "Shopping cart" page
class ShoppingCartPage extends ConsumerStatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);
  static const emptyCartMessage = "The cart is empty";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShoppingCartPageState();

}

class _ShoppingCartPageState extends ConsumerState<ShoppingCartPage> {

  /// Build a list of cards, displaying the items currently in the cart
  List<Widget> _buildCartItems() {
    Cart cart = ref.watch(cartState);
    List<CartItemCard> shoppingCartItems = [];
    cart.getAllCartItems().forEach((element) => shoppingCartItems.add(CartItemCard(element, onDelete)));
    return shoppingCartItems;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cartItems = _buildCartItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: cartItems.isEmpty ? [const Text(ShoppingCartPage.emptyCartMessage)] : cartItems,
        ),
      ),
    );
  }

  ///Updates the current list og products.
  void onDelete(){
    setState(() {

    });
  }
}

