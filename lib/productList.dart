import 'package:flutter/material.dart';
import 'products.dart';
import 'food.dart';
import 'restaurants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductList extends StatefulWidget{
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}
class _ProductListState extends State<ProductList>{
  final items = Product.getProducts();
  final foodItems = Food.getFood();

  bool _foodOrRestaurant = true;

  void switchTab(bool tab){
    setState((){
      _foodOrRestaurant = tab;
    });
  }
  
  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: const Padding(
                  padding: EdgeInsets.only(top:10, bottom: 10, left: 20, right: 20),
                  child:  Text(
                    "Restaurants",
                    style: TextStyle(
                      fontFamily: "Times New Roman"
                    )
                  )
                )
              ),
              onTap: () {switchTab(true);},
            ),
            GestureDetector(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: const Padding(
                  padding: EdgeInsets.only(top:10, bottom: 10, left: 20, right: 20),
                  child:  Text(
                    "Food",
                    style: TextStyle(
                      fontFamily: "Times New Roman"
                    )
                  )
                )
              ),
              onTap: () {switchTab(false);},
            )
          ],
        ),
        Expanded(
          child: _foodOrRestaurant == true? StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("restaurants").doc("restaurant").collection("restaurantList").snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData? const Text('Please Wait')
                : ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                  var restaurants =snapshot.data?.docs[index];
                    return Column(
                      children: [
                        ProductContainer(name: restaurants!['restaurantName'], image: restaurants['restaurantImage'], rating: restaurants['restaurantRating']),
                        Container(
                          padding: const EdgeInsets.only(left: 5, right:5),
                          width: MediaQuery.of(context).size.width*0.5,
                          child: const Divider(
                            color: Colors.black, 
                            thickness: 2, 
                          )
                        )
                      ]
                    );
                  },
                );
            }
          )
          :GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 10,
              childAspectRatio: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.height/1.35),
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return FoodItem(foodItem: foodItems[index]);
            },
          )
        )
      ]
    );
  }
}

class ProductContainer extends StatelessWidget{
  const ProductContainer({Key? key, required this.name, required this.image, required this.rating}): super(key: key);
  final String name;
  final String image;
  final int rating;
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        margin: const EdgeInsets.only(left:10, right:10),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/"+image, 
                width: double.maxFinite,
                height: 150,
                fit: BoxFit.fitWidth,
                color: const Color.fromARGB(190, 172, 171, 171),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                  ),
                ),
              )
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Row(
                children: <Widget>[
                  Text(
                    rating.toString(),
                    style: const TextStyle(
                      color: Colors.white
                    )
                  ),
                  Icon(
                    Icons.star_border,
                    size: 20*(rating/5),
                    color: Colors.yellow
                  ),
                ],
              )
            )
          ]
        )
      ),
      onTap: (){ Navigator.push(context, MaterialPageRoute(
        builder: (context) => RestaurantPage(image: image, name: name,) ));
      }
    );
  }
}