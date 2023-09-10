import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zone/utils/dimensions.dart';
import 'package:zone/widgets/photo_hero.dart';

class ProductDetails extends ConsumerWidget {
  ProductDetails({
    Key? key,
    required this.photo,
    required this.onTap,
    required this.width,
    required this.productName,
    required this.productCategory,
    required this.productPrice,
  }) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;
  final String productName;
  final double productPrice;
  final String productCategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // height: dim_100h(context),
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    width: dim_100(context),
                    height: dim_60H(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(dim_10(context)),
                        bottomRight: Radius.circular(dim_10(context)),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          offset: const Offset(0, 10),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(dim_10(context)),
                        bottomRight: Radius.circular(dim_10(context)),
                      ),
                      child: PhotoHero(
                        photo: photo,
                        onTap: onTap,
                        width: width,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: dim_05(context),
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: dim_05(context),
                  right: 0,
                  child: const IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                top: dim_05(context),
                left: dim_05(context),
                right: dim_05(context),
              ),
              width: dim_100(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: productName,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.brown,
                              fontSize: dim_05(context) + 5,
                            ),
                          ),
                          children: [
                            TextSpan(
                              text: "\n" + productCategory,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        productPrice.toStringAsFixed(2),
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: dim_05(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "I am the bone of my sword. Steel is my body and fire is my blood. I have created over a thousand blades; unknown to death"
                    "nor known to life. Through pain i have created many blades. Yet these hands shall never hold anything. So as i pray."
                    "UNLIMITED BLADEWORKS",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  // Text(
                  //   productCategory,
                  //   style: GoogleFonts.poppins(
                  //     textStyle: TextStyle(
                  //       color: Colors.grey.shade500,
                  //       fontSize: 15,
                  //     ),
                  //   ),
                  // ),
                  // Text(productPrice.toStringAsPrecision(2)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
