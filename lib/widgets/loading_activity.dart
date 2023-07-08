import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zone/controllers/theme_controller.dart';
import 'package:zone/utils/dimensions.dart';

class LoadingActivity extends ConsumerWidget {
  const LoadingActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, dynamic> theme = ref.watch(selectThemeProvider);
    return Positioned.fill(
      child: Container(
        width: ScreenDimensions().dim_100(context),
        height: ScreenDimensions().dim_100h(context),
        decoration: BoxDecoration(
          color: theme['background'],
        ),
        child: Center(
          child: Container(
            width: ScreenDimensions().dim_40(context),
            height: ScreenDimensions().dim_40(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: theme['inputFieldLabel'],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitCircle(
                  color: theme['primary'],
                  size: 50,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Please wait...",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
