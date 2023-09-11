import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zone/controllers/theme_controller.dart';
import 'package:zone/firebase/firebase_functions.dart';
import 'package:zone/login.dart';
import 'package:zone/screens/profile/appearance.dart';
import 'package:zone/utils/dimensions.dart';

class Profile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, dynamic> theme = ref.watch(selectThemeProvider);

    List options = [
      {
        "name": "Account settings",
        "icon": Icon(
          Icons.person,
          color: theme['inputFieldLabel'],
        ),
        "press": () => null
      },
      {
        "name": "My orders",
        "icon": Icon(
          Icons.local_mall,
          color: theme['inputFieldLabel'],
        ),
        "press": () => null
      },
      {
        "name": "Appearance",
        "icon": Icon(
          Icons.color_lens,
          color: theme['inputFieldLabel'],
        ),
        "press": () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Appearance()))
      },
      {
        "name": "FAQs",
        "icon": Icon(
          Icons.contact_support,
          color: theme['inputFieldLabel'],
        ),
        "press": () => null
      },
      {
        "name": "Contact customer service",
        "icon": Icon(
          Icons.question_answer_rounded,
          color: theme['inputFieldLabel'],
        ),
        "press": () => null
      },
      {
        "name": "Send a report",
        "icon": Icon(
          Icons.report,
          color: theme['inputFieldLabel'],
        ),
        "press": () => null
      },
    ];

    handleLogout() {
      logout().then((value) {
        if (value == 'success') {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const LoginPage();
          }));
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme['background'],
        title: Text(
          "Settings",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: theme['inputFieldLabel'],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: theme['background'],
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: dim_05(context),
          left: dim_05(context),
          right: dim_05(context),
          bottom: dim_15H(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                              color: theme['inputFieldLabel'],
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
                        color: theme['inputFieldLabel'],
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
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              child: Text(
                "Manage account settings, edit app preference, make reports and chat with customer service ",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: theme['inputFieldLabel'],
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: options[index]['press'],
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: dim_05(context) / 1.2),
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
                                color: theme['inputFieldLabel'],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: theme['inputFieldLabel'],
                          size: dim_05(context),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => handleLogout(),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: dim_10(context),
                    vertical: dim_05(context) / 2,
                  ),
                  margin: EdgeInsets.only(top: dim_05H(context)),
                  decoration: BoxDecoration(
                    color: theme['buttonWrapper'],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "logout",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: theme['inputFieldLabel'],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
