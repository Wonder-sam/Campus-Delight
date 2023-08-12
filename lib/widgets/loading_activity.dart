import 'package:flutter/material.dart';
import 'package:zone/utils/dimensions.dart';

class LoadingActivity extends StatefulWidget {
  const LoadingActivity({Key? key}) : super(key: key);

  @override
  State<LoadingActivity> createState() => _LoadingActivityState();
}

class _LoadingActivityState extends State<LoadingActivity> with SingleTickerProviderStateMixin {
  late AnimationController loadingController;
  late Animation<double> leftAnimation;
  Size screenSize = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize;
  double ratio = WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

  @override
  void initState() {
    super.initState();
    print(screenSize.width);
    loadingController = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    leftAnimation = Tween<double>(begin: 0, end: screenSize.width / ratio).animate(loadingController);

    loadingController.addListener(() {
      if (leftAnimation.value == screenSize.width / ratio) {
        loadingController.reset();
        loadingController.forward();
      }
      setState(() {});
    });

    loadingController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      left: leftAnimation.value,
      child: Container(
        height: dim_05(context),
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
      ),
    );
  }
}
