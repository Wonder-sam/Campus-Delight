import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zone/models/cart.dart';

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]) {
    getCartItems();
  }

  void getCartItems() {
    state = CartItem.getCartProducts();
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) => CartNotifier());
