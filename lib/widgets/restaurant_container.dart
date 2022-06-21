import 'package:flutter/material.dart';
import 'package:zone/restaurant/restaurants.dart';

class RestaurantContainer extends StatelessWidget{
  const RestaurantContainer({Key? key, required this.name, required this.image, required this.rating}): super(key: key);
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