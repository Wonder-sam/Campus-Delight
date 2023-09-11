import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zone/controllers/theme_controller.dart';
import 'package:zone/utils/dimensions.dart';

class Appearance extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, dynamic> theme = ref.watch(selectThemeProvider);
    String currentTheme = ref.watch(themeProvider);

    List<dynamic> themes = [
      {
        "name": "Default",
        "sub": "Match system theme",
        "value": "default",
        "press": (String? value) => ref.read(themeProvider.notifier).state = value!,
      },
      {
        "name": "Light",
        "sub": "Always light",
        "value": "light",
        "press": (String? value) => ref.read(themeProvider.notifier).state = value!,
      },
      {
        "name": "Dark",
        "sub": "Always dark",
        "value": "dark",
        "press": (String? value) => ref.read(themeProvider.notifier).state = value!,
      }
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme['background'],
        title: Text(
          "Appearance",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: theme['inputFieldLabel'],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: theme['inputFieldLabel'],
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: theme['background'],
      body: ListView(
        padding: EdgeInsets.only(
          top: dim_05(context),
          left: dim_05(context),
          right: dim_05(context),
          bottom: dim_15H(context),
        ),
        children: [
          Text(
            "Select a theme of your choice.",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: theme['grey'],
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: themes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: dim_05(context)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          themes[index]['name'],
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: theme['inputFieldLabel'],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          themes[index]['sub'],
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: theme['grey'],
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Radio<String>(
                      value: themes[index]['value'],
                      groupValue: currentTheme,
                      onChanged: themes[index]['press'],
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return theme['activity'];
                          }
                          return theme['inputFieldText'];
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
