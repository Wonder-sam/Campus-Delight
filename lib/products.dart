class Product{
  final String image;
  final String name;

  Product(this.image, this.name);

  static List<Product> getProducts(){
    List<Product> items = [];
    items.add(Product("product0.jpeg", "first"));
    items.add(Product("product1.jpeg", "second"));
    items.add(Product("product2.jpeg", "third"));
    items.add(Product("product3.jpeg", "fourth"));
    items.add(Product("product4.jpeg", "fifth"));
    items.add(Product("product5.jpeg", "sixth"));
    items.add(Product("product6.jpeg", "seventh"));
    items.add(Product("product7.jpeg", "eight"));
    return items;
  }
}