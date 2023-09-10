class Carousel {
  final String productName;
  final String productImage;
  final double productPrice;
  final String productCategory;

  Carousel(
    this.productName,
    this.productImage,
    this.productPrice,
    this.productCategory,
  );

  static List<Carousel> getCarousel() {
    List<Carousel> carousel = [
      Carousel("Meat Pie", "assets/images/meatpies.jpg", 24.5, "Pies"),
      Carousel("Banana Cake", "assets/images/BananaCake.jpg", 24.5, "Cakes"),
      Carousel("Carrot Cake", "assets/images/CarrotCake.jpg", 24.5, "Cakes"),
      Carousel("Chocolate Cake", "assets/images/chococakes.jpg", 24.5, "Cakes"),
    ];
    return carousel;
  }
}
