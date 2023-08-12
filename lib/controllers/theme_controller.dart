import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zone/utils/color_theme.dart';

final themeProvider = StateProvider<String>((ref) => "light");

final selectThemeProvider = Provider<Map<String, dynamic>>((ref) {
  final themeType = ref.watch(themeProvider);
  if (themeType == "light") {
    print(themeType);
    return lightTheme;
  } else {
    print("dark");
    return darkTheme;
  }
});
