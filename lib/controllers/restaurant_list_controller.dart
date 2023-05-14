import 'package:get/get.dart';
import 'package:zone/products.dart';
import 'package:zone/widgets/food_tile.dart';

class RestaurantListController extends GetxController {
  final items = Product.getProducts();
  final foodItems = Food.getFood();
  var restaurantList =["Icy Cup", "Golden Pod", "Baba's Special Khebab"];
}