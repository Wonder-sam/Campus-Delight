class CartItem {
  final String productName;
  final String productImage;
  final double productPrice;
  final String shop;

  CartItem(
    this.productName,
    this.productImage,
    this.productPrice,
    this.shop,
  );

  static List<CartItem> getCartProducts() {
    List<CartItem> cartItems = [
      CartItem("Fish Pie", "assets/images/fishpie.jpg", 24.5, "Pies"),
      CartItem("Meat Pie", "assets/images/meatpies.jpg", 24.5, "Pies"),
      CartItem("Banana Cake", "assets/images/BananaCake.jpg", 24.5, "Cakes"),
      CartItem("Lemon Cake", "assets/images/lemoncake.jpg", 24.5, "Cakes"),
      CartItem("Carrot Cake", "assets/images/CarrotCake.jpg", 24.5, "Cakes"),
      CartItem("Chocolate Cake", "assets/images/chococakes.jpg", 24.5, "Cakes"),
      CartItem("CupCake", "assets/images/cupcakes.jpg", 24.5, "Cakes"),
    ];
    return cartItems;
  }
}
