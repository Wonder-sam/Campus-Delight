class RestaurantMenu {
  final String menuFood;
  final String menuImage;

  RestaurantMenu(this.menuFood, this.menuImage);

  static Map getMenu(){
    var menu ={
      "Pepe": [
        RestaurantMenu("jollof", "product0.jpeg"),
        RestaurantMenu("waakye","product1.jpeg"),
      ],
      "Peprah": [
          RestaurantMenu("Jollof", "product2.jpeg"),
          RestaurantMenu("waakye", "product3.jpeg"),
      ],
      "third": [
         RestaurantMenu("Jollof", "product4.jpeg"),
         RestaurantMenu("waakye", "product5.jpeg"),
      ],
      "fourth": [
        RestaurantMenu("Jollof", "product6.jpeg"),
        RestaurantMenu("waakye", "product7.jpeg"),
      ],
      "fifth":[
        RestaurantMenu("Jollof", "product8.jpeg"),
        RestaurantMenu("waakye", "product0.jpeg"),
      ],
      "sixth":[
        RestaurantMenu( "Jollof", "product1.jpeg"),
        RestaurantMenu("waakye", "product2.jpeg")
      ],
      "seventh":[
        RestaurantMenu("Jollof", "product3.jpeg"),
        RestaurantMenu("waakye", "product4.jpeg")
      ],
      "eigth":[
        RestaurantMenu("Jollof", "product5.jpeg"),
        RestaurantMenu("waakye", "product6.jpeg"),
      ]
    };
    return menu;
  }

}