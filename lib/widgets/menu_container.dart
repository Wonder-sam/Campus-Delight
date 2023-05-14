import 'package:flutter/material.dart';

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
        margin: const EdgeInsets.all(0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            Image.asset("assets/" + picture),
            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 121, 85, 72),
                padding: const EdgeInsets.all(0),
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