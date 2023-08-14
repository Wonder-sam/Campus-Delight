class Product {
  final String productName;
  final String productImage;
  final double productPrice;
  final String productCategory;

  Product(
    this.productName,
    this.productImage,
    this.productPrice,
    this.productCategory,
  );

  static List<Product> getProducts() {
    List<Product> products = [
      Product("Fish Pie", "assets/images/fishpie.jpg", 24.5, "Pies"),
      Product("Meat Pie", "assets/images/meatpies.jpg", 24.5, "Pies"),
      Product("Banana Cake", "assets/images/BananaCake.jpg", 24.5, "Cakes"),
      Product("Lemon Cake", "assets/images/lemoncake.jpg", 24.5, "Cakes"),
      Product("Carrot Cake", "assets/images/CarrotCake.jpg", 24.5, "Cakes"),
      Product("Chocolate Cake", "assets/images/chococakes.jpg", 24.5, "Cakes"),
      Product("CupCake", "assets/images/cupcakes.jpg", 24.5, "Cakes"),
    ];
    return products;
  }
}
