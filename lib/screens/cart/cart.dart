import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zone/controllers/cart_controller.dart';
import 'package:zone/controllers/shop_controller.dart';
import 'package:zone/controllers/theme_controller.dart';
import 'package:zone/models/cart.dart';
import 'package:zone/utils/dimensions.dart';

class Cart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, dynamic> theme = ref.watch(selectThemeProvider);
    List<CartItem> cartItems = ref.watch(cartProvider);
    Set<String> cartShops = ref.watch(shopProvider);

    double getTotal() {
      var prices = cartItems.map((e) => e.productPrice);
      var total = prices.reduce((value, element) => value + element);
      return total;
    }

    double getSubTotal(String shopName) {
      var prices = cartItems.where((element) => element.shop == shopName).map((e) => e.productPrice);
      var total = prices.reduce((value, element) => value + element);
      return total;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: theme['inputFieldLabel'],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: theme['background'],
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: theme['inputFieldLabel'],
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: dim_10(context)),
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: theme['grey'],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  text: 'items: ',
                  children: [
                    TextSpan(
                      text: cartItems.length.toString(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: theme['background'],
      body: Stack(
        children: [
          ListView.separated(
            padding: EdgeInsets.only(
              top: dim_05(context),
              left: dim_05(context),
              right: dim_05(context),
              bottom: dim_15H(context),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 25),
            itemCount: cartShops.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(dim_05(context))),
                elevation: 0,
                color: theme['brownWrap'],
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: dim_05(context),
                        right: dim_05(context),
                        top: dim_05(context),
                        bottom: dim_05(context),
                      ),
                      decoration: BoxDecoration(
                        color: theme['buttonWrapper'],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(dim_05(context)),
                          bottomRight: Radius.circular(dim_05(context)),
                          topLeft: Radius.circular(dim_05(context)),
                          topRight: Radius.circular(dim_05(context)),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.storefront,
                                color: theme['inputFieldLabel'],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  cartShops.elementAt(index),
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: theme['inputFieldLabel'],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Flexible(
                            child: ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (context, index) => const SizedBox(height: 10),
                              itemCount: cartItems.where((element) => element.shop == cartShops.elementAt(index)).length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: ((context, nindex) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        cartItems.where((element) => element.shop == cartShops.elementAt(index)).elementAt(nindex).productImage,
                                        width: dim_25(context),
                                        height: dim_25(context),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          cartItems.where((element) => element.shop == cartShops.elementAt(index)).elementAt(nindex).productName,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: theme['inputFieldLabel'],
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          cartItems.where((element) => element.shop == cartShops.elementAt(index)).elementAt(nindex).productPrice.toStringAsFixed(2),
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: theme['inputFieldLabel'],
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: theme['brownWrap'],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(dim_05(context)),
                          bottomRight: Radius.circular(dim_05(context)),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: theme['texts'],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            getSubTotal(cartShops.elementAt(index)).toStringAsFixed(2),
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: theme['texts'],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
              initialChildSize: 0.13,
              minChildSize: 0.13,
              maxChildSize: 0.3,
              snap: true,
              snapSizes: [0.13, 0.3],
              builder: (BuildContext context, ScrollController scrollController) {
                return Container(
                  padding: EdgeInsets.only(
                    top: dim_05(context),
                    bottom: dim_05(context),
                    left: dim_05(context),
                    right: dim_05(context),
                  ),
                  decoration: BoxDecoration(
                    color: theme['brownWrap'],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(dim_05(context)),
                      topRight: Radius.circular(dim_05(context)),
                    ),
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Total",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: theme['texts'],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Text(
                                getTotal().toStringAsFixed(2),
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: theme['texts'],
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: null,
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(theme['inputFieldLabel']),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            child: Text(
                              "Checkout",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: theme['background'],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text("further breakdown"),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
