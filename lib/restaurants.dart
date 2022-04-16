import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class RestaurantPage extends StatefulWidget{
  const RestaurantPage({Key? key, required this.image, required this.name}): super(key: key);
  final String image;
  final String name;

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage>{
  final menuList = RestaurantMenu.getMenu();

  double containerHeight = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurants")
      ),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              color: Colors.black,
              child: Image.asset("assets/"+widget.image)
            )
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.9,
            minChildSize: 0.4,
            initialChildSize: 0.4,
            builder:(BuildContext context, ScrollController scrollController){
              return ClipRRect(
                borderRadius:  const BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 35, left: 15, right: 15),
                  child:StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('restaurants').doc('menu').collection(widget.name).snapshots(),
                    builder: (context, snapshot) {
                      return !snapshot.hasData? const Text('Please Wait')
                        : ListView.separated(
                          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 5),
                          controller: scrollController,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                          var menu =snapshot.data?.docs[index];
                              return Restaurant(menuItemName: menu!['menuItemName'], menuItemImage: menu['menuItemImage'], 
                              menuItemDescription: menu['menuItemDescription'], restaurantName: widget.name);
                            }
                        );
                    }
                  )
                )
              );
            },
          )
        ]
      )
    );
  }
}

class Restaurant extends StatelessWidget{
  Restaurant({Key? key, required this.menuItemName, required this.menuItemImage, 
  required this.menuItemDescription, required this.restaurantName}): super(key: key);
  final String menuItemName;
  final String menuItemImage;
  final String menuItemDescription;
  final String restaurantName;

  var restaurantList =["Icy Cup", "Golden Pod", "Baba's Special Khebab"];


  @override
  Widget build(BuildContext context){
    return !restaurantList.contains(restaurantName)? 
    MenuContainer(name: menuItemName, picture: menuItemImage, moreInfo: menuItemDescription) :
    ClipRRect(borderRadius: BorderRadius.circular(10),
      child:Slidable(
        key: const ValueKey(0),
        endActionPane:  const ActionPane(
          extentRatio: 1,
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: null,
              flex: 1,
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              icon: Icons.check,
              label: 'Order'
            ),
            SlidableAction(
              onPressed: null,
              flex: 1,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.cancel,
              label: 'Cancel'
            ),
          ]
        ),
        child: MenuContainer(name: menuItemName, picture: menuItemImage, moreInfo: menuItemDescription)
      )
    );
  }
}

class MenuContainer extends StatelessWidget{
  const MenuContainer({Key? key, required this.name, required this.picture, required this.moreInfo}): super(key: key);
  final String name;
  final String picture;
  final String moreInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145,
      child: Card(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            Image.asset("assets/" + picture),
            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 121, 85, 72),
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    ),
                    Text(
                      moreInfo,
                      style: const TextStyle(color: Colors.white)),
                    const Text("Price: 2",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white
                      )
                    ),
                  ],
                )
              )
            )
          ]
        )
      )
    );
  }
  
}
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