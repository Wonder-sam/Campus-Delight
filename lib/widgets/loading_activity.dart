import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zone/controllers/theme_controller.dart';
import 'package:zone/utils/dimensions.dart';

class LoadingActivity extends ConsumerWidget {
  const LoadingActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, dynamic> theme = ref.watch(selectThemeProvider);
    return Container(
      color: theme['background'],
      width: ScreenDimensions().dim_100(context),
      height: ScreenDimensions().dim_100h(context),
      child: Positioned.fill(
        child: Center(
          child: Container(
            width: ScreenDimensions().dim_50(context),
            height: ScreenDimensions().dim_50(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: theme['inputFieldLabel'],
            ),
            child: SpinKitCircle(
              color: theme['primary'],
              size: 50,
            ),
          ),
        ),
      ),
    );
  }
}
