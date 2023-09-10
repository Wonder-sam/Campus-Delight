import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zone/controllers/theme_controller.dart';
import 'package:zone/utils/dimensions.dart';

class Profile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, dynamic> theme = ref.watch(selectThemeProvider);
    List options = [
      {
        "name": "Account Settings",
        "icon": Icon(
          Icons.person,
          color: theme['inputFieldLabel'],
        )
      },
      {
        "name": "My Orders",
        "icon": Icon(
          Icons.local_mall,
          color: theme['inputFieldLabel'],
        )
      },
      {
        "name": "Help % Support",
        "icon": Icon(
          Icons.contact_support,
          color: theme['inputFieldLabel'],
        )
      },
    ];
    return Scaffold(
      backgroundColor: theme['background'],
      appBar: AppBar(
        backgroundColor: theme['background'],
        title: Text(
          "Settings",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: theme['primary'],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        // leading: IconButton(
        //   onPressed: () => Navigator.of(context).pop(),
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: theme['primary'],
        //   ),
        // ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: dim_05(context),
          left: dim_05(context),
          right: dim_05(context),
          bottom: dim_15H(context),
        ),
        child: Column(
          children: [
            SizedBox(
              width: dim_90(context),
              height: dim_30(context),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    width: dim_85(context),
                    padding: EdgeInsets.all(dim_05(context)),
                    decoration: BoxDecoration(color: theme['buttonWrapper'], borderRadius: BorderRadius.circular(dim_05(context))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Samuel Sowah Nai",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: theme['primary'],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      width: dim_30(context),
                      height: dim_30(context),
                      decoration: BoxDecoration(
                        color: theme['primary'],
                        borderRadius: BorderRadius.circular(dim_30(context)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(dim_30(context)),
                        child: Image.asset(
                          'assets/user.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: options.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: dim_05(context) / 1.5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: options[index]['icon'],
                      ),
                      Expanded(
                        child: Text(
                          options[index]['name'],
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: theme['primary'],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: theme['inputFieldLabel'],
                          size: dim_05(context),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
