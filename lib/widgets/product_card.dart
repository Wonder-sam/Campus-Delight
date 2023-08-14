import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zone/controllers/product_controller.dart';
import 'package:zone/controllers/theme_controller.dart';
import 'package:zone/models/product.dart';
import 'package:zone/screens/products/product_details.dart';
import 'package:zone/utils/dimensions.dart';
import 'package:zone/widgets/photo_hero.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({Key? key, required this.index, re}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    timeDilation = 1.2;
    List targetProduct = ref.watch(targetProductProvider);
    Map<String, dynamic> theme = ref.watch(selectThemeProvider);

    void check(index) {
      ref.read(targetProductProvider.notifier).state = [0];
      if (targetProduct.contains(index)) {
        targetProduct.remove(index);
      } else {
        targetProduct.add(index);
      }
      ref.read(targetProductProvider.notifier).state = targetProduct;
      print(targetProduct);
    }

    return GestureDetector(
      onTap: () => print("i see"),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Container(
                    constraints: BoxConstraints.tightFor(
                      width: dim_85(context) * 0.5,
                      height: (dim_85(context) * 0.5) + dim_10(context),
                    ),
                    child: PhotoHero(
                      photo: Product.getProducts()[index].productImage,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(
                            photo: Product.getProducts()[index].productImage,
                            onTap: () => null,
                            width: double.infinity,
                            productCategory: Product.getProducts()[index].productCategory,
                            productName: Product.getProducts()[index].productName,
                            productPrice: Product.getProducts()[index].productPrice,
                          ),
                        ),
                      ),
                      width: double.infinity,
                    ),
                  ),
                  targetProduct.contains(index)
                      ? Positioned.fill(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  color: const Color(0xC9795548),
                                  child: Text(
                                    "Add to cart",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 2),
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  color: const Color(0xC9795548),
                                  child: Text(
                                    "Add to Favorite",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 2),
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  color: const Color(0xC9795548),
                                  child: Text(
                                    "Report",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(height: 0),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        Product.getProducts()[index].productName,
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                          ),
                        ),
                      ),
                      Text(
                        Product.getProducts()[index].productName,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade500,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Text(
                        '¢' + Product.getProducts()[index].productPrice.toStringAsFixed(2),
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                            color: theme['primary'],
                          ),
                        ),
                      )
                    ],
                  ),
                  IconButton(
                    constraints: const BoxConstraints.expand(
                      width: 25,
                    ),
                    onPressed: () => check(index),
                    icon: Icon(
                      Icons.more_vert_outlined,
                      color: theme['primary'],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
