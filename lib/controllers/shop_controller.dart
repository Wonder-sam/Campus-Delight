import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zone/models/cart.dart';

class ShopNotifier extends StateNotifier<Set<String>> {
  ShopNotifier() : super({}) {
    getCartShops();
  }

  void getCartShops() {
    List<CartItem> cartItems = CartItem.getCartProducts();
    Set<String> shops = {};
    for (int count = 0; count < cartItems.length; count++) {
      if (!shops.contains(cartItems[count].shop)) {
        shops.add(cartItems[count].shop);
      }
    }
    state = shops;
  }
}

final shopProvider = StateNotifierProvider<ShopNotifier, Set<String>>((ref) => ShopNotifier());
