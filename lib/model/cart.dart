import 'cart_item.dart';

///Represents a cart
class Cart {

  List<CartItem> _cartItems = <CartItem>[];

  ///Adds an item to the cart.
  ///[cartItem] the item to add
  void addItem(CartItem cartItem){
    _cartItems.add(cartItem);
  }

  ///Removes an item from cart.
  ///[id] id of item
  void removeItem(int id){
    CartItem cartItem = _cartItems.firstWhere((item) => item.id == id);
    _cartItems.remove(cartItem);
  }

  ///Gets all the cart items.
  ///Returns the list of all cart items.
  List<CartItem> getAllCartItems(){
    return _cartItems;
  }

  ///Gets the amount of items in the cart.
  ///Returns the amount of items.
  int getAmountOfItems(){
    int sum = 0;
    _cartItems.map((e) => e.count).forEach((element) => sum += element);
    return sum;
  }
}