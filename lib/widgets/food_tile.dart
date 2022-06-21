import 'package:flutter/material.dart';

class Food{
  final String image;
  final String name;

  Food(this.image, this.name);

  static List<Food> getFood(){
    List<Food> items = [];
    items.add(Food("product0.jpeg", "first"));
    items.add(Food("product1.jpeg", "second"));
    items.add(Food("product2.jpeg", "third"));
    items.add(Food("product3.jpeg", "fourth"));
    items.add(Food("product4.jpeg", "fifth"));
    items.add(Food("product5.jpeg", "sixth"));
    items.add(Food("product6.jpeg", "seventh"));
    items.add(Food("product7.jpeg", "eight"));
    return items;
  }
}

class FoodItem extends StatelessWidget{
  const FoodItem({Key? key, required this.foodItem}) : super(key: key);
  final Food foodItem;

  @override
  Widget build(BuildContext context){
    return Card(
      color: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child:Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.48,
            padding: const EdgeInsets.all(0),
            child: Image.asset("assets/"+foodItem.image, fit: BoxFit.contain, height: double.maxFinite,),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 45,
                child: Column(
                  children: [
                    Text(foodItem.name),
                    const Text("class")
                  ]
                )
              )
            )
          ),
        ]
      )
    );
  }
}

class FoodOffer {
  final String name;
  final double price;
  final String image;
  FoodOffer(this.name, this.price, this.image);

  static Map getFoodOffers(){
    var foodOffers ={
      "first": {
        "Jollof":[
        
      ]
      }
    };
    return foodOffers;
  }
}