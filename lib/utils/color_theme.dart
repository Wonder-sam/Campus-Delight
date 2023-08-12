import 'package:flutter/material.dart';

final Map<String, dynamic> lightTheme = {
  "primary": Colors.brown,
  "themeBackground": ColorScheme.fromSwatch(backgroundColor: Colors.white),
  "background": Colors.white,
  "inputFieldBorder": Colors.brown,
  "inputFieldLabel": Colors.brown,
  "inputFieldText": Colors.black,
  "texts": Colors.white70,
  "buttonWrapper": Colors.grey.shade100,
  "activity": Colors.blue,
};

final Map<String, dynamic> darkTheme = {
  "primary": Colors.brown,
  "themeBackground": ColorScheme.fromSwatch(backgroundColor: Colors.black12),
  "background": Colors.black54,
  "inputFieldBorder": Colors.white,
  "inputFieldLabel": Colors.grey,
  "inputFieldText": Colors.grey,
  "texts": Colors.white70,
  "buttonWrapper": Colors.grey.shade900,
  "activity": Colors.white
};
