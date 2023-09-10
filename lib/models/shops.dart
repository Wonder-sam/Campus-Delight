class Shop {
  final String shopName;
  final String shopImage;

  Shop(
    this.shopName,
    this.shopImage,
  );

  static List<Shop> getShops() {
    List<Shop> shops = [
      Shop("Pies", "assets/images/fishpie.jpg"),
      Shop("Cakes", "assets/images/meatpies.jpg"),
      Shop("Rolls", "assets/images/lemoncake.jpg"),
    ];
    return shops;
  }
}
