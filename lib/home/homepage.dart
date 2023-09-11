import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zone/controllers/cart_controller.dart';
import 'package:zone/models/carousel.dart';
import 'package:zone/models/cart.dart';
import 'package:zone/screens/cart/cart.dart';
import 'package:zone/utils/dimensions.dart';
import 'package:zone/widgets/product_card.dart';
import '../controllers/theme_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, dynamic> theme = ref.watch(selectThemeProvider);
    List<CartItem> cartItems = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: null,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: null,
          icon: Icon(
            Icons.abc_outlined,
            color: theme['inputFieldText'],
            size: 45,
          ),
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Cart(),
                  ),
                ),
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: theme['inputFieldLabel'],
                ),
              ),
              Positioned(
                top: dim_05(context) / 2.5,
                right: dim_05(context) / 1.7,
                child: Badge(
                  backgroundColor: theme['notify'],
                  label: Text(
                    cartItems.length.toString(),
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: theme['background'],
                        fontWeight: FontWeight.w500,
                        fontSize: 8,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      backgroundColor: theme['background'],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: dim_05(context),
                left: dim_05(context),
                right: dim_05(context),
                bottom: dim_05(context),
              ),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 10),
                  label: Text(
                    "Search",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: theme['inputFieldText'],
                      ),
                    ),
                  ),
                  // prefixIcon: Icon(Icons.search_rounded),
                  icon: MediaQuery.removeViewPadding(
                    removeRight: true,
                    context: context,
                    child: Container(
                      constraints: BoxConstraints.expand(
                        width: dim_12(context),
                      ),
                      child: const Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        color: theme['primary'],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints.expand(width: dim_10(context)),
                  floatingLabelStyle: TextStyle(color: theme['inputFieldLabel']),
                  constraints: BoxConstraints(maxHeight: dim_12(context)),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: dim_100(context),
              height: dim_100(context) * 0.5,
              margin: EdgeInsets.only(
                left: dim_05(context),
                right: dim_05(context),
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: CarouselSlider.builder(
                itemCount: 4,
                options: CarouselOptions(
                  autoPlayCurve: Curves.easeInCubic,
                  initialPage: 2,
                  autoPlay: true,
                  height: dim_100(context) * 0.5,
                  aspectRatio: dim_90(context) / (dim_100(context) * 0.5),
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                ),
                itemBuilder: (context, int itemIndex, int pageViewIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      Carousel.getCarousel()[itemIndex].productImage,
                      width: dim_100(context),
                      height: dim_100(context) * 0.5,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: dim_100(context),
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                  left: dim_05(context),
                  top: dim_05(context),
                ),
                children: [
                  Card(
                    color: theme['primary'],
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                      child: Text(
                        "All",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                      child: Text(
                        "Recommended",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                      child: Text(
                        "Coming Soon",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: dim_05(context),
                top: dim_05(context),
              ),
              child: Text(
                "Cakes & Pastries",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: theme['inputFieldLabel'],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                top: dim_05(context),
                left: dim_05(context),
                right: dim_05(context),
              ),
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: dim_85(context) * 0.5 / (dim_85(context) * 0.5 + dim_30(context)),
                mainAxisSpacing: dim_05(context),
                crossAxisSpacing: dim_05(context),
              ),
              itemBuilder: (BuildContext context, index) {
                return ProductCard(index: index);
              },
            ),
            Padding(
              padding: EdgeInsets.only(
                left: dim_05(context),
                top: dim_05(context),
              ),
              child: Text(
                "Meals",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: theme['inputFieldLabel'],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(
                top: dim_05(context),
                left: dim_05(context),
                right: dim_05(context),
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: dim_85(context) * 0.5 / (dim_85(context) * 0.5 + dim_30(context)),
                mainAxisSpacing: dim_05(context),
                crossAxisSpacing: dim_05(context),
              ),
              itemBuilder: (BuildContext context, index) {
                return ProductCard(index: index);
              },
            ),
          ],
        ),
      ),
    );
    // StreamBuilder<QuerySnapshot>(
    //   stream: FirebaseFirestore.instance.collection("restaurants").doc("restaurant").collection("restaurantList").snapshots(),
    //   initialData: null,
    //   builder: (context, snapshot) {
    //     return !snapshot.hasData? const Text("Empty")
    //       : ListView.builder(
    //         padding: const EdgeInsets.only(top:10),
    //         itemCount: snapshot.data?.docs.length,
    //         itemBuilder: (context, index) {
    //         var restaurants =snapshot.data?.docs[index];
    //           return Column(
    //             children: [
    //               RestaurantContainer(name: restaurants!['restaurantName'], image: restaurants['restaurantImage'], rating: restaurants['restaurantRating'].toDouble()),
    //               Container(
    //                 padding: const EdgeInsets.only(left: 5, right:5),
    //                 width: MediaQuery.of(context).size.width*0.5,
    //                 child: const Divider(
    //                   color: Colors.black,
    //                   thickness: 2,
    //                 ),
    //               ),
    //             ],
    //           );
    //         },
    //       );
    //   },
    // );
  }
}
